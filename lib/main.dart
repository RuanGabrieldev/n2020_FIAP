import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n2020/screens/apresentation_screen.dart';
import 'package:n2020/screens/instructions_screen.dart';

void main() {
  runApp(GetMaterialApp(
    home: ApresentationScreen(),
    routes: {
      "/instructions": (context) => InstructionsScreen(),
    },
  ));
}
