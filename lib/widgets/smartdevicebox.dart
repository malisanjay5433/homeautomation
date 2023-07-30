import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String pathName;
  final bool deviceStatus;
  void Function(bool?) onChanged;
  SmartDeviceBox(
      {super.key,
      required this.smartDeviceName,
      required this.pathName,
      required this.deviceStatus,
      required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: deviceStatus ? Colors.black : Colors.grey[200],
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            pathName,
            height: 50,
            color: deviceStatus ? Colors.white : Colors.black,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    smartDeviceName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: deviceStatus ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              Transform.rotate(
                angle: pi / 2,
                child: CupertinoSwitch(
                  value: deviceStatus,
                  onChanged: onChanged,
                  activeColor: deviceStatus ? Colors.amber : Colors.grey[700],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
