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
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("FiCos"),
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

