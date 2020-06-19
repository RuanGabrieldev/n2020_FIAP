import 'package:flutter/material.dart';
import 'package:n2020/models/movie_model.dart';
import 'package:n2020/repository/movie_repository.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Filmes"),
      ),
      body: FutureBuilder<List<MovieModel>>(
        future: MovieRepository().findAllAsync(),
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

  ListView buildListView(List<MovieModel> movies) {
    return ListView.builder(
      itemCount: movies == null ? 0 : movies.length,
      itemBuilder: (BuildContext ctx, int index) {
        return cardMovie(movies[index]);
      },
    );
  }

  InkWell cardMovie(MovieModel movie) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          "movies_details",
          arguments: movie,
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
                movie.image,
                width: 80,
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
                          movie.titulo,
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
                          Icons.alarm,
                          size: 20,
                          color: Colors.blueGrey,
                        ),
                        Expanded(
                          child: Text(
                            movie.duracao,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.yellow,
                        ),
                        Expanded(
                          child: Text(
                            movie.avaliacao,
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
