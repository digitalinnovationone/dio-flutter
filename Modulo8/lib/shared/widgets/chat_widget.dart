import 'package:firebase/models/text_model.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final TextModel textModel;
  final bool souEu;
  const ChatWidget({super.key, required this.textModel, required this.souEu});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: souEu ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: souEu ? Colors.blue : Colors.orange,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Text(
              textModel.nickname,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              textModel.text,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
