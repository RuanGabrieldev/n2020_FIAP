import 'package:flutter/material.dart';
import 'package:n2020/models/recipe_model.dart';
import 'package:n2020/repository/recipe_repository.dart';

class RecipesScreen extends StatefulWidget {
  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Receitas"),
      ),
      body: FutureBuilder<List<RecipeModel>>(
        future: RecipeRepository().findAllAsync(),
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

  ListView buildListView(List<RecipeModel> recipes) {
    return ListView.builder(
      itemCount: recipes == null ? 0 : recipes.length,
      itemBuilder: (BuildContext ctx, int index) {
        return cardRecipe(recipes[index]);
      },
    );
  }

  InkWell cardRecipe(RecipeModel recipe) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          "recipes_details",
          arguments: recipe,
        );
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
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
                recipe.image,
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
                          recipe.titulo,
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
                            recipe.tempoPreparo,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.local_dining,
                          size: 20,
                          color: Colors.blueGrey,
                        ),
                        Expanded(
                          child: Text(
                            recipe.rendimento,
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
