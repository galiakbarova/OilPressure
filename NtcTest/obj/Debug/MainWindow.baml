   M S B A M L   `   `   `  ����m  iSystem.Windows.Forms.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35�mclr-namespace:System.Windows.Forms.DataVisualization.Charting;assembly=System.Windows.Forms.DataVisualization/System.Windows.Forms.DataVisualization.Charting  5   	   B >NtcTest, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:NtcTestNtcTest 5   	      NtcTest.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   R NOxyPlot.Wpf, Version=1.0.0.0, Culture=neutral, PublicKeyToken=75e952ba404cdbb0 oxyhttp://oxyplot.org/wpf  5   	   wdvcmclr-namespace:System.Windows.Forms.DataVisualization.Charting;assembly=System.Windows.Forms.DataVisualization  5   	   !localclr-namespace:NtcTest  5   	     � Title$'  !Давление жидкости��5
   	   $��638.75��6#   $��667.5��63    � ShowInTaskbar .  $��14(�6W    � DataContext 5      "  NtcTest.OilPressureViewModel  5   
   .��5      � $	��599��6   $��2,0,-8,0q�6   $��Bottom=�6*    � ColumnDefinitions 5   
   �� 5      .+�5   
   � $��314,60,21,0q�64   $��83��6I   $	��Top=�6U    6   �� *SelectedWell+.+�5      �� -   5         ��Name$ depthTextBlock��5      $)��#Глубина скважины, м��60   $
��Wrap=�6K   $
��Left=�6_   $��25��6z   $	��Top=�6�   $	��169��6�   $��14(�6�   $��12,9,0,0q�6�   �� 5      -   5        $ oilDensityTextBlock��5      $.��(Плотность нефти, кг/м^3��65   $
��Wrap=�6T   $
��Left=�6h   $��25��6�   $��Center=�6�   $	��169��6�   $��14(�6�   $��	12,53,0,5q�6�   �� 5      -   5         ��Name$ depthTextBox��5      $��24��6h    �� TextWrapping$
 Wrap=�6t   $	��Top=�6�   $��14(�6�   $
��Left=�6�   $��65��6�   $��
233,10,0,0q�6�   ��6,   �� *Depth+ �� UpdateSourceTrigger$ PropertyChanged=�6�   �� 5      -   5        $ oilDensityTextBox��5      $
��Left=�6r   $��24��6�   $��
233,52,0,0q�6�   $
 Wrap=�6�   $	��Top=�6�   $��65��6�   $��14(�6�   ��61   �� *
OilDensity+$ PropertyChanged=�6�   5      �� 5   
   -   5         ��Name$ addWellButton��5      $0��*Создать новую скважину��6(   $
��Left=�6l   $��47��6�   $��
35,228,0,0q�6�   $	��Top=�6�   $	��225��6�   $��16(�6�   ��6I   �� *AddWellCommand+6�   �� 5   
   -   5        $ countTextBlock��5      $��326,154,122,0q�6,   $
��Wrap=�6C   $8��2Количество шагов разбиения��6W   $��14(�6y   $��25��6�   $	��Top=�6�   �� 5   
   -   5        $ countTextBox��5      $
��Left=�6d   $��24��6   $��547,154,0,0q�6�   $
 Wrap=�6�   $	��Top=�6�   $��65��6�   $��14(�6�   ��6(   �� *Count+$ PropertyChanged=�6�   �� 5   
   -   5        	 ��Name$	 wellAddingPartLabel��5      $3��-Редактирование скважины��6-   $
��Left=�6O   $��
350,10,0,0q�6j   $��18(�6~   $��39��6�   $	��Top=�6�   �� 5    
   -	   5        $ countPressureButton��5       $)��#Расчитать давление��6.   $��348,228,66,0q�6�   $��16(�6�   $y�Visible=�6�   $��47��6�   $	��Top=�6�   ��6K   �� *CalculatePressureCommand+��6x   �� 
 �� ElementName$
 countTextBox��6�   �� 5!   
   -
   5        $	 wellListPartLabel��5!      $!��Список скважин��6+   $
��Left=�6D   $��68,10,0,409q�6_   $��18(�6t   � 5"   
    � Minimum$ 0Q�6@    � Maximum$	 100Q�6L   $
��Left=�6Z   $��24��6u   $��329,191,0,0q�6�   $	��Top=�6�   $	��303��6�   $y�Visible=�6�    � Value 6   �� *
Percentage+ �� Mode$ OneWay=�6�   &   System.Windows.Controls.DataGrid  5$   
   -   5          Name$ wellListDataGrid��5$      $
��Left=�6q   $	��166��6�   $��	35,49,0,0q�6�   $	��Top=�6�   $	��225��6�      
IsReadOnly .    ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$ 79 6�   ��6-   �� *Wells+ �� SelectedItem 6K   �� *SelectedWell+��5%      �� 5&      .R�5'      �� $��5q�6!   .+�5(      �� $(��"Глубина{Binding Path=Depth}��6"   �� 5)      $1��+Плотность{Binding Path=OilDensity}��6"   5*      5+      5-      �� 5.   
   $
��Left=�6   $	��175��62   $��
304,63,0,0q�6?   $	��Top=�6S   $��5��6k     OxyPlot.Wpf.PlotView  50   
   -   5          Name$
 Plot��50      $��	10,0,0,10q�6?   $
��Left=�6R   $	��622��6m   $	��309��6y   $��Bottom=�6�      Model 6%   �� *	PlotMod+6�   51      52      