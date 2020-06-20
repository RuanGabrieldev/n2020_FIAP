import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n2020/components/bottom_navigation.dart';
import 'package:n2020/components/floating_btn.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                //cabeçalho
                Container(
                    height: MediaQuery.of(context).size.height * .37,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * .25,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  colors: [
                                Color.fromRGBO(224, 86, 253, 1.0),
                                Color.fromRGBO(190, 46, 221, 1.0)
                              ])),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.height * .35,
                                height: MediaQuery.of(context).size.height * .20,
                              ),
                            )),
                        Align(
                          alignment: Alignment(0, -0.8),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage("assets/img/profilejpg.jpg"),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 0.2),
                          child: Text(
                            "Ruan Gabriel!",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Josefin",
                                fontSize: 30,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 0.4),
                          child: Text(
                            "São Paulo",
                            style: TextStyle(
                                color: Colors.black38,
                                fontFamily: "Josefin",
                                fontSize: 20,
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ],
                    ),
                  ),

                //opçoes
                Flexible(
                  child: Column(
                    children: <Widget>[
                      SwitchListTile(
                        secondary: Icon(Icons.notifications_active),
                        title: Text("Notificações"),
                        value: checked, 
                        onChanged: (value){
                           checked ? checked = false : checked = true;
                          setState(() {          
                          });
                        },   
                      ),

                      GestureDetector(
                        onTap: () => Get.toNamed("/security"),
                        child: ListTile(
                          leading: Icon(Icons.security),
                          title: Text("Segurança"),
                        ),
                      ),

                      GestureDetector(
                        onTap: () => Get.toNamed("/terms"),
                        child: ListTile(
                          leading: Icon(Icons.sort),
                          title: Text("Termos de uso"),
                        ),
                      )
                    ],
                  ),
                )

              ],
            ),
          ),

          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingBTN(),
            bottomNavigationBar: BottomNavigation("/settings")

        )
      ),
    );
  }
}
