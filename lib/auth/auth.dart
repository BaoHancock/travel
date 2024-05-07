

import 'package:flutter/cupertino.dart';
import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:shared_preferences/shared_preferences.dart";
import "package:travelme/auth/httperrorhandle.dart";
import "package:travelme/screens/homepage.dart";
class Authserive{

  void Login(
    String email,
    String password,
    String token,
    BuildContext context
  )async{
    try{
      http.Response res= await http.post(Uri.parse("http://192.168.21.184:3000/login"),headers: {"Content-Type":"application/json"},body: jsonEncode({"email":email,"password":password,"token":token}));
      print(res.body);

      bool modified = jsonDecode(res.body)['token'];

      print(modified);

      httperrorhande(modified: modified, onsuccess: () async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setBool("modified", true);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage()));
      });
    }catch(e){
      print(e);

    }
  }
}