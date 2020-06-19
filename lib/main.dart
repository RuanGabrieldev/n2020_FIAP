import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n2020/screens/apresentation_screen.dart';
import 'package:n2020/screens/chat_screen.dart';
import 'package:n2020/screens/home_screen.dart';
import 'package:n2020/screens/music_screen.dart';
import 'package:n2020/screens/settings_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: ApresentationScreen(),
      theme: ThemeData(
        primaryColor: Colors.purple[400]
      ),
      initialRoute: "/",
      namedRoutes: {
        "/" : GetRoute(page: ApresentationScreen()),
        "/chat" : GetRoute(page: ChatScreen()),
        "/home" : GetRoute(page: HomeScreen()),
        "/settings" : GetRoute(page: SettingsScreen()),
        "/music" : GetRoute(page: MusicScreen())
      },

  ));
}
