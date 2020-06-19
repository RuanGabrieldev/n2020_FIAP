import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:n2020/models/movie_model.dart';

class MoviesDetalhesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MovieModel movieModel = ModalRoute.of(context).settings.arguments;

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
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(movieModel.titulo),
              background: Image.network(
                movieModel.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                listTitle(movieModel.genero),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.alarm,
                            size: 30,
                            color: Colors.blue,
                          ),
                          Expanded(
                            child: Text(
                              " Duração: " + movieModel.duracao,
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
                            Icons.star,
                            size: 30,
                            color: Colors.yellow,
                          ),
                          Expanded(
                            child: Text(
                              " Avaliaçao: " + movieModel.avaliacao,
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
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                  child: Text(
                    movieModel.sinopse,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                listTitle("Detalhes"),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Gênero: " + movieModel.genero),
                      Text("Estrelas: " + movieModel.atores),
                    ],
                  ),
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
