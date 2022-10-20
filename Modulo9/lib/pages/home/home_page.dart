import 'package:firebase/pages/chat/chat_page.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

import '../../shared/widgets/custon_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

//remoteConfig.getString("example_param_4")
  @override
  Widget build(BuildContext context) {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return SafeArea(
        child: Scaffold(
      backgroundColor:
          Color(int.parse("0xff" + remoteConfig.getString("COR_FUNDO_TELA"))),
      drawer: const CustonDrawer(),
      appBar: AppBar(
        title: const Text("Home"),
      ),
    ));
  }
}
