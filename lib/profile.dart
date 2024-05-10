// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart"as http;
import 'package:lottie/lottie.dart';
class Profile extends StatefulWidget {
  final String username;
   Profile({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

String day='';
String wayto="";
Map<String,String> data={};
String ff="";
List<String> quote=["Congrats, u are exploring world more then me","Whats your next Trip","Could a aarange A Trip"];
class _ProfileState extends State<Profile> {
  void retireve(String username)async{
   data={
    "username":username,
    
  };

  //http code to retireve
   http.Response res = await http.post(Uri.parse("https://travel-2.onrender.com/fetchprofile"),headers: ({"Content-Type":"application/json"}),body: jsonEncode({"username":username}));
  var ata = jsonDecode(res.body);
  day=ata['text'];
  wayto=ata['wayto'];
    final random = new Random();
    var i = random.nextInt(quote.length);
    print(quote[i]);
    ff=quote[i];

setState(() {
  
});
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    retireve(widget.username);

  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             LottieBuilder.asset("images/lottie/car.json"),
             Text(ff),
            Text(data["username"]!.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
           
            Text(day),
            Text(wayto)
            
          ],
        ),
      
      
      ),
    );
  }
}