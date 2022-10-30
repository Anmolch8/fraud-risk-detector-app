import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'button.dart';
import 'apicall.dart';
import 'resultsheet.dart';
void main() {
   WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      configLoading();
  runApp(const MyApp());
}
void configLoading(){
  EasyLoading.instance..indicatorType=EasyLoadingIndicatorType.threeBounce;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fraud Risk Detector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const  MyHomePage(),
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
static buttons bt1=buttons();
  static   buttons bt2=buttons();
     static  buttons bt3=buttons();
       static buttons bt4=buttons();


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

TextEditingController home=TextEditingController();
TextEditingController payment=TextEditingController();
 
  @override
  Widget build(BuildContext context) {

    var s=MediaQuery.of(context).size;
    
  
    return  Scaffold(
        body: Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('10787124.png') ,fit: BoxFit.fill)),
          child: SingleChildScrollView(
            child: Column( crossAxisAlignment: CrossAxisAlignment.start,
              children: [const SizedBox(height: 20,),
             SafeArea(child: Center(
               child: Text("Fraud Risk Detector",style: TextStyle(fontSize:s.width/14,color: Colors.black,fontStyle: FontStyle.italic
               ,fontWeight: FontWeight.bold),),
             )),
            
            Text("1.Give approximate average of payment distances from home ?",
            style: TextStyle(fontSize: s.width/20,fontWeight:FontWeight.bold),),
            Padding(
              padding:  EdgeInsets.only(right: s.width/25,left: s.width/25),
              child: TextField(controller: home,style: TextStyle(fontSize: s.width/20),),
            ),
             SizedBox(height: s.height/20,),
               Text("2.Give distance where you often do payments near you ?",
            style: TextStyle(fontSize: s.width/20,fontWeight:FontWeight.bold),),
            Padding(
              padding:  EdgeInsets.only(right: s.width/25,left: s.width/25),
              child: TextField(controller: payment,style: TextStyle(fontSize: s.width/20,fontWeight:FontWeight.bold),),
            ),
            
                   SizedBox(height: s.height/20,),
                 Text("3.Do you repeat retailer?",
                 
                 style: TextStyle(fontSize: s.width/20,fontWeight:FontWeight.bold),),

               MyHomePage.bt1
                
                ,
      
                        Divider(thickness: s.height/300,color: Colors.black,),
                   Text("4.Do you always use credit/debit card? ",
                   style: TextStyle(fontSize: s.width/20,fontWeight:FontWeight.bold),),   
                  
                   MyHomePage.bt2,
                          Divider(thickness: s.height/300,color: Colors.black,),
            Text("5.Do you use pin at different places?",
            style: TextStyle(fontSize: s.width/20,fontWeight:FontWeight.bold),),
            MyHomePage.bt3,
                   Divider(thickness: s.height/300,color: Colors.black,),
            Text("6.Do you order online from differnt apps/sites ?",
            style: TextStyle(fontSize: s.width/20,fontWeight:FontWeight.bold),),
          MyHomePage.bt4,
          Divider(thickness: s.height/300,color: Colors.black,),
          Center(
            child: SizedBox(width: s.width/1.5,
              child: ElevatedButton(onPressed: (){
                if(payment.text.isNotEmpty || home.text.isNotEmpty){
                  
                  EasyLoading.show(status: "Fetching perdiction", );

                res(s1:double.parse(home.text),s2:double.parse(payment.text)).then((value) {
                if(value.toString()=='1'){
                  result("You are in danger of a credit card fraud", context,'danger');
                  EasyLoading.dismiss();
                }
                else{
                    result("You are safe from credit card fraud", context,'safe');
                    EasyLoading.dismiss();
                }
                }
                                  );
                }
                else{
                  
                  SnackBar snackBar= const SnackBar(content:Text('Fill the distances'),duration: Duration(seconds: 1),);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                
                }
                
                
              }, child: Text("Check"
              ,style: TextStyle(fontSize: s.height/20),),style:ElevatedButton.styleFrom(
                  
                primary:const Color.fromARGB(255, 14, 122, 210)
              ),),
            ),
          ),
                   ]),
          ),
        ),)
        
    ;
  }
}
