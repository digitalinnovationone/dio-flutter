import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AutoSizeTextPage extends StatefulWidget {
  const AutoSizeTextPage({super.key});

  @override
  State<AutoSizeTextPage> createState() => _AutoSizeTextPageState();
}

class _AutoSizeTextPageState extends State<AutoSizeTextPage> {
  TextEditingController controoler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Auto Size text"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            TextField(
              controller: controoler,
              maxLines: 5,
              onChanged: (value) {
                setState(() {});
              },
            ),
            Card(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: AutoSizeText(
                  controoler.text,
                  maxLines: 3,
                  minFontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
