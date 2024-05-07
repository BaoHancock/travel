import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travelme/screens/homepage.dart';
import 'package:http/http.dart'as http;
class Addnew extends StatefulWidget {
  final String username;
  const Addnew({super.key, required this.username});

  @override
  State<Addnew> createState() => _AddnewState();
}
TextEditingController textEditingController = TextEditingController();
TextEditingController RoutesEditingController = TextEditingController();
TextEditingController DisttanceEditingController = TextEditingController();
TextEditingController RaodconditionEditingController = TextEditingController();
TextEditingController MostimportEditingController = TextEditingController();
TextEditingController whretostayEditingController = TextEditingController();

class _AddnewState extends State<Addnew> {
  void cardpost()async{
  http.Response res = await http.post(Uri.parse("http://192.168.196.184:3000/entry"),headers: ({"Content-Type":"application/json"}),body: jsonEncode({"username":widget.username,"text":textEditingController.text,"Route":RoutesEditingController.text,"Distance":DisttanceEditingController.text,"Roadcondition":RaodconditionEditingController.text,"Mostimport":MostimportEditingController.text,"whretostay":whretostayEditingController.text,"wayto":"Ladakh"}));
print(res.body);  
  

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text(widget.username),TextField(controller:textEditingController),
        TextField(controller: RoutesEditingController,),
        TextField(controller: DisttanceEditingController,),
        TextField(controller: RaodconditionEditingController,),
        TextField(controller: MostimportEditingController,),
        TextField(controller: whretostayEditingController,),ElevatedButton(onPressed: (){
          
          cardpost();
          
          }, child: Text("data"))],
      ),
    );
  }
}