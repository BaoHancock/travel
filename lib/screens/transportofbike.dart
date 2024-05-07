import 'package:flutter/material.dart';

class Transportbike extends StatefulWidget {
  const Transportbike({super.key});

  @override
  State<Transportbike> createState() => _TransportbikeState();
}

class _TransportbikeState extends State<Transportbike> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Image.asset("images/biketras.png"),Text("Mumbai to Delhi"),Text("We loaded our bikes on Rajdhani, in the same train we travelled to Delhi, packing was arranged by us itself, material used was “EPE Foam - 10 mm thickness”. Ensure proper packing as there are chances of damage. Cost: Rs. 5500/bike Packing: Rs. 750/bike Prajapati : 9324087424 (contact for train booking)")],
      ),
    );
  }
}