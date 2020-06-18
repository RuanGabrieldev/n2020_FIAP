import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget {
  final String route;
  
  BottomNavigation(this.route);
 
  @override
  Widget build(BuildContext context) {
    return Container(
              height: 50,
              child: BottomAppBar(
                elevation: 10,
                shape: CircularNotchedRectangle(),
                notchMargin: 10.0,
                color: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: IconButton(
                        icon: Icon(Icons.home),
                        onPressed: () => Navigator.of(context).pushReplacementNamed("/home"),
                      
                      ),

                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () => Navigator.of(context).pushReplacementNamed("/settings"),
                      ),
                    ),
                  ],
                ),
              ),
            );
  }
}