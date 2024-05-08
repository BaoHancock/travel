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
      http.Response res= await http.post(Uri.parse("uri"),headers: ({"Content-Type":"application/json"}),body: jsonEncode({"username":v,"wayto":waytocontroller.text,"details":detailscontroller.text}));
      print(res.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Image.asset("images/biketras.png"),TextField(controller: waytocontroller,),TextField(controller: detailscontroller,)],
      ),
    );
  }
}