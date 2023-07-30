import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:homeautomation/widgets/smartdevicebox.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;
  //smart device list
  List mySmartDevice = [
    ['Smart Light', 'assets/images/light-bulb.png', true],
    ['Smart Tv', 'assets/images/smart-tv.png', false],
    ['Smart AC', 'assets/images/air-conditioner.png', true],
    ['Smart Fan', 'assets/images/fan.png', false]
  ];
  void deviceStatus(bool value, int index) {
    setState(() {
      mySmartDevice[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          //Custom AppBar
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/images/menu.png",
                          height: 40, color: Colors.grey[800]),
                      //person
                      Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.grey[800],
                      )
                    ])),
            const SizedBox(
              height: 20,
            ),
            //Welcome Sanjay
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Home',
                    style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                  ),
                  Text(
                    'SANJAY MALI',
                    style: GoogleFonts.bebasNeue(fontSize: 60),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Divider(
              color: Colors.amber,
              thickness: 3,
            ),
            //Smart home grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const Text(
                'Smart Devices',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: GridView.builder(
                    itemCount: mySmartDevice.length,
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SmartDeviceBox(
                          smartDeviceName: mySmartDevice[index][0],
                          pathName: mySmartDevice[index][1],
                          deviceStatus: mySmartDevice[index][2],
                          onChanged: (value) => deviceStatus(value!, index),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
