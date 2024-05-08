// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Cardsi extends StatelessWidget {
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

final List images =["https://media2.thrillophilia.com/images/photos/000/027/647/original/1614925085_16.jpg?","https://cdn.pixabay.com/photo/2022/09/14/07/15/biker-7453585_640.jpg","https://wallpapercave.com/wp/wp8238830.jpg","https://wallpapercave.com/wp/wp8238830.jpg"];
  @override
  Widget build(BuildContext context) {
    
    return Card(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
        ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.network(url,width: 200,height: 130,)),
        Text(text),
        Text(route),
        Text(distance),
        ],
      ),
    ),
      
    );
  }
}
