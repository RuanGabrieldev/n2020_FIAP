import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n2020/components/apresentation_tab.dart';
import 'package:n2020/models/user_model.dart';
import 'package:n2020/repository/user_repository.dart';

class ApresentationScreen extends StatelessWidget {
  UserRepository repository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        ApresentationTab(
          image: "assets/img/bot1.png",
          description:
              "Vamos te dar sugestões para melhorar o seu dia e jogar o tédio da quarentena fora!",
          title: "Estou aqui para te ajudar!",
          page: 1,
        ),
        ApresentationTab(
          image: "assets/img/bot2.png",
          description:
              "Apesar de eu ser um BGOT, eu adoro conversar e você pode me contar o que quiser!",
          title: "Posso conversar com você?",
          page: 2,
        ),
        ApresentationTab(
          image: "assets/img/bot1.png",
          description: "",
          title: "Agora você está pronto!",
          page: 3,
        ),
      ],
    );
  }
}
