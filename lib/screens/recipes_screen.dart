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
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        title: Text("Recipes"),
      ),
      body: FutureBuilder<List<RecipeModel>>(
        future: RecipeRepository().findAllAsync(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildListView(snapshot.data);
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

  Card cardRecipe(RecipeModel recipe) {
    return Card(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            "recipes_details",
            arguments: recipe,
          );
        },
        child: Row(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.topLeft,
              child: Image.asset(
                "assets/img/bot1.png",
                width: 120,
              ),
              // child: Image.network(recipe.image),
            ),
            new Expanded(
                child: new Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.topLeft,
              child: Text(
                recipe.titulo,
                style: null,
                textAlign: TextAlign.left,
                maxLines: 5,
              ),
            )),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
