import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:trilhaapp/pages/auto_size_text/auto_size_text_page.dart';
import 'package:trilhaapp/pages/battery/battery_page.dart';
import 'package:trilhaapp/pages/camera/camera_page.dart';
import 'package:trilhaapp/pages/connectivity_plus/connectivity_plus_page.dart';
import 'package:trilhaapp/pages/geolocator/geolocator_page.dart';
import 'package:trilhaapp/pages/percent_indicator/percent_indicator_page.dart';
import 'package:trilhaapp/pages/qr_code/qr_code_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.internetExplorer,
                      color: Colors.blue,
                      size: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Abrir dio"),
                  ],
                )),
            onTap: () async {
              await launchUrl(Uri.parse("https://dio.me"));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.mapLocationDot,
                      color: Colors.blue,
                      size: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Abrir Google Maps"),
                  ],
                )),
            onTap: () async {
              await launchUrl(
                  Uri.parse("google.navigation:q=Orlando FL&mode=d"));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.shareNodes,
                      color: Colors.blue,
                      size: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Comaprtilhar"),
                  ],
                )),
            onTap: () {
              Share.share(
                'Olhem esse site, que legal! https://dio.me',
              );
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.percent,
                      color: Colors.blue,
                      size: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Indicador de porcentagem"),
                  ],
                )),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => PercentIndicatorPage()));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.batteryHalf,
                      color: Colors.blue,
                      size: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Indicador da bateria"),
                  ],
                )),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => BatteryPage()));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.paperclip,
                      color: Colors.blue,
                      size: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Auto Size Text"),
                  ],
                )),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => AutoSizeTextPage()));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.home,
                      color: Colors.blue,
                      size: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Intl"),
                  ],
                )),
            onTap: () {
              var f = NumberFormat('#,###.0#', 'en_US');
              var fBR = NumberFormat('#,###.0#', 'pt_BR');
              print(f.format(12345.345));
              print(fBR.format(123456.345));

              var data = DateTime(2022, 05, 09);
              print(DateFormat('EEEEE', 'en_US').format(data));
              print(DateFormat('EEEEE', 'pt_BR').format(data));

              Intl.defaultLocale = 'pt_BR';
              print(data.toString());
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.flag,
                      color: Colors.blue,
                      size: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("pt-br"),
                  ],
                )),
            onTap: () {
              if (context.locale.toString() == "pt_BR") {
                context.setLocale(Locale('en', 'US'));
              } else {
                context.setLocale(Locale('pt', 'BR'));
              }
              Navigator.pop(context);
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.flag,
                      color: Colors.blue,
                      size: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Path"),
                  ],
                )),
            onTap: () async {
              var directory = await path_provider.getTemporaryDirectory();
              print(directory.path);
              directory = await path_provider.getApplicationSupportDirectory();
              print(directory.path);
              directory =
                  await path_provider.getApplicationDocumentsDirectory();
              print(directory.path);
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.appStoreIos,
                      color: Colors.blue,
                      size: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Informações pacote"),
                  ],
                )),
            onTap: () async {
              PackageInfo packageInfo = await PackageInfo.fromPlatform();

              String appName = packageInfo.appName;
              String packageName = packageInfo.packageName;
              String version = packageInfo.version;
              String buildNumber = packageInfo.buildNumber;

              print(appName);
              print(packageName);
              print(version);
              print(buildNumber);

              print(Platform.operatingSystem);
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.robot,
                      color: Colors.blue,
                      size: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Informações dispositivo"),
                  ],
                )),
            onTap: () async {
              DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
              if (Platform.isAndroid) {
                AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
                print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"
              } else if (Platform.isIOS) {
                IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
                print(
                    'Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"
              } else {
                WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
                print('Running on ${webBrowserInfo.userAgent}');
              }
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.wifi,
                      color: Colors.blue,
                      size: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Conexão"),
                  ],
                )),
            onTap: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ConnectivityPlusPage()));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.mapPin,
                      color: Colors.blue,
                      size: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("GPS"),
                  ],
                )),
            onTap: () async {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => GeolocatorPage()));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.qrcode,
                      color: Colors.blue,
                      size: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("QR Code"),
                  ],
                )),
            onTap: () async {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => QrCodePage()));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.camera,
                      color: Colors.blue,
                      size: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Camera"),
                  ],
                )),
            onTap: () async {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => CameraPage()));
            },
          ),
        ].reversed.toList(),
      ),
    );
  }
}
