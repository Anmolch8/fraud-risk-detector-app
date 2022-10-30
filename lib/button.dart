import 'package:flutter/material.dart';
import 'custombutton.dart';

class buttons extends StatefulWidget {
   buttons({ Key? key }) : super(key: key);
  RadioItem yes=RadioItem(buttonText: 'yes',isSelected: false);
     RadioItem no=RadioItem(buttonText: 'no',isSelected: false);
        var yestrue=0;
    
    
  @override
  State<buttons> createState() => _buttonsState();
}
//enum selection{no,yes}
//selection? sel;
class _buttonsState extends State<buttons> {
 
  @override
  Widget build(BuildContext context) {
    
   var s=MediaQuery.of(context).size;

    return 
  
        Row(mainAxisAlignment: MainAxisAlignment.center,
      
          children: [
          // SizedBox(width: s.width/3.8,
          //   child: ElevatedButton(onPressed: (){}, child: Text("yes"),style:ElevatedButton.styleFrom(
                
          //     primary: Colors.blue
          //   ),),
          // ),
         
          //   Padding(
          //     padding:  EdgeInsets.all(s.width/15),
          //     child: SizedBox(width:s.width/3.8 ,
          //       child: ElevatedButton(onPressed: (){}, child: Text("No"),style:ElevatedButton.styleFrom(
//           //       primary: Colors.blue
//           // ),),
//           //     ),
//           //   )
//   Radio(value: selection.yes, groupValue: sel, 
//   activeColor: Colors.black,
//   onChanged: (selection? value){
//     setState(() {
//       sel=value;
//     });
//   }),
//     Radio(value: selection.no, groupValue: sel, 
//     activeColor: Colors.black,
    
//     onChanged: (selection? value){
//  setState(() {
//    sel=value;
//  });
//   })    
          InkWell(onTap: () {
            setState(() {
              widget.yes.isSelected=true;
              widget.no.isSelected=false;
              widget.yestrue=1;
            });
          },child: CustomRadio(widget.yes)),
          Padding(
            padding:  EdgeInsets.all(s.height/20),
            child: InkWell(
              onTap: () {
                setState(() {
                 widget.yes.isSelected=false;
              widget.no.isSelected=true;
              widget.yestrue=0;
                });
              },
              child: CustomRadio(widget.no)),
          )
          ] 
        ) ;
  }
}
