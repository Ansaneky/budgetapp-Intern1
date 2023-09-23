import 'package:internship/model/bargraph/individualbar.dart';

class Bardata{

  final double sunamount;
  final double monamount;
  final double tueamount;
  final double wedamount;
  final double thuamount;
  final double friamount;
  final double satamount;
  Bardata({
    required this.sunamount,
    required this.monamount,
    required this.tueamount,
    required this.wedamount,
    required this.thuamount,
    required this.friamount,
    required this.satamount});
  List<Individualbar>bardata=[];
  void initialisebardata(){
    bardata=[
        Individualbar(x:0,y:sunamount),
        Individualbar(x:1,y:monamount),
        Individualbar(x:2,y:tueamount),
        Individualbar(x:3,y:wedamount),
        Individualbar(x:4,y:thuamount),
        Individualbar(x:5,y:friamount),
        Individualbar(x:6,y:sunamount)


    ];


  }

}