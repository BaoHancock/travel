import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelme/auth/login.dart';
import 'package:travelme/profile.dart';
import 'package:travelme/screens/Addnew.dart';
import 'package:travelme/screens/alldata.dart';
import 'package:travelme/screens/dissimble.dart';

import 'package:travelme/screens/homepage.dart';
import 'package:travelme/screens/post.dart';

import 'package:travelme/screens/transportofbike.dart';

void main() {
  runApp( const MyApp());
 
}
String? token = "";
bool tt = false;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    saw();
    

   
  }
  void saw()async{
   SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
  String? dd = sharedPreferences.getString("hack");
  
token =dd;
print(token);
if(token!=null){
  tt=true;
  print(tt);
  setState(() {
    
  });
  return;

}
tt=false;

}
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Take me to ladakh',
      theme: ThemeData.dark(
      
        
        
      ),
      initialRoute: '/',
      routes: {
        "/": (context)=> tt?Homepage():Login(),
        "/transport":(context)=>Transportbike(),
        "/home-screen":(context)=>Homepage(),
       

      },
     
    );
  }}