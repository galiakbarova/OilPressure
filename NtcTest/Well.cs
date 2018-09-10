using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using OxyPlot;

namespace NtcTest
{
    public class Well : INotifyPropertyChanged
    {
        //Глубина скважины в метрах
        private int depth;
        public int Depth
        {
            get { return depth; }
            set
            {
                if (value < 0)
                    depth = 0;
                else
                    depth = value;
                OnPropertyChanged("Depth");
            }
        }

        //Плотность нефти
        private double oilDensity;
        public double OilDensity
        {
            get { return oilDensity; }
            set
            {
                if (value < 0)
                    oilDensity = 0;
                else
                    oilDensity = value;
                OnPropertyChanged("OilDensity");
            }
        }

        //Расчет давления столба жидкости на заданной глубине
        private double GetPressure(double h)
        {
            return 9.8 * oilDensity * h;
        }

        //Расчет списка значений давления на каждом шаге разбиения
        public List<DataPoint> GetPressureList(int count)
        {
            if (count <= 0)
                return null;

            List<DataPoint> pressure = new List<DataPoint>();
            double step = depth / count;
            double deltaPercentage = 100 / count;
            for (int i = 0; i < count + 1; i++)
                pressure.Add(new DataPoint(i * step, GetPressure(i * step)));
            return pressure;
        }

        //Событие изменения значений свойств
        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName]string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
    }
}
