import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart "as http;
import 'package:shared_preferences/shared_preferences.dart';
class Transportbike extends StatefulWidget {
  const Transportbike({super.key});

  @override
  State<Transportbike> createState() => _TransportbikeState();
}

TextEditingController waytocontroller = TextEditingController();
TextEditingController detailscontroller = TextEditingController();

class _TransportbikeState extends State<Transportbike> {

  void sendtransport()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    String? v= sharedPreferences.getString("hack");
      http.Response res= await http.post(Uri.parse("https://travel-2.onrender.com/transport"),headers: ({"Content-Type":"application/json"}),body: jsonEncode({"username":v,"wayto":waytocontroller.text,"details":detailscontroller.text}));
      print(res.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [Image.asset("images/biketras.png"),SizedBox(height: 20,),Text("Enter Details About Transport",style: TextStyle(fontWeight: FontWeight.w700),),Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(controller: waytocontroller,decoration: InputDecoration(labelText: "Place",helperText: "Place were to transport and click receive"),),
          ),Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(controller: detailscontroller,decoration: InputDecoration(labelText: "Details",helperText: "Enter a details your Transportation like bike ,lugggage"),),
          ),ElevatedButton(onPressed: (){sendtransport();}, child: Text("ADD"))],
        ),
      ),
    );
  }
}