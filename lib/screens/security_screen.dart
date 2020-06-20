import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SecurityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
            body: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  //Container de apresentação
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "Está tudo bem?!",
                            style: TextStyle(
                                color: Colors.black38,
                                fontFamily: "Josefin",
                                fontSize: 20),
                          ),
                          Text(
                            "Eu me importo com você!",
                            style: TextStyle(
                                color: Colors.black, fontFamily: "Josefin"),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/img/bot1.png",
                          width: 90,
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Esta em uma emergência?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Josefin",
                                  fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                            Divider(),
                            Text(
                              "Ligue agora e peça socorro!!",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontFamily: "Josefin",
                                  fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                            Divider(),
                            
                            Column(
                              children: <Widget>[
                                Divider(),
                                 Text(
                              "Violência contra a mulher?",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontFamily: "Josefin",
                                  fontSize: 25),
                              textAlign: TextAlign.center,
                            ),

                                Container(
                                  width: MediaQuery.of(context).size.width * .8,
                                  height: 40,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(20.0)),
                                    color: Colors.red,
                                    onPressed: () {
                                     launch("tel:180");
                                    },
                                    child: Text(
                                      "Ligar",
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "Josefin",
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                 Divider(),
                              ],
                            ),

                            Column(
                              children: <Widget>[
                                Divider(),
                                 Text(
                              "Policia militar",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontFamily: "Josefin",
                                  fontSize: 25),
                              textAlign: TextAlign.center,
                            ),

                                Container(
                                  width: MediaQuery.of(context).size.width * .8,
                                  height: 40,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(20.0)),
                                    color: Colors.red,
                                    onPressed: () {
                                      launch("tel:190");
                                    },
                                    child: Text(
                                      "Ligar",
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "Josefin",
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                 Divider(),
                              ],
                            ),

                            Column(
                              children: <Widget>[
                                Divider(),
                                 Text(
                              "Bombeiros",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontFamily: "Josefin",
                                  fontSize: 25),
                              textAlign: TextAlign.center,
                            ),

                                Container(
                                  width: MediaQuery.of(context).size.width * .8,
                                  height: 40,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(20.0)),
                                    color: Colors.red,
                                    onPressed: () {
                                      launch("tel:193");
                                    },
                                    child: Text(
                                      "Ligar",
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "Josefin",
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                 Divider(),
                              ],
                            ),

                            Column(
                              children: <Widget>[
                                Divider(),
                                 Text(
                              "SAMU",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontFamily: "Josefin",
                                  fontSize: 25),
                              textAlign: TextAlign.center,
                            ),

                                Container(
                                  width: MediaQuery.of(context).size.width * .8,
                                  height: 40,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(20.0)),
                                    color: Colors.red,
                                    onPressed: () {
                                      launch("tel:192");
                                    },
                                    child: Text(
                                      "Ligar",
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "Josefin",
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                 Divider(),
                              ],
                            ),
                          ],
                        ),
                      )),
                ])))),
      ),
    );
  }






}
