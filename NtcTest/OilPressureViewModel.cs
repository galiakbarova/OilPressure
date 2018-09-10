using System;
using System.Collections.Generic;
using System.Windows.Controls;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.Windows.Input;
using System.Runtime.CompilerServices;
using System.Collections.ObjectModel;
using OxyPlot;
using OxyPlot.Axes;
using OxyPlot.Series;
using System.Threading;


namespace NtcTest
{
    public class OilPressureViewModel : INotifyPropertyChanged
    {
        //Выделенная в таблице скважина
        private Well selectedWell;
        public Well SelectedWell
        {
            get { return selectedWell; }
            set
            {
                selectedWell = value;
                ClearPlot();
                OnPropertyChanged("SelectedWell");
            }
        }

        //Расчитанные значения давления нефти в выделенной скважине с заданным шагом разбиения
        private List<DataPoint> selectedWellPressureList;
        public List<DataPoint> SelectedWellPressureList
        {
            get { return selectedWellPressureList; }
            set
            {
                selectedWellPressureList = value;
                SetupPlotMod();
                OnPropertyChanged("SelectedWellPressreList");
            }
        }

        //Коллекция исследуемых скважин
        public ObservableCollection<Well> Wells { get; set; }

        //График давления
        private PlotModel plotMod;
        public PlotModel PlotMod
        {
            get { return plotMod; }
            set
            {
                plotMod = value;
                OnPropertyChanged("PlotMod");
            }
        }        

        //Конструктор
        public OilPressureViewModel()
        {
            Wells = new ObservableCollection<Well>();
            PlotMod = new PlotModel();
            SelectedWellPressureList = new List<DataPoint>();
        }

        //Обновление графика
        private void SetupPlotMod()
        {
            ClearPlot();
            PlotMod.Title = "График зависимости давления от глубины выбранной скважины";

            PlotMod.Axes.Add(new LinearAxis
            {
                Position = AxisPosition.Bottom,
                Title = "Глубина скважины, м"
            });
            PlotMod.Axes.Add(new LinearAxis
            {
                Position = AxisPosition.Left,
                Title = "Давление, Па"
            });

            LineSeries lineSeries = new LineSeries();
            foreach (var point in SelectedWellPressureList)
                lineSeries.Points.Add(point);

            PlotMod.Series.Add(lineSeries);
            PlotMod.InvalidatePlot(true);
        }

        //Очистка графика
        private void ClearPlot()
        {
            PlotMod.Series.Clear();
            PlotMod.Axes.Clear();
            PlotMod.InvalidatePlot(true);
        }

        //Команда создания новой скважины
        private RelayCommand addWellCommand;
        public RelayCommand AddWellCommand
        {
            get
            {
                return addWellCommand ??
               (addWellCommand = new RelayCommand(obj =>
               {
                   Well well = new Well();
                   Wells.Add(well);
                   SelectedWell = well;
               }));
            }
        }

        //Команда расчета давления в выбранной скважине
        private RelayCommand calculatePressureCommand;
        public RelayCommand CalculatePressureCommand
        {
            get
            {
                return calculatePressureCommand ??
                    (calculatePressureCommand = new RelayCommand(obj =>
                    {
                        if (obj != null)
                        {
                            int count = Convert.ToInt32(((System.Windows.Controls.TextBox)obj).Text);
                            SelectedWellPressureList = SelectedWell.GetPressureList(count);
                        }
                    }));
            }
        }

        //Событие изменения значения свойств
        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName]string prop = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));
        }
    }
}
