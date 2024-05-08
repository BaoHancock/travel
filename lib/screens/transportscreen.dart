import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
class TransportScreen extends StatefulWidget {
  final String wayto;
  const TransportScreen({super.key, required this.wayto});

  @override
  State<TransportScreen> createState() => _TransportScreenState();
}

class _TransportScreenState extends State<TransportScreen> {
int length=0;
List<String> list=[];

  void fetchbywayto()async{
    http.Response res = await http.get(Uri.parse("https://travel-2.onrender.com/fetchwayto"));
    var data = jsonDecode(res.body);
    list= data;



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(itemCount: list.length,itemBuilder: ((context, index) => Card(child: Text(list[index]),)))
        ],
      ),
    );
  }
}