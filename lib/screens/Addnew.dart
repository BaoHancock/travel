import 'dart:convert';

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travelme/screens/homepage.dart';
import 'package:http/http.dart'as http;
import 'package:travelme/utils.dart';
import 'package:travelme/widgets/notifi.dart';
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
String downloadUrl="";
bool goturl = false;
double slider=0;
int bad=0;
int good = 0;
class _AddnewState extends State<Addnew> {
  List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Ladakh"),value: "Ladakh"),
    DropdownMenuItem(child: Text("Amritsar"),value: "Amritsar"),
    DropdownMenuItem(child: Text("Kelash"),value: "Kelash"),
    DropdownMenuItem(child: Text("Taj Mahal"),value: "Taj Mahal"),
  ];

  return menuItems;
}
 String selectedValue = "Ladakh";
List<String> list=[];
 String textt="";
  Future <Map<String,dynamic>> fetchbywayto()async{
    http.Response res = await http.get(Uri.parse("https://travel-2.onrender.com/fetchwayto"));
    var data = jsonDecode(res.body);
    
    var tot=  data["total"];
    for(var i=0;i<tot;i++){
      list.add(data["${i}"]);
      
    }
 

return data;
  }
  void cardpost()async{
  http.Response res = await http.post(Uri.parse("https://travel-2.onrender.com/entry"),headers: ({"Content-Type":"application/json"}),body: jsonEncode({"username":widget.username,"text":textEditingController.text,"Route":RoutesEditingController.text,"Distance":DisttanceEditingController.text,"Roadcondition":textt,"Mostimport":MostimportEditingController.text,"whretostay":whretostayEditingController.text,"wayto":selectedValue,"downloadurl":downloadUrl}));
print(res.body); 
 
  

}
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      floatingActionButton: IconButton(onPressed: ()async{
       File? selectedImage =await  getImageFromGallery(context);
        print(selectedImage);
        if(selectedImage!=null){
          downloadUrl = await uploadfileforuser(selectedImage);
         print(downloadUrl);
         setState(() {
           goturl =true;
         });


        }
      }, icon: goturl?const Icon(Icons.done):const Icon(Icons.camera)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10,),
                Text(widget.username.toUpperCase(),style: const TextStyle(fontWeight: FontWeight.bold),),SizedBox(height: 5,),TextField(controller:textEditingController,decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Enter your DAY"),),
             const  SizedBox(height: 10,),
              TextField(controller: RoutesEditingController,decoration:const InputDecoration(border: OutlineInputBorder(),hintText: "Routes"),),
             const SizedBox(height: 10,),
              TextField(controller: DisttanceEditingController,decoration: const InputDecoration(border: OutlineInputBorder(),hintText: " Distance")),
            const  SizedBox(height: 10,),
              
              Column(
                children: [
                  Row(children: [Text("$bad Bad Road"),Align(alignment: Alignment.centerRight,child: Text("$good Good Road"))],),
                  Slider(value: slider, onChanged: (value){
                    setState(() {
                      slider = value;
                      double temp =value*100;
                      bad = temp.toInt();
                      good = 100-bad;

                    });
                  textt = "$bad Bad Road and $good good Road ";
                    
                  }),
                ],
              ),
              TextField(controller: MostimportEditingController,decoration: const InputDecoration(border: OutlineInputBorder(),hintText: " Most Important"),maxLines: 5),
              const SizedBox(height: 10,),
              TextField(controller: whretostayEditingController,decoration: const InputDecoration(border: OutlineInputBorder(),hintText: "Where to Stay")),
                     DropdownButton(
                  value: selectedValue,
                  onChanged: (String? newValue){
                    setState(() {
            selectedValue = newValue!;
                    });
                  },
                  items: dropdownItems
                  ),
              ElevatedButton(onPressed: (){
                
                // cardpost();
            
          
                
                }, child: Text("ADD Your Journey"))],
            ),
          ),
        ),
      ),
    );
  }
}