
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class FloatingBTN extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
              onPressed: () {
                Get.toNamed("/chat");
              },
              label: Text("Conversar"),
              elevation: 3,
              icon: Icon(Icons.chat),
              backgroundColor: Colors.purple,
            );
  }
}