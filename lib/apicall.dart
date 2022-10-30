import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';
Future<int> res({double s1=0.0,double s2=0.0})async{
  int yesno1=MyHomePage.bt1.yestrue;
  int yesno2=MyHomePage.bt2.yestrue;
  int yesno3=MyHomePage.bt3.yestrue;
  int yesno4=MyHomePage.bt4.yestrue;
//var uri=Uri.parse('https://credit-fraud-detector.herokuapp.com/pre?home_distance=6&last_transaction=23&retailer=1&card=0&pin=1&order=0');
var uri=Uri.parse('https://credit-fraud-detector.herokuapp.com/pre?home_distance=$s1&last_transaction=$s2&retailer=$yesno1&card=$yesno2&pin=$yesno3&order=$yesno4');
var response=await  http.get(uri);
print(response.body);
  Map<String, dynamic> user = jsonDecode(response.body);
   //print(user['perdiction']);
   if(user["prediction"]==1){
    return 1;
   }else{
    return 0;
   }
}
