import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:travelme/screens/alldata.dart';
import 'package:travelme/screens/transportofbike.dart';
import 'package:travelme/widgets/card.dart';
class Onclickdata extends StatefulWidget { 
final String wayto;
   const Onclickdata({super.key, required this.wayto});
  
  @override 
  _OnclickdataState createState() => _OnclickdataState(); 
} 
  

class _OnclickdataState extends State<Onclickdata> { 
  
  // Sample list of items 
 
  List<String> itemsDay = []; 
  List<String> itemsroute = []; 
  List<String> itemsDistance = []; 
  List<String> itemsRoadCondition = []; 
  List<String> itemsMostimort = []; 
  List<String> itemswhretostay = []; 
  int lengtht=4;
// final List images =["https://media2.thrillophilia.com/images/photos/000/027/647/original/1614925085_16.jpg?","https://cdn.pixabay.com/photo/2022/09/14/07/15/biker-7453585_640.jpg","https://wallpapercave.com/wp/wp8238830.jpg","https://images.unsplash.com/photo-1581793745862-99fde7fa73d2?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bGFkYWtofGVufDB8fDB8fHww","https://vibrant.holiday/media_images/package/images/15657804171.webp","https://cdn.pixabay.com/photo/2016/11/21/17/44/arches-national-park-1846759_640.jpg","https://images.pexels.com/photos/1371360/pexels-photo-1371360.jpeg?cs=srgb&dl=pexels-te-lensfix-380994-1371360.jpg&fm=jpg","https://cdn.pixabay.com/photo/2016/07/30/00/03/winding-road-1556177_1280.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1mX5tYGg1p77_VotjmE5uxCnlyVGOgX2EYJfxqYBU7w&s","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE_H5iFuGPWLyU5Sbjcp_BmfhkZg8WftbtVvFpIt23Mg&s"];
final List images=[];
    void fetch()async{
    http.Response len =await http.post(Uri.parse("https://travel-2.onrender.com/fetchcountmong"),headers: ({"Content-Type":"application/json"}),body: jsonEncode({"wayto":widget.wayto}));
 http.Response url =await http.post(Uri.parse("https://travel-2.onrender.com/fetchurl"),headers: ({"Content-Type":"application/json"}),body: jsonEncode({"wayto":widget.wayto}));

    http.Response day =await http.post(Uri.parse("https://travel-2.onrender.com/fetchday"),headers: ({"Content-Type":"application/json"}),body: jsonEncode({"wayto":widget.wayto}));
 http.Response route =await http.post(Uri.parse("https://travel-2.onrender.com/fetchroute"),headers: ({"Content-Type":"application/json"}),body: jsonEncode({"wayto":widget.wayto}));
 http.Response distance =await http.post(Uri.parse("https://travel-2.onrender.com/fetchdistance"),headers: ({"Content-Type":"application/json"}),body: jsonEncode({"wayto":widget.wayto}));
//  http.Response roadconditon =await http.post(Uri.parse("http://192.168.70.184:3000/fetchRoadcondition"),headers: ({"Content-Type":"application/json"}),body: jsonEncode({"wayto":"Ladakh"}));
//  http.Response mostimport =await http.post(Uri.parse("http://192.168.70.184:3000/fetchmostimport"),headers: ({"Content-Type":"application/json"}),body: jsonEncode({"wayto":"Ladakh"}));
//  http.Response stay =await http.post(Uri.parse("http://192.168.70.184:3000/fetchwheretosttay"),headers: ({"Content-Type":"application/json"}),body: jsonEncode({"wayto":"Ladakh"}));

  print(url.body);
  var ourl = jsonDecode(url.body);
  var olen = jsonDecode(len.body);
  var oday=jsonDecode(day.body);
  var oroute=jsonDecode(route.body);
  var odistance=jsonDecode(distance.body);
  // var oroad=jsonDecode(roadconditon.body);
  // var omostimprot=jsonDecode(mostimport.body);
  // var ostay=jsonDecode(stay.body);

 
  for(int i =0;i<olen;i++){
     images.add(ourl["${i}"]);
    itemsDay.add(oday["${i}"]);
    itemsroute.add(oroute["${i}"]);
    itemsDistance.add(odistance["${i}"]);
    // itemsDay.add(oroad["${i}"]);
    // itemsDay.add(omostimprot["${i}"]);
    // itemsDay.add(ostay["${i}"]);
     
  };
  setState(() {
    
  });

   

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
      fetch();
      
  
    
  }
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
       
      ), 
      body: Column(
        children: [
          Expanded(
            child: ListView.builder( 
              scrollDirection: Axis.horizontal,
              itemCount: itemsDay.length, 
              itemBuilder: (context, index) { 
                final day = itemsDay[index];
                final imagesa=images[index]; 
                final route = itemsroute[index];
                final distance = itemsDistance[index]; 
                // final road = itemsRoadCondition[index];
                // final mostim = itemsMostimort[index]; 
                // final stay = itemswhretostay[index];
                return GestureDetector(onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: ((context) => WeatherScreen(distance: distance, wayto: "Ladkh")))),child: Cardsi(text: day, url: imagesa, route: route,distance:distance ,));
                // return Dismissible( 
                //   key: Key(item), // Unique key for each item 
                //   onDismissed: (direction) { 
                //     // Remove the item from the list when dismissed 
                //     if(index==0){
                //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Transportbike()));
                //     }
                    
              
                //     // Show a snackbar to indicate item removal 
                //     ScaffoldMessenger.of(context).showSnackBar( 
                //       SnackBar( 
                //         content: Text('$item dismissed'), 
                //       ), 
                //     ); 
                //   }, 
                //   background: Container( 
                //     color: Colors.red, // Background color when swiping 
                //     child: Icon( 
                //       Icons.delete, 
                //       color: Colors.white, 
                //       size: 36, 
                //     ), 
                //     alignment: Alignment.centerRight, 
                //     padding: EdgeInsets.only(right: 20), 
                //   ), 
                //   child: ListTile(leading: Text(""),
                //     title: Text(item)
                //     , 
                //   ), 
                // ); 
              }, 
            ),
          ),
          Expanded(child: Container())
        ],
      ), 
    ); 
  } 
} 