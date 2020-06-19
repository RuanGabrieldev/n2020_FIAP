import 'package:flutter/material.dart';
import 'package:n2020/services/spotify_api.dart';
import 'package:spotify/spotify.dart' as spotifyapi;
import 'package:url_launcher/url_launcher.dart';

class MusicScreen extends StatelessWidget {
  SpotifyApiBotas spotify = SpotifyApiBotas();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
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
                            "Vai uma música ai?!",
                            style: TextStyle(
                                color: Colors.black38,
                                fontFamily: "Josefin",
                                fontSize: 20),
                          ),
                          Text(
                            "Vou lançar a braba",
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
                              "Sabe qual a playlist que ta bombando?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Josefin",
                                  fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                            Divider(),
                            FutureBuilder(
                                future:
                                    spotify.getMusic("37i9dQZEVXbMDoHDwVN2tF"),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return CircularProgressIndicator();
                                  }
                                  List<spotifyapi.Track> tracks =
                                      snapshot.data[1].toList();

                                  return Column(
                                    children: <Widget>[
                                      Text(
                                        snapshot.data[0].name,
                                        style: TextStyle(
                                            color: Colors.purple,
                                            fontFamily: "Josefin",
                                            fontSize: 25),
                                      ),
                                      Divider(),
                                      SizedBox(
                                        height: 30,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              "Abrir no Spotify",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontFamily: "Josefin",
                                                  fontSize: 10),
                                            ),
                                            IconButton(
                                                padding: EdgeInsets.zero,
                                                iconSize: 30,
                                                icon: Icon(
                                                  Icons.play_arrow,
                                                  color: Colors.green,
                                                ),
                                                onPressed: () {
                                                  print(snapshot.data[0].id);
                                                  launch("https://open.spotify.com/playlist/" + snapshot.data[0].href);
                                                }),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Sabe quais eu indico para você?",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Josefin",
                                            fontSize: 30),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Divider(),
                                      SingleChildScrollView(
                                        child: Column(
                                            children: tracks
                                                .map((e) => GestureDetector(
                                                  onTap: ()=> launch("https://open.spotify.com/track/" + e.id),
                                                  child: ListTile(
                                                        title: Text(
                                                          e.name.toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                        leading: Image.network(e
                                                            .album
                                                            .images
                                                            .first
                                                            .url),
                                                        subtitle: Column(
                                                          children: <Widget>[
                                                            Divider(),
                                                            Text(e.artists.first
                                                                .name)
                                                          ],
                                                        ),
                                                      ),
                                                ))
                                                .toList()),
                                      )
                                    ],
                                  );
                                })
                          ],
                        ),
                      )),

                  //List das sugestões
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
