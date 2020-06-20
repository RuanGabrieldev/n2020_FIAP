import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:n2020/models/user_model.dart';
import 'package:n2020/repository/user_repository.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var listChatt;
  UserModel userModel = UserModel();
  bool _isText = false;
  TextEditingController _textController = TextEditingController();
  List<Map> listChat = List();
  Map<String, dynamic> chat = Map();

  @override
  void initState() {  
    getchat();
    super.initState();
  }


  void restore() {
    setState(() {
      _isText = false;
      _textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {   
    return Scaffold(
      appBar: AppBar(
        title: Text("Botas"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder(
              future: getchat(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

              

              

                return Expanded(
                    flex: 2,
                    child: ListView.builder(
                        itemCount: listChat.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: listChat[index]["user"] == 1
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: <Widget>[
                                listChat[index]["user"] == 2
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 10),
                                        child: Image.asset(
                                          "assets/img/bot1.png",
                                          width: 40,
                                        ),
                                      )
                                    : Container(),
                                Flexible(
                                  child: Card(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 8),
                                    child: Text(listChat[index]["msg"] == null
                                        ? ""
                                        : listChat[index]["msg"]),
                                  )),
                                ),
                                listChat[index]["user"] == 1
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 10),
                                        child: CircleAvatar(
                                          child: Text(
                                            "R",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          backgroundColor: Colors.purple[400],
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                          );
                        }));
              }),
          Container(
            margin: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration.collapsed(
                        hintText: "Escreva sua mensagem"),
                    onChanged: (text) {
                      if (text.isNotEmpty && _isText == false) {
                        setState(() {
                          _isText = true;
                        });
                      } else if (text.isEmpty && _isText == true) {
                        setState(() {
                          _isText = false;
                        });
                      }
                    },
                    onSubmitted: (text) {
                      restore();
                    },
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.send,
                      color: _isText ? Colors.blue : Colors.black38,
                      size: 30,
                    ),
                    onPressed: _isText
                        ? () async {
                            await dialogFlow(_textController.text);
                          }
                        : null),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future dialogFlow(String text) async {
    chat.addAll({"msg": text, "user": 1});
    listChat.add(Map<String, dynamic>.from(chat));

    restore();
    AuthGoogle authGoogle = await AuthGoogle(
            fileJson: "assets/botas-project-gofjcb-d47a0ac1cdd5.json")
        .build();
    Dialogflow dialogflow = Dialogflow(
        authGoogle: authGoogle, language: Language.portugueseBrazilian);
    AIResponse response = await dialogflow.detectIntent(text);
    chat.addAll({"msg": response.getMessage(), "user": 2});
    listChat.add(Map<String, dynamic>.from(chat));
    setState(() {});

    await Firestore.instance
        .collection("usuarios")
        .document("ruangabrielsac12@gmail.com")
        .collection("conversa")
        .document(DateTime.now().millisecondsSinceEpoch.toString())
        .setData(listChat[listChat.length == 0 ? listChat.length : listChat.length -2]);
    await Firestore.instance
        .collection("usuarios")
        .document("ruangabrielsac12@gmail.com")
        .collection("conversa")
        .document(DateTime.now().millisecondsSinceEpoch.toString())
        .setData(listChat[listChat.length == 0 ? listChat.length : listChat.length -1]);
  }

  Future getchat() async {
    if (userModel.email != null) {
      listChatt = await Firestore.instance
          .collection("usuarios")
          .document(userModel.email)
          .get();
    } else {
      UserRepository repository = UserRepository();
      var userModel = await repository.getUser();
       listChatt = await Firestore.instance
          .collection("usuarios")
          .document(userModel.email)
          .collection("conversa")
          .getDocuments();


            if(listChat.isEmpty){
              for (var i = 0; i < listChatt.documents.length; i++) {
                 print(listChatt.documents[i]["msg"]);
                chat = {"msg": listChatt.documents[i]["msg"], "user": listChatt.documents[i]["user"]};
                listChat.add(chat);
                }
            }
      return listChatt;
    }
  }
}
