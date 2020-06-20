import 'package:n2020/models/movie_model.dart';

import 'database.dart';

class MovieRepository {
  Future<List<MovieModel>> findAllAsync() async {
    var db = Database();
    await db.createDatabase();

    List<MovieModel> movies = new List<MovieModel>();

    if (db.created) {
      movies = new List<MovieModel>();
      movies.add(
        new MovieModel(
          titulo: 'Inception',
          sinopse:
              'Dom Cobb é um ladrão com a rara habilidade de roubar segredos do inconsciente, obtidos durante o estado de sono. Impedido de retornar para sua família, ele recebe a oportunidade de se redimir ao realizar uma tarefa aparentemente impossível: plantar uma ideia na mente do herdeiro de um império. Para realizar o crime perfeito, ele conta com a ajuda do parceiro Arthur, o discreto Eames e a arquiteta de sonhos Ariadne. Juntos, eles correm para que o inimigo não antecipe seus passos.',
          image:
              'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_UX182_CR0,0,182,268_AL_.jpg',
          atores: 'Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page',
          avaliacao: '8,8/10 (IMDb)',
          genero: 'Ação, Aventura, Sci-fi',
          duracao: '2h 28min',
        ),
      );
    }

    return new Future.value(movies);
  }
}
