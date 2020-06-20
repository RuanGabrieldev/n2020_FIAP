// To parse this SON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UserModel {
    UserModel({
         this.userId,
         this.foto,
         this.nome,
         this.email,
         this.notificacao,
    });

     int userId;
     String foto;
     String nome;
     String email;
     int notificacao;

    factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"],
        foto: json["foto"],
        nome: json["nome"],
        email: json["email"],
        notificacao: json["notificacao"],
    );

    Map<String, dynamic> toMap() => {
        "user_id": userId,
        "foto": foto,
        "nome": nome,
        "email": email,
        "notificacao": notificacao,
    };
}
