class GameModel {
  String titulo;
  String image;
  String regras;
  List<GameStep> steps;
  String pessoas;
  String duracao;

  GameModel({
    this.titulo,
    this.image,
    this.regras,
    this.steps,
    this.duracao,
    this.pessoas,
  });
}

class GameStep {
  GameStep({this.text, this.imageUrl});
  String imageUrl;
  String text;
}
