import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:questions/writen_answer.dart';

import 'Qusetion Layout.dart';
import 'layout.dart';

class lecelsScreen extends StatelessWidget {
  String ?type;
  lecelsScreen(String types){
    type=types;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.orange,


    title:Text( 'المستوي',style: TextStyle(color: Colors.black,fontSize: 25),),
          actions: [Container(
            child: Image.asset('images/level.png')),],),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           InkWell(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder:(context)=>QusetionLayout(10,'$type',0)));

             },
             child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(30),
               ),
               width: MediaQuery.of(context).size.width*.8,
               child: Card(child: Text('سهل' ,textAlign:TextAlign.center ,
                 style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),),
             ),
           )  ,
            SizedBox(height: 10,),
            Container( width: MediaQuery.of(context).size.width*.7,
            height: 2,
              color: Colors.orange,

            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
               Navigator.push(context, MaterialPageRoute(builder:(context)=>QusetionLayout(100,'$type',0)));
               /* Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            QusetionLayout(100,'$type',0)),
                        (Route<dynamic> route) =>
                    false);
*/
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                width: MediaQuery.of(context).size.width*.8,
                child: Card(child: Text('صعب' ,
                  textAlign:TextAlign.center ,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),),
              ),
            )  ,
        ],
        ),
      ),

    );
  }
}
