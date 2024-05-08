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
  http.Response res = await http.post(Uri.parse("https://travel-2.onrender.com/entry"),headers: ({"Content-Type":"application/json"}),body: jsonEncode({"username":widget.username,"text":textEditingController.text,"Route":RoutesEditingController.text,"Distance":DisttanceEditingController.text,"Roadcondition":RaodconditionEditingController.text,"Mostimport":MostimportEditingController.text,"whretostay":whretostayEditingController.text,"wayto":"Ladakh"}));
print(res.body);  
  

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Text(widget.username,style: TextStyle(fontWeight: FontWeight.bold),),TextField(controller:textEditingController,decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Enter your DAY"),),
            SizedBox(height: 10,),
            TextField(controller: RoutesEditingController,decoration: InputDecoration(border: OutlineInputBorder(),),),
            SizedBox(height: 10,),
            TextField(controller: DisttanceEditingController,decoration: InputDecoration(border: OutlineInputBorder())),
            SizedBox(height: 10,),
            TextField(controller: RaodconditionEditingController,decoration: InputDecoration(border: OutlineInputBorder()),maxLines: 2,),
            SizedBox(height: 10,),
            TextField(controller: MostimportEditingController,decoration: InputDecoration(border: OutlineInputBorder()),maxLines: 5),
            SizedBox(height: 10,),
            TextField(controller: whretostayEditingController,decoration: InputDecoration(border: OutlineInputBorder())),ElevatedButton(onPressed: (){
              
              cardpost();
              
              }, child: Text("data"))],
          ),
        ),
      ),
    );
  }
}