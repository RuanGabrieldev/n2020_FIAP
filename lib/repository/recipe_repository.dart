import 'package:n2020/models/recipe_model.dart';

import 'database.dart';

class RecipeRepository {
  Future<List<RecipeModel>> findAllAsync() async {
    var db = Database();
    await db.createDatabase();

    List<RecipeModel> recipes = new List<RecipeModel>();

    if (db.created) {
      recipes = new List<RecipeModel>();
      recipes.add(
        new RecipeModel(
          titulo: 'Lasanha de pão',
          image:
              'https://cdn.guiadacozinha.com.br/wp-content/uploads/2019/10/lasanha-pratica-pao-forma.jpg',
          ingredientes: [
            'Pão fatiado - Quantos couberem na forma',
            'Queijo fatiado- 200g',
            'Presunto fatiado - 300g',
            'Molho de tomate a gosto',
            'Carne moída - 400g',
            'Cebola - 1un',
            'Alho - 4 dentes',
            'Sal e temperos a gosto',
            'Amor - bastante',
          ],
          rendimento: '4 porções',
          tempoPreparo: '1 Hora',
          modoPreparo: [
            'Comece com seu molho a bolonhesa: pique toda a cebola e o alho bem pequeninho, e refoque na panela até a cebola dourar',
            'Depois, insira a carne moída, o sal e temperos que preferir (Sim, tudo o que vier no coração está válido!)',
            'Quando perceber que a carne está chegando no ponto de cozida, coloque o molho de tomate (2 sachês, uma lata, o molho caseiro da vovó, etc) e deixe cozinhar por 2 minutos',
            'A partir de agora é bem simples, espalhe um pouco de molho no fundo e siga as camadas:',
            'Pão',
            'Bolonhesa',
            'Presunto',
            'Queijo',
            'Finalize com mais queijo e deixe no forno pré aquecido a 180º por aprox. 20 minutos ou até o queijo dourar!',
          ],
        ),
      );
    }

    return new Future.value(recipes);
  }
}
