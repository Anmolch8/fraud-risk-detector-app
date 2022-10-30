import 'package:flutter/material.dart';
Future<dynamic> result(String s,BuildContext context,String pic){
var size=MediaQuery.of(context).size;
  return showDialog(
     context: context,
     builder: (context){
return Dialog(
  child: Container(width: size.width/30,padding:EdgeInsets.all( size.width/25),
  height: size.height/8,
  color: Color.fromARGB(66, 150, 76, 20),
    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         SizedBox( height: size.height/20,width: size.height/20,
        child: pic=='danger'?
        Image.asset('warning.png',):
        Image.asset('safe.png')),
        Container(alignment: Alignment.center,
           child: Text(s,style: TextStyle(fontSize: size.width/28,fontWeight:FontWeight.bold),),),
      ],
    ),
  ),
);
     }
  );
}