import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:lottie/lottie.dart';
import 'package:travelme/screens/displaydetails.dart';
import 'package:travelme/screens/onclickdata.dart';
class TransportScreen extends StatefulWidget {
 
  const TransportScreen({super.key});

  @override
  State<TransportScreen> createState() => _TransportScreenState();
}

class _TransportScreenState extends State<TransportScreen> {
int length=4;
List<String> list=[];

  Future <Map<String,dynamic>> fetchbywayto()async{
    http.Response res = await http.get(Uri.parse("https://travel-2.onrender.com/fetchwayto"));
    var data = jsonDecode(res.body);
     var tot=  data["total"];
    print(data);
    for(var i=0;i<tot;i++){
      list.add(data["${i}"]);
    }
 

return data;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
   
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: fetchbywayto(),
        builder:(context,snapshot){ if(snapshot.connectionState==ConnectionState.waiting){return Center(child: LottieBuilder.asset("images/lottie/campass.json",width: 120,height: 120,));}return SafeArea(
          child: ListView.builder(itemCount: list.length,itemBuilder: ((context, index) => GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Onclickdata(wayto: list[index])));},child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoContextMenu(actions: [ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Onclickdata(wayto: list[index])));}, child: Text("Details About Trip")),ElevatedButton(onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>displaydetails(wayto:list[index])));}, child: Text("Transport Load"))],
            child: Card(elevation: 20,child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(list[index],style: TextStyle(fontSize: 20),),
            )), ),
          )))),
        );}
      ),
    );
  }
}