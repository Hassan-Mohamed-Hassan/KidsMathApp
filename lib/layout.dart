import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';
import 'package:flutter/material.dart';
class qustionScreen extends StatefulWidget {
  static String? type ;
  static int? x3;
  qustionScreen(x,String types){
    type=types;
    x3=x;
  }
  @override
  State<qustionScreen> createState() => _qustionScreenState();
}
int x=7;
int y=5;

late String sum='${x+y}';
late String sum2='${x+y+3}';
late String sum3='${x+y+1}';

late List<Widget> Items;
var pagecontrol=PageController();


class _qustionScreenState extends State<qustionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      print(qustionScreen.x3!);
      x=Random().nextInt(qustionScreen.x3!);
      y=Random().nextInt(qustionScreen.x3!);
      print(x );
    });
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
        child: PageView.builder(
          scrollDirection: Axis.vertical,
        controller: pagecontrol,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder:(context, index,) =>Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(image: AssetImage('images/student.png'),fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,height: 250,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                 if(qustionScreen.type=='plus')
                   Text(replaceFarsiNumber('$x +') ,
                     style: TextStyle(color: Colors.black,fontSize: 55,fontWeight: FontWeight.bold),),

                 if(qustionScreen.type=='plus')
                   Text(replaceFarsiNumber(' $y = ??'),
                     style: TextStyle(color: Colors.black,fontSize: 55,fontWeight: FontWeight.bold),),

               ],),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if(qustionScreen.type=='minse'&&x>=y)
                        Text(replaceFarsiNumber('$x - ') ,
                          style: TextStyle(color: Colors.black,fontSize: 55,fontWeight: FontWeight.bold),),

                      if(qustionScreen.type=='minse'&&x>=y)
                        Text(replaceFarsiNumber('$y = ??'),
                          style: TextStyle(color: Colors.black,fontSize: 55,fontWeight: FontWeight.bold),),

                    ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(qustionScreen.type=='minse'&&x<y)
                      Text(replaceFarsiNumber('$y - ') ,
                        style: TextStyle(color: Colors.black,fontSize: 55,fontWeight: FontWeight.bold),),

                    if(qustionScreen.type=='minse'&&x<y)
                      Text(replaceFarsiNumber('$x = ??'),
                        style: TextStyle(color: Colors.black,fontSize: 55,fontWeight: FontWeight.bold),),

                  ],),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(qustionScreen.type=='multi')
                      Text(replaceFarsiNumber('$x x ') ,
                        style: TextStyle(color: Colors.black,fontSize: 55,fontWeight: FontWeight.bold),),

                    if(qustionScreen.type=='multi')
                      Text(replaceFarsiNumber('$y = ??'),
                        style: TextStyle(color: Colors.black,fontSize: 55,fontWeight: FontWeight.bold),),

                  ],),
                SizedBox(height: 30,),
                if(qustionScreen.type=='plus')
                  Row(children: shuffle(lis('${x+y}','${x+y+3}','${x+y+1}',pagecontrol,context))),
                if(qustionScreen.type=='minse'&&x>=y)
            Row(children: shuffle(lis('${x-y}', '${x-y+3}','${x-y+2}',pagecontrol,context))),
                if(qustionScreen.type=='minse'&&x<y)
            Row(children: shuffle(lis('${y-x}', '${y-x+3}','${y-x+2}',pagecontrol,context))),
                if(qustionScreen.type=='multi')
                  Row(children: shuffle(lis('${x*y}', '${x*y+3}','${x*y+2}',pagecontrol,context))),

              ],),
        onPageChanged: (index){
          if(qustionScreen.type=='plus')
            onchangepluse();
          if(qustionScreen.type=='minse')
            onchangeminse();
          if(qustionScreen.type=='minse')
            onchangeminse();
          if(qustionScreen.type=='multi')
            onchangemulti();
          if(index==14){
            pagecontrol.jumpToPage(pagecontrol.initialPage);

          }
      },

          pageSnapping: false,

        itemCount: 15,
        )


      )

    );
  }
  void onchangepluse(){
    x=Random().nextInt(qustionScreen.x3!);
    y=Random().nextInt(qustionScreen.x3!);
    sum='${x+y}';
    sum2='${x+y+2}';
    sum3='${x+y-2}';
    setState(() {
      shuffle(lis(sum, sum2, sum3,pagecontrol,context));
    });
  }
  void onchangeminse(){
    x=Random().nextInt(qustionScreen.x3!);
    y=Random().nextInt(qustionScreen.x3!);
    if(x<y){
      x=y+5;
    }
    sum='${x-y}';
    sum2='${x-y+2}';
    sum3='${x-y+1}';
    setState(() {
      shuffle(lis(sum, sum2, sum3,pagecontrol,context));
    });
  }
  void onchangemulti(){
    x=Random().nextInt(qustionScreen.x3!);
    y=Random().nextInt(qustionScreen.x3!);
    sum='${x*y}';
    sum2='${x*y+2}';
    sum3='${x*y+1}';
    setState(() {
      shuffle(lis(sum, sum2, sum3,pagecontrol,context));
    });
  }
}
String replaceFarsiNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const farsi =  ['۰', '۱', '۲', '۳', '٤', '٥', '٦', '۷', '۸', '۹'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], farsi[i]);
  }

  return input;
}
List<Widget> lis( sum, random1, random2,PageController controller,context) {
   List<Widget> items = <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CircleAvatar(radius: 40, backgroundColor: Colors.black, child:
      TextButton(onPressed: (){
        final snackBar = SnackBar(
            duration: Duration(seconds: 2),
            content: Center(child: Image.asset('images/images.png')),
          backgroundColor: Colors.white,

        );
        playLocalAsset('audio/good.WAV');
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
  controller.nextPage(duration: Duration(milliseconds: 2100), curve: Curves.fastOutSlowIn);
      },
          child: Text(replaceFarsiNumber(sum),
              style: TextStyle(color: Colors.orangeAccent, fontSize: 30))),),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CircleAvatar(radius: 40, backgroundColor: Colors.black, child:
      TextButton(onPressed: () {
        final snackBar = SnackBar(
          duration: Duration(seconds: 3),
          content: Center(child: Image.asset('images/error.png')),
          backgroundColor: Colors.white,

        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        playLocalAsset2();
        playLocalAsset('audio/3.mp3');
      },
          child: Text(replaceFarsiNumber(random1.toString()),
              style: TextStyle(color: Colors.orangeAccent, fontSize: 30))),),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CircleAvatar(radius: 40, backgroundColor: Colors.black, child:
      TextButton(onPressed: () {
        final snackBar = SnackBar(
          duration: Duration(seconds: 3),
          content: Center(child: Image.asset('images/error.png')),
          backgroundColor: Colors.white,

        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        playLocalAsset2();
        playLocalAsset('audio/3.mp3');
      },
          child: Text(replaceFarsiNumber(random2.toString()),
              style: TextStyle(color: Colors.orangeAccent, fontSize: 30))),),
    ),

  ];
   return items;
}
List<Widget> shuffle(List<Widget> items) {
  var random = new Random();
  // Go through all elements.
  for (var i = items.length - 1; i > 0; i--) {
    // Pick a pseudorandom number according to the list length
    var n = random.nextInt(i + 1);
    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}
Future<AudioPlayer> playLocalAsset(play) async {
  AudioCache cache = AudioCache();
  return await cache.play('$play');
}

Future<AudioPlayer> playLocalAsset2() async {
  AudioCache cache = AudioCache();
  return await cache.play('audio/rong.mp3');
}
