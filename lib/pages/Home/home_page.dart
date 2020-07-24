import 'package:ficos_app/pages/Announcement/Announcement.dart';
import 'package:ficos_app/pages/Catalog/catalog_page.dart';
import 'package:ficos_app/pages/Catalog/catalog_controller.dart';
import 'package:ficos_app/pages/Catalog/catalog_controller.dart';
import 'package:ficos_app/pages/Home/home_controller.dart';
import 'package:ficos_app/pages/Login/login_page.dart';
import 'package:ficos_app/pages/MyAnnouncements/MyAnnouncements.dart';
import 'package:ficos_app/pages/PromptDelivery/listPrompDelivery/list_prompt_delivery_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ModularState<Home, HomeController> with SingleTickerProviderStateMixin {

  TabController controllerTab;
  final storage = new FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    controllerTab = new TabController(length: 3, vsync: this);
    controllerTab.addListener(() async {

      int indexPush = controllerTab.index;
      if (indexPush == 1 || indexPush == 2) {
        String token = await this.controller.verifyToken();
        if (token == null) {
          this.controller.showPage();
          Modular.to.pushNamed("/login");
          controllerTab.index = 0;
        } else {
          this.controller.showPageTeste();
          controllerTab.index = indexPush;
        }
      }
    });
  }

  @override
  void dispose() {
    controllerTab.dispose();
    super.dispose();
  }

  _showItem() {
    if(this.controller.page != null) {
      return this.controller.page;
    }
    return new Catalog();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        body: new TabBarView(
            controller: controllerTab,

            children: <Widget>[
              new Catalog(),
              new MyAnnouncements(),
              this.controller.page,
            ]
        ),
        bottomNavigationBar: new Material(
          color: Colors.black,
          child: TabBar(
              controller: controllerTab,
              indicatorColor: Colors.white,
              tabs: <Tab>[
                Tab(icon: new Icon(Icons.home)),
                Tab(icon: new Icon(Icons.chat)),
                Tab(icon: new Icon(Icons.edit)),
              ]
          ),
        ),

      );
    });
  }
}
