
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:questions/levels.dart';

import 'layout.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        
        leading:Container(
            child: Image.asset('images/clac.png')),
        title:Text( 'العمليات',style: TextStyle(color: Colors.black,fontSize: 25),),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>lecelsScreen('plus')));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22,right: 8),
                        child: Card(
                          child: Column(
                            children: [
                             Container(

                               width: MediaQuery.of(context).size.width*.4,
                             child: Image.asset('images/plus.png'),
                             ),
                              Text('الجمع',style: TextStyle(color: Colors.black,fontSize: 18),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>lecelsScreen('minse')));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width*.4,
                          height: 190,
                          child: Card(
                            child: Column(
                              children: [
                                Image(image: AssetImage('images/minse.png'),
                                height: 150,
                                  fit: BoxFit.fill,
                                ),
                                Text('الطرح',style: TextStyle(color: Colors.black,fontSize: 18),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>lecelsScreen('multi')));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*.7,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Column(
                              children: [
                                Image.asset('images/multi.png'),
                                Text('الضرب',style: TextStyle(color: Colors.black,fontSize: 18),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ],
        ),
      ),
    );
  }
}
