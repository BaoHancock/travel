import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelme/profile.dart';
import 'package:travelme/screens/Addnew.dart';
import 'package:http/http.dart' as http;
import 'package:travelme/screens/dissimble.dart';
import 'package:travelme/widgets/card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}
final String card='';
class _HomepageState extends State<Homepage> {
  bool stat =false;
  String? glob = "";
@override
  void initState() {
    // TODO: implement initState
    super.initState();
fetch();

  }
  void fetch()async{
//     http.Response res =await http.post(Uri.parse("http://192.168.196.184:3000/fetch"),headers: ({"Content-Type":"application/json"}),body: jsonEncode({"wayto":"Ladakh"}));
// print(res.body);
SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
glob = sharedPreferences.getString("hack");

setState(() {
  
});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(actions: [IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Profile(username: glob!)));}, icon: Icon(Icons.people))],),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [SizedBox(height: 50,),ClipRRect(borderRadius: BorderRadius.all(Radius.circular(40)),child: Image.asset("images/login.jpg"),),
            
                Expanded(flex: 1,child: DismissibleExample()),
              
              // Cardsi(text: "DAY1",),Cardsi(text: "DAY 2",),Cardsi(text: "DAY 3 ",), Cardsi(text: "DAY 4 ",),Cardsi(text: "DAY 5",), Cardsi(text: "DAY 6",)
            
          ],
        
        
        ),
      ),bottomNavigationBar: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [GestureDetector(onTap: ()  {
        fetch();
        Navigator.pushNamed(context, "/transport");},child: Icon(Icons.route_outlined,size: 20,)),Icon(Icons.train,size: 20,),AnimatedContainer( width: 200,duration: Duration(milliseconds: 2000),child: GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Addnew(username: glob!,)));},child: LottieBuilder.asset("images/lottie/royalfield.json")),),Icon(Icons.all_inbox,size: 20,),Icon(Icons.money,size: 20,)],),
      );
  }
}