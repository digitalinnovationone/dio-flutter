import 'package:firebase/pages/tarefa/tarefa_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../pages/chat/chat_page.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;

    var nicknameController = TextEditingController();
    final remoteConfig = FirebaseRemoteConfig.instance;
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.task),
            title: Text("Tarefas"),
            onTap: () {
              analytics.logEvent(name: "TarefaPage");
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => TarefaPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text("Chat"),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      content: Wrap(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(remoteConfig.getString("TEXTO_CHAT")),
                          TextField(
                            controller: nicknameController,
                          ),
                          TextButton(
                              onPressed: () {
                                nicknameController.text = '';
                                analytics.logEvent(name: "ChatPage");
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ChatPage(
                                            nickName:
                                                nicknameController.text)));
                              },
                              child: Text("Entrar no chat"))
                        ],
                      ),
                    );
                  });
            },
          ),
          ListTile(
            leading: Icon(Icons.bug_report),
            title: Text("Crashlytics"),
            onTap: () {
              analytics.logEvent(name: "Exception");
              throw Exception();
            },
          ),
        ],
      ),
    );
  }
}
