import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key});

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  var battery = Battery();
  var statusBateria = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPage();
    battery.onBatteryStateChanged.listen((BatteryState state) {
      print(state);
    });
  }

  initPage() async {
    statusBateria = await battery.batteryLevel;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("Status da Bateria: $statusBateria%")),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 50,
              animation: true,
              lineHeight: 20.0,
              animationDuration: 2000,
              percent: statusBateria / 100,
              center: Text("$statusBateria.0%"),
              progressColor: Colors.greenAccent,
            )
          ],
        ),
      ),
    ));
  }
}
