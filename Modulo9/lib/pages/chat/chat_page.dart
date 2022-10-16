import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/models/text_model.dart';
import 'package:firebase/shared/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPage extends StatefulWidget {
  final String nickName;
  const ChatPage({super.key, required this.nickName});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final db = FirebaseFirestore.instance;
  final textoController = TextEditingController(text: '');
  String userId = "";

  @override
  void initState() {
    super.initState();
    carregarUsuario();
  }

  carregarUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('user_id')!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Chat"),
            ),
            body: Container(
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                        stream: db.collection("chats").snapshots(),
                        builder: (context, snapshot) {
                          return !snapshot.hasData
                              ? CircularProgressIndicator()
                              : ListView(
                                  children: snapshot.data!.docs.map((e) {
                                    var textModel = TextModel.fromJson(
                                        (e.data() as Map<String, dynamic>));
                                    return ChatWidget(
                                        textModel: textModel,
                                        souEu: textModel.userId == userId);
                                  }).toList(),
                                );
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          controller: textoController,
                          decoration: const InputDecoration(
                              focusedBorder: InputBorder.none),
                          style: TextStyle(fontSize: 18),
                        )),
                        IconButton(
                            onPressed: () async {
                              var textModel = TextModel(
                                  nickname: widget.nickName,
                                  text: textoController.text,
                                  userId: userId);
                              await db
                                  .collection("chats")
                                  .add(textModel.toJson());
                              textoController.text = '';
                            },
                            icon: Icon(Icons.send))
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
