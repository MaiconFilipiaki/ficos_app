import 'package:ficos_app/config/variables.dart';
import 'package:ficos_app/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'catalog_controller.dart';
import 'package:intl/intl.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends ModularState<Catalog, CatalogController> {
  var _eurosInUSFormat = new NumberFormat.currency(
    locale: "pt_BR",
    symbol: "R\$"
  );

  _renderDraw() {
    if (this.controller.tokenSave != null) {
      return ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  this.controller.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Editar usuario",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 30,
                )
              ],
            ),
            onTap: () {
            },
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Divider(),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Sair",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Icon(
                  Icons.exit_to_app,
                  color: Colors.red,
                  size: 30,
                )
              ],
            ),
            onTap: () {
              this.controller.logout();
            },
          ),
        ],
      );
    }
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Text(
                  "Fazer login?",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                ),
                onTap: () {
                  print('AQUI TEST');
                  Modular.to.pushNamed("/login");
                },
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("FiCos"),
        ),
        drawer: Drawer(
          child: _renderDraw(),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: this.controller.listItens.length,
              itemBuilder: (BuildContext contextBuild, int index) {
                return new GestureDetector(
                  onTap: () {
                    Modular.to.pushNamed(
                        '/detailsProduct',
                        arguments: this.controller.listItens[index].id,
                    );
                  },
                  child: ListTile(
                      title: Row(
                        children: <Widget>[
                          FadeInImage.assetNetwork(
                            placeholder: 'imgs/image-not-found.png',
                            image: this.controller.listItens[index].imgs != null && this.controller.listItens[index].imgs.length > 0 ? "${API}api/v1/img/item/${this.controller.listItens[index].imgs[0].nameImg}" : '',
                            height: 70,
                            width: 70,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  this.controller.listItens[index].description.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text(
                                    "R\$${this.controller.listItens[index].price}",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.grey
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Divider(),
                          )
                        ],
                      )
                  ),
                );
              }
          ),
        ),
      );
    });
  }
}

