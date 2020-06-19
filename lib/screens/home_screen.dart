import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n2020/components/bottom_navigation.dart';
import 'package:n2020/components/floating_btn.dart';
import 'package:n2020/services/spotify_api.dart';

class HomeScreen extends StatelessWidget {
  SpotifyApiBotas api = SpotifyApiBotas();

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
=======
    api.getMusic();
>>>>>>> 64a58aeb9966ee76656dd7601ddddb8908c989a3
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
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
                            "Oi, eu sou o Botas!",
                            style: TextStyle(
                                color: Colors.black38,
                                fontFamily: "Josefin",
                                fontSize: 20),
                          ),
                          Text(
                            "Vamos conversar?",
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

                  //Cartd da Frase do dia
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Frase do dia!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Josefin",
                                  fontSize: 20),
                            ),
                            Divider(),
                            Text(
                              "Não importa o que você decidiu. O que importa é que isso te faça feliz.",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontFamily: "Josefin",
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text("O que fazer hoje?",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Josefin",
                          fontSize: 30)),
                  SizedBox(
                    height: 20,
                  ),
                  //List das sugestões
                  Flexible(
                    child: GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: <Widget>[
<<<<<<< HEAD
                        GestureDetector(
                          onTap: () => Get.toNamed("/music"),
                          child: cards(
                              icon: Icons.casino,
                              title: "Jogos",
                              description: "Divirta-se com a familia"),
=======
                        cards(
                          icon: Icons.casino,
                          title: "Jogos",
                          description: "Divirta-se com a familia",
                          redirect: "/games",
>>>>>>> 64a58aeb9966ee76656dd7601ddddb8908c989a3
                        ),
                        cards(
                            icon: Icons.movie_filter,
                            title: "Filmes",
                            description: "Veja os melhores"),
                        GestureDetector(
                          onTap: () => Get.toNamed("/music"),
                          child: cards(
                              icon: Icons.library_music,
                              title: "Músicas",
                              description: "Vamos relaxar?"),
                        ),
                        cards(
                          icon: Icons.receipt,
                          title: "Receitas",
                          description: "Cozinhar sempre é bom!",
                          redirect: "/recipes",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingBTN(),
            bottomNavigationBar: BottomNavigation("/settings")),
      ),
    );
  }

  InkWell cards({
    @required IconData icon,
    @required String title,
    @required String description,
    String redirect,
  }) {
    return InkWell(
      onTap: () {
        if (redirect != null) {
          Get.toNamed(redirect.toString());
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Stack(
            children: <Widget>[
              Icon(
                icon,
                color: Colors.purple,
                size: 50,
              ),
              Positioned(
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Josefin",
                          fontSize: 30),
                    ),
                    Text(description,
                        style: TextStyle(
                            color: Colors.black38,
                            fontFamily: "Josefin",
                            fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
