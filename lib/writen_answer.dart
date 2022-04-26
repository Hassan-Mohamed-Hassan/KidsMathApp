import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Qusetion Layout.dart';
class WritenQusetion extends StatefulWidget {
  static int? x3;
  static String? type ;
  WritenQusetion(x,String types){
    x3=x;
    type=types;
  }
 
  @override
  State<WritenQusetion> createState() => _WritenQusetionState();
}

class _WritenQusetionState extends State<WritenQusetion> {



   int count=0;
  var Control=TextEditingController();
  var pagecontrol=PageController(viewportFraction: .8);
   var formkey= GlobalKey<FormState>();
   bool button=true;
  final List<TextEditingController> cont = List.generate(10, (index) =>TextEditingController());

  

  String replaceFarsiNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi =  ['۰', '۱', '۲', '۳', '٤', '٥', '٦', '۷', '۸', '۹'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], farsi[i]);
    }
    return input;
  }
  List<int> xnumber=[Random().nextInt(WritenQusetion.x3!),Random().nextInt(WritenQusetion.x3!),
    Random().nextInt(WritenQusetion.x3!),
    Random().nextInt(WritenQusetion.x3!),Random().nextInt(WritenQusetion.x3!),
    Random().nextInt(WritenQusetion.x3!),Random().nextInt(WritenQusetion.x3!),
    Random().nextInt(WritenQusetion.x3!),Random().nextInt(WritenQusetion.x3!),Random().nextInt(WritenQusetion.x3!),
  ];
  List<int> ynumber=[Random().nextInt(WritenQusetion.x3!),Random().nextInt(WritenQusetion.x3!),
    Random().nextInt(WritenQusetion.x3!),
    Random().nextInt(WritenQusetion.x3!),Random().nextInt(WritenQusetion.x3!),
    Random().nextInt(WritenQusetion.x3!),Random().nextInt(WritenQusetion.x3!),
    Random().nextInt(WritenQusetion.x3!),Random().nextInt(WritenQusetion.x3!),Random().nextInt(WritenQusetion.x3!),
  ];
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key:formkey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                  itemBuilder:(context, index,){
                      if(index!=10&&xnumber[index]<=100&&ynumber[index]<=100) {
                        if (WritenQusetion.type == 'plus')
                          return methodPlus(xnumber[index], ynumber[index], xnumber[index] + ynumber[index], index);

                        else if(WritenQusetion.type == 'minse'){
                        if(xnumber[index]>ynumber[index])return methodMinse(xnumber[index], ynumber[index], xnumber[index] - ynumber[index], index);
                        else return methodMinse(ynumber[index],xnumber[index],ynumber[index]-xnumber[index] , index);
                        }
                        else
                          return methodMultible(xnumber[index], ynumber[index], xnumber[index] * ynumber[index], index);
                      }
                      return  buttonmethod();

                  },
                      separatorBuilder: (context,index)=>SizedBox(height: 20,),
                      itemCount: 11
                  ),
                ),
              ),


            ],
          ),
        ),

    );
  }

  Widget methodPlus(x,y,sum,index){
   return Row(
     children: [
       Expanded(
         child:   Row(

     children: [

         Text(replaceFarsiNumber('$x +') ,
           style: TextStyle(color: Colors.black,fontSize: 55,fontWeight: FontWeight.bold),),

         Text(replaceFarsiNumber(' $y = ?'),
           style: TextStyle(color: Colors.black,fontSize: 55,fontWeight: FontWeight.bold),),

     ],),
       ),

       Container(
         width: 100,
         child: TextFormField(
           keyboardType: TextInputType.number,
           controller: cont[index],
           maxLines: 1,
           validator: (value){
             if(value!.isNotEmpty){
               int contr=int.parse(cont[index].text);
               if( sum!=contr) {
                 return '  الناتج $sum ';
               }
               else{
                 count+=1;
                 return null;
               }

             }
             if(value.isEmpty) {
               return 'الناتج: $sum';

             }
           },

            decoration: InputDecoration(
             hintText: 'الاجابة؟؟',
              errorStyle: TextStyle(fontWeight: FontWeight.w800,fontSize: 15),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
             border:OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),
             ),

           ),

         ),
       ),
     ],
   );

}
  Widget methodMinse(x,y,result,index){
   return Row(
     children: [
       Expanded(

         child: Row(

   children: [

       Text(replaceFarsiNumber('$x -') ,
    style: TextStyle(color: Colors.black,fontSize: 55,fontWeight: FontWeight.bold),),

    Text(replaceFarsiNumber(' $y = ?'),
    style: TextStyle(color: Colors.black,fontSize: 55,fontWeight: FontWeight.bold),),

    ],)),

       Container(
         width: 100,
         child: TextFormField(
           keyboardType: TextInputType.number,
           controller: cont[index],
           maxLines: 1,
           validator: (value){
             if(value!.isNotEmpty){
               int contr=int.parse(cont[index].text);
               if( result!=contr) {
                 return '  الناتج $result ';
               }
               else{
                 count+=1;
                 return null;
               }

             }
             if(value.isEmpty) {
               return 'الناتج: $result';

             }
           },

            decoration: InputDecoration(
             hintText: 'الاجابة؟؟',
              errorStyle: TextStyle(fontWeight: FontWeight.w800,fontSize: 15),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
             border:OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),
             ),

           ),

         ),
       ),
     ],
   );

}
  Widget methodMultible(x,y,result,index){
   return Row(
     children: [
       Expanded(
         child:  Row(

           children: [

             Text(replaceFarsiNumber('$x x') ,
               style: TextStyle(color: Colors.black,fontSize: 55,fontWeight: FontWeight.bold),),

             Text(replaceFarsiNumber(' $y = ?'),
               style: TextStyle(color: Colors.black,fontSize: 55,fontWeight: FontWeight.bold),),

           ],)

       ),

       Container(
         width: 100,
         child: TextFormField(
           keyboardType: TextInputType.number,
           controller: cont[index],
           maxLines: 1,
           validator: (value){
             if(value!.isNotEmpty){
               int contr=int.parse(cont[index].text);
               if( result!=contr) {
                 return '  الناتج $result ';
               }
               else{
                 count+=1;
                 return null;
               }

             }
             if(value.isEmpty) {
               return 'الناتج: $result';

             }
           },

            decoration: InputDecoration(
             hintText: 'الاجابة؟؟',
              errorStyle: TextStyle(fontWeight: FontWeight.w800,fontSize: 15),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
             border:OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),
             ),

           ),

         ),
       ),
     ],
   );

}
 Widget result3( int count)  {
    if(count<5)
        return  Padding(
            padding: EdgeInsets.all(50),
            child:Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(replaceFarsiNumber("$count /10 ") ,
                  style: TextStyle(color: Colors.orangeAccent,fontSize: 50,fontWeight: FontWeight.bold),),
                Text(replaceFarsiNumber(" حاول مرة اخري   ") ,
                  style: TextStyle(color: Colors.orangeAccent,fontSize: 20,fontWeight: FontWeight.bold),),


              ],
            ));
     if(count>=5&&count < 8)
        return Padding(
          padding: EdgeInsets.all(50),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(replaceFarsiNumber("$count /10 ") ,
                style: TextStyle(color: Colors.orangeAccent,fontSize: 50,fontWeight: FontWeight.bold),),
              Text(replaceFarsiNumber(" جيد   ") ,
                style: TextStyle(color: Colors.orangeAccent,fontSize: 30,fontWeight: FontWeight.bold),),

            ],
          ),);
       else
        return Padding(
          padding: EdgeInsets.all(50),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(replaceFarsiNumber("$count /10 ") ,
              style: TextStyle(color: Colors.orangeAccent,fontSize: 50,fontWeight: FontWeight.bold),),
            Text(replaceFarsiNumber(" ممتاز   ") ,
              style: TextStyle(color: Colors.orangeAccent,fontSize: 30,fontWeight: FontWeight.bold),),

          ],
        ),);



}
 Widget buttonmethod()=>Container(
   width: double.infinity,
   color: Colors.black,
   child:button? MaterialButton(
   onPressed: (){
   setState(() {
   button=false;
   formkey.currentState!.validate();
   final  snackBar = SnackBar(
   duration: Duration(seconds: 3),
   content:result3(count),
   backgroundColor: Colors.white,

   );
   ScaffoldMessenger.of(context).showSnackBar(snackBar);
   });
   //print(count);
   },
   child: Text('التصحيح',
   style: TextStyle(backgroundColor: Colors.black,
   color: Colors.orangeAccent,fontSize: 30,fontWeight: FontWeight.bold),),
   ):MaterialButton(
   onPressed: (){
   setState(() {
   button=true;
   Navigator.pushReplacement(
   context,
   MaterialPageRoute(
   builder: (BuildContext context) => QusetionLayout(WritenQusetion.x3!,WritenQusetion.type!,1)));
   });
   //print(count);
   },
   child: Text('امتحان جديد',
   style: TextStyle(backgroundColor: Colors.black,color: Colors.orangeAccent,fontSize: 30,fontWeight: FontWeight.bold),),
   ),
   );

}
