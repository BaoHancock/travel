// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String username;
   Profile({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}
Map<String,String> data={};
void retireve(String username){
   data={
    "username":username,
    "password":"fkfdsfk"
  };

  //http code to retireve


}
class _ProfileState extends State<Profile> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    retireve(widget.username);

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Text(data["username"]!),
          ListView.builder(itemCount: 4,itemBuilder: (context,index)=> Container())
        ],
      ),


    );
  }
}