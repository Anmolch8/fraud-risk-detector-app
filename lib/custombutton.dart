import 'package:flutter/material.dart';
class CustomRadio extends StatelessWidget {
RadioItem item;
CustomRadio(this.item);
 

  @override
  Widget build(BuildContext context) {
var size=MediaQuery.of(context).size;
    return Container(

    width: size.width/4,height: size.height/15,
      child: Center(child: Text(item.buttonText.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: size.width/18),)),
      decoration: BoxDecoration(color: item.isSelected==true?Color.fromARGB(226, 93, 137, 39):Colors.blue,borderRadius: BorderRadius.all(Radius.elliptical(size.width/10, size.width/20))),
    );
  }
}
class RadioItem {
  bool? isSelected;
  String? buttonText;
  RadioItem({this.buttonText,this.isSelected});
}