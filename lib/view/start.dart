import 'package:flutter/material.dart';
import 'package:internship/model/Budgetmodel.dart';
import 'package:internship/model/bargraph/bargraph.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
   var  Title=TextEditingController();
   var amount=TextEditingController();
   var  id=TextEditingController();
   var enterdate=TextEditingController();
    //var date=TextEditingController();
    DateTime date=DateTime.now();
  // var description=TextEditingController();
   List <Budget> showlist=[];
   List<double> weeklysummery=[
    
   4.40,
   70.50,
   42.42,
   10.50,
   100.20,
   88.99,
   90.10
       

   ];
 
   
     
   
  @override
  Widget build(BuildContext context) {

    var height=MediaQuery.sizeOf(context).height;
    var width=MediaQuery.sizeOf(context).width;
    
 
    void donedel(index){
      {
        showlist.removeAt(index);
      }
      setState(() {
        
      });
    }

    Widget budgetbox(index){
           return Card(elevation:10,color: Colors.white10,
             child: Container(
              height:height*0.12,width:width*0.93,decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),border: Border.all(color:Colors.blueGrey,width:0.2)
              ),
             child:Row(children: [
              CircleAvatar(radius:45,backgroundColor:Colors.black12,child:Text('${showlist[index].amount}',style:TextStyle(fontSize:30,),),)
              ,Container(height: height*0.11,width:width*0.3,color: Colors.transparent,child: Column(children: [
                SizedBox(height:15,),
                Text('${showlist[index].item}',style: TextStyle(fontSize:20,color:Color.fromARGB(255, 228, 87, 134)),),Padding(
                  padding: const EdgeInsets.only(left:07,top:4),
                  child: Text('${date.day.toString()}-${date.month.toString()}-${date.year.toString()}',style: TextStyle(fontSize:9,color:Colors.deepPurple),),
                )],),)
                ,Spacer()
                ,IconButton(onPressed: (){donedel(index);}, icon:Icon(Icons.delete,size:40,color: Color.fromARGB(255, 157, 20, 10),))
             ],),
             ),
           );
    }

    // Widget budgetshow(){
    //       return Center(child: Column(children: [
    //          Container(height: height*1,width:width*1,decoration:BoxDecoration(image: DecorationImage(image:NetworkImage('https://e0.pxfuel.com/wallpapers/239/17/desktop-wallpaper-iphone7-blue-space-gradation-blur-black-blur-thumbnail.jpg'),fit:BoxFit.cover)),
    //          child: Column(children: [
    //           SizedBox(height:96,),
    //           Container(height:height*0.3,width:width*0.9,decoration:BoxDecoration(border: Border.all(width:0.4,color:Colors.white),   borderRadius: BorderRadius.circular(20)),)
    //            ,SizedBox(height:36,)
             
             
    //          ],),
    //          )

    //       ],),);
    // }

      Widget write(TextEditingController controller,String hint){
    return Container(height:height*0.1,width:width*0.6,color:Colors.transparent,
      child: Column(
        children: [
          TextField(
               
            controller:controller,
            decoration:InputDecoration(
              labelText: '${hint}',labelStyle: TextStyle(color:Color.fromARGB(255, 244, 168, 229)),
              contentPadding: EdgeInsets.only(left:64),
              hintText:hint,enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.blueGrey)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 232, 137, 168)))),
          ),
        ],
      ),
    );
   };

void datepicker(){
  showDatePicker(context: context, 
  initialDate: DateTime.now(), 
  firstDate: DateTime(2020),
   lastDate: DateTime(2030)).then((value) => {
     setState(() {
      date=value!;
    
      
     },)
    
   });
}

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(title:Text('My budget planner',style:TextStyle(color: const Color.fromARGB(255, 212, 138, 163)),),backgroundColor:Colors.transparent,),

       body:Column(children: [ 
        SizedBox(height:85,)
                 ,Container(height:height*0.39,width:width*0.96,child: bargraph(weeklysummery:weeklysummery),
                 decoration:BoxDecoration(border: Border.all(width:0.4,color:Colors.white),   borderRadius: BorderRadius.circular(10)),)
        ,Expanded(child:ListView.builder(
         itemCount: showlist.length,shrinkWrap: true,
         itemBuilder: (context, index) => budgetbox(index),
         ) )
       ],)
        

        
        

      
       
       
        

       ,floatingActionButton: FloatingActionButton.extended(onPressed: (){
         
         
    showModalBottomSheet(context:context,builder:(context) =>Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),
      image:DecorationImage(image: NetworkImage('https://i.pinimg.com/564x/69/47/e7/6947e7db9f61a8912fccbc0216f4f880.jpg'),fit: BoxFit.cover),
      border: Border.all(width:0.2,color:Colors.white10)),
    child:Column(children: [
      ListTile(title:Text('write here',style:TextStyle(fontFamily:'schyler',color:Colors.blueGrey),),
      trailing:IconButton(onPressed:(){Navigator.of(context).pop();},icon:Icon(Icons.close,size:30,color:Colors.black,)))
      
      ,write(Title, 'Enter Item')
      ,SizedBox(height:20,)
      ,write(amount, 'Enter amount')
      ,SizedBox(height:20,)

   ,MaterialButton(onPressed: (){
                  datepicker();
   },child: Text('Choose Date',style:TextStyle(color:Colors.blueGrey),),)

    ,ElevatedButton(onPressed: ()
    {
      // String id=id.text;
      String item=Title.text;
      String price=amount.text;
      DateTime value=DateTime.now();
      DateTime date=value!;
      Budget expense= Budget(item: item, amount: price, date: date, );
      //Budget dayshow=Budget(amount:price,date: date,item: item );
      
                        showlist.add(expense);
                        setState(() {});
                        Navigator.pop(context);
                 
    }, 
    child:Text('Ok noted'))
    ],),),);


       },focusColor:Colors.black, label: Icon(Icons.add)),
    );
  }
}