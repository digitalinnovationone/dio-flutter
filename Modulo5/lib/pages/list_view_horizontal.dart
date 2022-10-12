import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/app_images.dart';

class ListViewHorizontal extends StatefulWidget {
  const ListViewHorizontal({Key? key}) : super(key: key);

  @override
  State<ListViewHorizontal> createState() => _ListViewHorizontalState();
}

class _ListViewHorizontalState extends State<ListViewHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 2,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Card(
                elevation: 8,
                child: Image.asset(
                  AppImages.paisagem1,
                ),
              ),
              Card(
                elevation: 8,
                child: Image.asset(
                  AppImages.paisagem2,
                ),
              ),
              Card(
                elevation: 8,
                child: Image.asset(
                  AppImages.paisagem3,
                ),
              ),
            ],
          ),
        ),
        Expanded(flex: 3, child: Container())
      ],
    ));
  }
}
