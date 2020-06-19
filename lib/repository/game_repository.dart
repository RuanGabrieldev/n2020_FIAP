import 'package:n2020/models/game_model.dart';

import 'database.dart';

class GameRepository {
  Future<List<GameModel>> findAllAsync() async {
    var db = Database();
    await db.createDatabase();

    List<GameModel> games = new List<GameModel>();

    if (db.created) {
      games = new List<GameModel>();
      games.add(
        new GameModel(
          titulo: 'Amarelinha',
          regras: 'Acumule pontos pulando sem cair para vencer!',
          image:
              'https://www.uauababy.com.br/wp-content/uploads/IMG_6424-600x600.jpg',
          steps: [
            new GameStep(
              text: "Desenhe a Amarelinha",
              imageUrl:
                  "https://nova-escola-producao.s3.amazonaws.com/kNmTmqNggEdck6MK6X7vAsN7AmpsYfsTqXE9jkqKGDAq7QA9MrYg5mQmBHYk/ei9mar20box021-contagem-c4-ricardolima-card02.jpg",
            ),
            new GameStep(
              text:
                  "Jogue uma tampinha de garrafa (ou qualquer objeto pequeno que não quebre) em um dos números da amarelinha.",
            ),
            new GameStep(
              text:
                  "Pule em um pé só em cada número, usando os dois nas duplas. Ao chegar no número da tampinha, pegue-a e retorne pulando.",
            ),
            new GameStep(
              text:
                  "É simples assim! Ao retornar, sua pontuação da rodada será o número em que a tampinha caiu. Quem fizer mais pontos vence!",
            ),
          ],
          pessoas: '2+',
          duracao: '15 Minutos',
        ),
      );
    }

    return new Future.value(games);
  }
}
