import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:internship/model/bargraph/bardata.dart';

class bargraph extends StatelessWidget {
  final List weeklysummery;
  const bargraph({super.key,required this.weeklysummery});

  @override
  Widget build(BuildContext context) {
    Bardata mybardata=Bardata(
        sunamount:weeklysummery[0],
        monamount:weeklysummery[1],
        tueamount:weeklysummery[2],
        wedamount:weeklysummery[3],
        thuamount:weeklysummery[4],
        friamount:weeklysummery[5],
        satamount:weeklysummery[6],


    );
    mybardata.initialisebardata();
    return BarChart(
      BarChartData(
        maxY:100,
        minY: 0,
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles:AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles:AxisTitles(sideTitles: SideTitles(showTitles: true,getTitlesWidget:bottomTitles )),  
        ),
        barGroups: mybardata.bardata.map((data) => BarChartGroupData(
          x:data.x,
          barRods:[ BarChartRodData(
          toY:data.y,
          borderRadius:BorderRadius.circular(4),
          
        color:Color.fromARGB(231, 225, 83, 125))]
        )).toList()
      )
    );
  }
}
Widget bottomTitles(double value,TitleMeta meta){
  const style=TextStyle(
    color:Colors.white,
    fontWeight: FontWeight.bold,
    fontSize:14
  );
  Widget title;
switch(value.toInt()){
  case 0:
  title=const Text('su',style: style,);
  break;
  case 1:
  title=const Text('mo',style: style,);
  break;
  case 2:
  title=const Text('tu',style: style,);
  break;
  case 3:
  title=const Text('we',style: style,);
  break;
  case 4:
  title=const Text('th',style: style,);
  break;
  case 5:
  title=const Text('fr',style: style,);
  break;
  case 6:
  title=const Text('sa',style: style,);
  break;
   default:
  title=const Text('',style: style,);
  break;

}
// return SideTitleWidget(child:text, axisSide: meta.axisSide);
return SideTitleWidget(child: title, axisSide: meta.axisSide);
}









