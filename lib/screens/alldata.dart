import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
class WeatherScreen extends StatefulWidget {
   final String distance;
   final String wayto;
  const WeatherScreen({super.key,required this.distance,required this.wayto});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
   double temp=0;
 
  @override
  void initState() {
    super.initState();
    GetcurrentWEather();
  }
Future <Map<String,dynamic>> GetcurrentWEather() async {

  try{
    // String Cityname="London";
    final res = await http.post(Uri.parse("http://192.168.250.184:3000/fetch"),headers: ({"Content-Type":"application/json"}),body: jsonEncode({"Distance":widget.distance}));

    final  data = jsonDecode(res.body);
    
    // if(data['apikey']!= '37c7b8a3-6617-44ab-9f44-690bd5aa4004'){
    //   throw 'An  Excepted error';
    //
    // }

      // temp =
// final da={
  
//   "text": 'DAY 1',
//   "Route": 'Delhi>Ludhiana>Jalandhar>Udhamur',
//   "Distance": '611kms',
//   "Roadcondition": '80% good highways, 20% bad roads & ghats',
//   "Mostimport": 'Take less breaks, ride consistently,the route is very long and last 100kms is bad roads & very tiring',
//   "whretostay": 'Only ride',

// };

// final bro = jsonDecode(data);
print(data);
return data;
  }
  catch(e){
    throw e.toString();
  }
}

  @override
  Widget build(BuildContext context) {
    //
    return  Scaffold(
      appBar: AppBar(
        title:  Text(widget.wayto,style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){if (kDebugMode) {
            print("object");
          }}, icon: const Icon(Icons.refresh))

                ],
      ) ,
      body:  FutureBuilder(
        future: GetcurrentWEather(),
        builder:(context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return LottieBuilder.asset("images/lottie/java.json");
          }

          final data = snapshot.data!;
          final intro = data["text"];
          final route =data ['Route'];
          final  Distance = data["Distance"];
          final Roadcondition = data['Roadcondition'];
          final Mostimport = data['Mostimport'];
          final whretostay = data['whretostay'];

          return Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

                SizedBox(

                  width: double.infinity,

                    child: Card(
                      elevation: 10,

                      child:  ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter:ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                        child:   Column(
                          children: [
                            Text("$intro",style: const TextStyle(fontSize: 40),),
                            const SizedBox(height: 20),
                            //  Icon(foricons == 'Clouds' || foricons == 'Rain' ? Icons.cloud : Icons.beach_access,size: 60,),
                            // const SizedBox(height: 10),
                             Text("$route",style: const TextStyle(fontSize: 20),),
                             Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text(Distance)
                            ),

                          ],
                        ),
                    ),
                      ),
                  ),
                ),


               const SizedBox(height: 20),
             


               const SizedBox(height: 20),
              const Text("Most Imp ",textAlign: TextAlign.start,),
               Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    Text("$Mostimport",style: const TextStyle(fontSize: 20),),

                    Text("WHat to do??"),
                      Text("$whretostay",style: const TextStyle(fontSize: 20),),
                  
                ],
              ),

            ],
    ),
        );
        },
      ),
    );
  }
}
// class weatherforecast extends StatelessWidget{

//   final String time;
//   final String temp;
//   final IconData icon;

//   const weatherforecast({super.key, required this.time, required this.temp, required this.icon});

//   @override
//   Widget build(BuildContext context) {

//   return  SizedBox(
//     width: 120,
//     child: Card(

//       child: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: Column(
//           children: [
//             Text(time,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
//             Icon(icon),
//             const SizedBox(height: 5),
//             Text(temp),
//           ],
//         ),
//       ),
//     ),
//   );
//   }

// }