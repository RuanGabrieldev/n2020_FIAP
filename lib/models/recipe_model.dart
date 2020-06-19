class RecipeModel {
  String titulo;
  String image;
  List<String> ingredientes;
  List<String> modoPreparo;
  String tempoPreparo;
  String rendimento;

  RecipeModel({
    this.titulo,
    this.image,
    this.ingredientes,
    this.modoPreparo,
    this.rendimento,
    this.tempoPreparo,
  });
}
