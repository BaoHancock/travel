// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Cardsi extends StatelessWidget {
  const Cardsi({
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
  Widget build(BuildContext context) {
    return Card(child: Column(
      children: [
      Image.asset("images/login.jpg",width: 200,height: 100,),
      Text(text),
      Text(route),
      Text(distance),
      ],
    ),
      
    );
  }
}
