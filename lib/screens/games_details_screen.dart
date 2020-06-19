import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:n2020/models/game_model.dart';

class GamesDetalhesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameModel gameModel = ModalRoute.of(context).settings.arguments;

    Column stepList(List<GameStep> list) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: list
              .map(
                (step) => step.imageUrl == null
                    ? Text(
                        step.text,
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                        textAlign: TextAlign.left,
                      )
                    : Column(
                        children: [
                          Image.network(
                            step.imageUrl,
                            height: 200,
                            alignment: Alignment.center,
                          ),
                          Text(
                            step.text,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 16),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
              )
              .toList());
    }

    Padding listTitle(String title) {
      return Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: Colors.black87,
          ),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(gameModel.titulo),
              background: Image.network(
                gameModel.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.people,
                            size: 30,
                            color: Colors.blue,
                          ),
                          Expanded(
                            child: Text(
                              " Jogadores: " + gameModel.pessoas,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.alarm,
                            size: 30,
                            color: Colors.deepOrange,
                          ),
                          Expanded(
                            child: Text(
                              " Duração: " + gameModel.duracao,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                listTitle("Regras"),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(gameModel.regras),
                ),
                listTitle("Como Jogar"),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: stepList(gameModel.steps),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
              ],
            ),
          )
        ],
      ),
      // Column(
      //   children: <Widget>[
      //     topContent,
      //     bottomContent,
      //   ],
      // ),
    );
  }
}
