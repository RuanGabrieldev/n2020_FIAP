import 'package:flutter/material.dart';
import 'package:n2020/models/game_model.dart';
import 'package:n2020/repository/game_repository.dart';

class GamesScreen extends StatefulWidget {
  @override
  _GamesScreenState createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Jogos"),
      ),
      body: FutureBuilder<List<GameModel>>(
        future: GameRepository().findAllAsync(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: buildListView(snapshot.data),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView buildListView(List<GameModel> games) {
    return ListView.builder(
      itemCount: games == null ? 0 : games.length,
      itemBuilder: (BuildContext ctx, int index) {
        return cardGame(games[index]);
      },
    );
  }

  InkWell cardGame(GameModel game) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          "games_details",
          arguments: game,
        );
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.topLeft,
              // child: Image.asset(
              //   "assets/img/bot1.png",
              //   width: 100,
              // ),
              child: Image.network(
                game.image,
                width: 100,
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          game.titulo,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 5,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15, left: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.people,
                          size: 20,
                          color: Colors.blueGrey,
                        ),
                        Expanded(
                          child: Text(
                            " " + game.pessoas,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.alarm,
                          size: 20,
                          color: Colors.blueGrey,
                        ),
                        Expanded(
                          child: Text(
                            game.duracao,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
