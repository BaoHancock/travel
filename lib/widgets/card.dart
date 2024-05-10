// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
class Cardsi extends StatefulWidget {
   Cardsi({
    Key? key,
    required this.text,
    required this.url,
    required this.route,
       required this.distance,
  }) : super(key: key);
final String text;
final String url;
final String route;
final String distance;

  @override
  State<Cardsi> createState() => _CardsiState();
}

class _CardsiState extends State<Cardsi> {
 bool wer=false;

final List images =["https://media2.thrillophilia.com/images/photos/000/027/647/original/1614925085_16.jpg?","https://cdn.pixabay.com/photo/2022/09/14/07/15/biker-7453585_640.jpg","https://wallpapercave.com/wp/wp8238830.jpg","https://wallpapercave.com/wp/wp8238830.jpg"];

void senddata()async {
  http.Response res = await http.post(Uri.parse("uri"),headers: ({"Content-Type":"application/json"}),body: jsonEncode({'username':widget.distance,'route':widget.route,'liked':true}));

}

  @override
  Widget build(BuildContext context) {
    
    return Container(
      
      child: Padding(
        
        padding: const EdgeInsets.all(1.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            
          ClipRRect(borderRadius: BorderRadius.circular(20),child: Stack(children: [Image.network(widget.url)])),
          
          Align(alignment: Alignment.bottomLeft,child: Text(" ${widget.text}\n",style: TextStyle(color: const Color.fromARGB(255, 36, 36, 36),fontSize: 30,fontWeight: FontWeight.bold),)),
          // Align(alignment: AlignmentDirectional.topCenter,child: Text(" $route\n\n",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))),
        
          Align(alignment: Alignment.bottomLeft,child: Text("  ${widget.distance}\n\n\n",style: TextStyle(color: const Color.fromARGB(255, 88, 88, 88),fontSize: 20,fontWeight: FontWeight.bold))),
         
          ],
        
        ),
      ),
    );
  }
}
