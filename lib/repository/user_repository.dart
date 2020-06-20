import 'package:n2020/models/user_model.dart';
import 'package:n2020/repository/database_helper.dart';
import 'package:sqflite/sqflite.dart';
 
class UserRepository {

  final String _tabela = "userModel";
  final String _idUser = "id_user";
  final String _foto = "foto";
  final String _nome = "nome";
  final String _email = "email";
  final String _notificacao = "notificacoes";

  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;
 
  // Construtor
  UserRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<UserModel> saveUser(UserModel userModel) async{
    var connection = await _databaseHelper.connection;
    userModel.userId = await connection.insert(_tabela, userModel.toMap());
    return userModel;
  }

  Future<UserModel> getUser({int id = 1}) async{
    var connection = await _databaseHelper.connection;
    
    List<Map> user = await connection.query(_tabela, 
    columns: [_idUser, _foto, _nome, _email, _notificacao],
     where: "$_idUser = ?",
     whereArgs: [id]);

     print(user);
     return user.length > 0 ? UserModel.fromMap(user.first) : UserModel();
  }

  Future<int> updateUser(UserModel userModel) async{
    var connection = await _databaseHelper.connection;
    return await connection.update(
      _tabela,
      userModel.toMap(),
      where: "$_idUser = ?",
      whereArgs: [userModel.userId]
    );
  }

  Future<int> getNumber() async {
    var connection = await _databaseHelper.connection;
    return Sqflite.firstIntValue(await connection.rawQuery("SELECT COUNT(*) FROM $_tabela"));
  }


}