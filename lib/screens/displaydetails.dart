import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class displaydetails extends StatefulWidget {
  final String wayto;
  const displaydetails({super.key, required this.wayto});

  @override
  State<displaydetails> createState() => _displaydetailsState();
}
String way='';
String details='';
class _displaydetailsState extends State<displaydetails> {
  void fetch()async{
  http.Response day =await http.post(Uri.parse("https://travel-2.onrender.com/displaydetails"),headers: ({"Content-Type":"application/json"}),body: jsonEncode({"wayto":widget.wayto}));
  var dd=jsonDecode(day.body);
  way=dd[0]['wayto'];
  details=dd[0]['details'];
  
  setState(() {
    
  });

  }
  @override
  void initState() {
   
    super.initState();
    fetch();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
               Text(way,style: TextStyle(fontSize: 20),),
              Text(details)
            ],
          ),
        ),
    );
  }
}