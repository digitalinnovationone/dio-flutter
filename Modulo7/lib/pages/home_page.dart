import 'package:brasil_fields/brasil_fields.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:trilhaapp/pages/getx/contador_getx_page.dart';
import 'package:trilhaapp/pages/provider/tarefa_provider_page.dart';
import 'package:trilhaapp/service/dark_mode_service.dart';
import 'package:trilhaapp/shared/widgets/custon_drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'brasil_fields_page/brasil_fields_page.dart';
import 'getx/tarefa_getx_page.dart';
import 'mobx/contador_mobx_page.dart';
import 'mobx/contador_mobx_store_page.dart';
import 'mobx/tarefa_mobx_page.dart';
import 'provider/contador_provider_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(initialIndex: 0, length: 7, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      drawer: const CustonDrawer(),
      appBar: AppBar(
        title: Text(
          "APP_TITLE".tr(),
          style: GoogleFonts.roboto(),
        ),
        actions: [
          Center(child: Text("Dark Mode")),
          Consumer<DarkModeService>(builder: (_, darkModeService, widget) {
            return Switch(
                value: darkModeService.darkMode,
                onChanged: (bool value) {
                  darkModeService.darkMode = !darkModeService.darkMode;
                });
          })
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          const ContadorProviderPage(),
          TarefaProviderPage(),
          ContadorMobXPage(),
          ContadorMobXStorePage(),
          TarefaMobXPage(),
          ContadorGetXPage(),
          TarefaGetXPage()
        ],
      ),
      bottomNavigationBar: ConvexAppBar.badge(
        const {0: '99+', 1: Icons.assistant_photo, 2: Colors.redAccent},
        items: const [
          TabItem(icon: Icons.home, title: 'P_1'),
          TabItem(icon: Icons.map, title: 'P_2'),
          TabItem(icon: Icons.add, title: 'M_1'),
          TabItem(icon: Icons.message, title: 'M_2'),
          TabItem(icon: Icons.people, title: 'M_3'),
          TabItem(icon: Icons.people, title: 'G_1'),
          TabItem(icon: Icons.people, title: 'G_2'),
        ],
        onTap: (int i) => tabController.index = i,
        controller: tabController,
      ),
    );
  }
}
