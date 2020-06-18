import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InstructionsScreen extends StatefulWidget {
  @override
  _InstructionsScreen createState() => _InstructionsScreen();
}

class _InstructionsScreen extends State<InstructionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 65.0)),
                Image.asset(
                  "assets/img/bot1.png",
                  width: 50,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Botas Bot',
                    style: TextStyle(
                      color: Colors.purple[400],
                      fontSize: 35.0,
                      fontFamily: "Josefin",
                    ),
                  ),
                ),
              ],
            ),
          ),
          elevation: 0.0,
          backgroundColor: Color(0xFFFFFAFA),
          iconTheme: IconThemeData(
            color: Color(0xFF000000),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: _cardSelection(),
      ),
    );
  }

  Container _cardSelection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding:
          EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0, bottom: 30.0),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * .85,
            height: 80,
            padding: EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: () {
                Get.toNamed("/chat");
              },
              child: SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    color: Colors.purple[400],
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 2,
                  ),
                  child: Text(
                    "Conversar com Botas",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: "Josefin",
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            "Se não quiser conversar agora com o Botas, nosso bot, você pode escolher alguma das atividades genéricas sugeridas abaixo.",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontFamily: "Josefin",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          InkWell(
            splashColor: Colors.black.withAlpha(90),
            child: Container(
              height: 200,
              // width: 372,
              child: Text(
                "Passatempos",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                  fontFamily: "Josefin",
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.purple[400],
                  width: 3.0,
                ),
                image: new DecorationImage(
                  image: new AssetImage(
                    "assets/img/puzzle.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              alignment: Alignment(0.0, 0.0),
              margin: new EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 5.0,
              ),
            ),
            onTap: () {},
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
          ),
          InkWell(
            child: Container(
              height: 200,
              // width: 372,
              child: Text(
                "Filmes",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                  fontFamily: "Josefin",
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.purple[400],
                  width: 3.0,
                ),
                image: new DecorationImage(
                  image: new AssetImage(
                    "assets/img/lalaland.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.redAccent,
              ),
              alignment: Alignment(0.0, 0.0),
              margin: new EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 5.0,
              ),
            ),
            onTap: () {},
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
          ),
          InkWell(
            child: Container(
              height: 200,
              // width: 372,
              child: Text(
                "Receitas",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.purple[400],
                  width: 3.0,
                ),
                image: new DecorationImage(
                  image: new AssetImage(
                    "assets/img/recipes.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.redAccent,
              ),
              alignment: Alignment(0.0, 0.0),
              margin: new EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 5.0,
              ),
            ),
            onTap: () {},
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
          ),
          Text(
            "Se quiser sugestões que estão de acordo com seu gosto pessoal, sugerimos que troque uma ideia com o nosso bot.",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15.0,
              fontFamily: "Josefin",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
          ),
        ],
      ),
    );
  }
}
