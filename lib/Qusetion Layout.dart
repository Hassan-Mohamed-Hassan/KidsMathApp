
import 'package:flutter/material.dart';
import 'package:questions/layout.dart';
import 'package:questions/writen_answer.dart';

import 'levels.dart';

class QusetionLayout extends StatefulWidget {
  static int? x3;
  static int? index;
  static String? type ;

  QusetionLayout(x,String types,index2){
    x3=x;
    type=types;
    index=index2;
  }

  @override
  State<QusetionLayout> createState() => _QusetionLayoutState();

}

class _QusetionLayoutState extends State<QusetionLayout> {
  List<Widget> screen=[
    qustionScreen(QusetionLayout.x3!, QusetionLayout.type!),
    WritenQusetion(QusetionLayout.x3!, QusetionLayout.type!)
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
      leading: IconButton(icon: Icon(Icons.arrow_back_outlined),onPressed: (){Navigator.of(context).pop();},),
        title: Text(
          'أسئلة', style: TextStyle(color: Colors.black, fontSize: 25),),
        ),
      body: screen[QusetionLayout.index!],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Image.asset('images/mcq.png',width: 50),label:'اختر', ),
          BottomNavigationBarItem(icon: Image.asset('images/quiz.png',width: 50),label:'اختبار', ),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label:'الإعدادات', )
        ],
        elevation: 0,
       currentIndex: QusetionLayout.index!,
        onTap: (index){

            setState(() {
              if(index!=2)
                QusetionLayout.index=index;
            });


        },
        
      ),

    );
  }

}


