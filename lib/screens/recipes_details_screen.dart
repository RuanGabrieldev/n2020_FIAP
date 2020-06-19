import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:n2020/models/recipe_model.dart';

class RecipesDetalhesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RecipeModel recipeModel = ModalRoute.of(context).settings.arguments;

    Column stringList(List<String> list) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: list
              .map(
                (ing) => Text(
                  ing,
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                  textAlign: TextAlign.left,
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
              title: Text(recipeModel.titulo),
              background: Image.network(
                recipeModel.image,
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
                            Icons.alarm,
                            size: 30,
                            color: Colors.blue,
                          ),
                          Expanded(
                            child: Text(
                              " Tempo de preparo: " + recipeModel.tempoPreparo,
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
                            Icons.local_dining,
                            size: 30,
                            color: Colors.deepOrange,
                          ),
                          Expanded(
                            child: Text(
                              " Rendimento: " + recipeModel.rendimento,
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
                listTitle("Ingredientes"),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: stringList(recipeModel.ingredientes),
                ),
                listTitle("Modo de preparo"),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: stringList(recipeModel.modoPreparo),
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
