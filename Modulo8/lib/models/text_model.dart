import 'package:cloud_firestore/cloud_firestore.dart';

class TextModel {
  DateTime dataHora = DateTime.now();
  String text = "";
  String userId = "";
  String nickname = "";

  TextModel({required this.text, required this.userId, required this.nickname});

  TextModel.fromJson(Map<String, dynamic> json) {
    dataHora = (json['data_hora'] as Timestamp).toDate();
    text = json['text'];
    userId = json['user_id'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data_hora'] = Timestamp.fromDate(this.dataHora);
    data['text'] = this.text;
    data['user_id'] = this.userId;
    data['nickname'] = this.nickname;
    return data;
  }
}
