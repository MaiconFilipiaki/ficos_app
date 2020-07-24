import 'package:carousel_pro/carousel_pro.dart';
import 'package:ficos_app/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'details_product_controller.dart';

class DetailsProductPage extends StatefulWidget {

  final int idItem;

  DetailsProductPage({ this.idItem });

  @override
  _DetailsProductPageState createState() => _DetailsProductPageState();
}

class _DetailsProductPageState extends ModularState<DetailsProductPage, DetailsProductController> {

  @override
  void initState() {
    super.initState();
    this.controller.getItem(widget.idItem);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Anúncio"),
        ),
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                SizedBox(
                  height: 250,
                  child: Carousel(
                    images: this.controller.imgs,
                    dotSize: 8,
                    dotBgColor: Colors.transparent,
                    dotColor: Colors.white,
                    autoplay: false,
                    dotIncreasedColor: Color(0xFF2CDBA3),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        this.controller.price,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2CDBA3),
                        ),
                      ),
                      Text(
                        this.controller.descricao,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Divider(),
                      ),
                      Text(
                        "Descrição",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        this.controller.descricaoExplicativa,
                        style: TextStyle(
                            fontSize: 18,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: GestureDetector(
                child: GestureDetector(
                  child: Container(
                    child: Text(
                      "Enviar Mensagem",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                    padding: EdgeInsets.all(16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF2CDBA3),
                      borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                ),
                onTap: () {

                },
              ),
            )
          ],
        ),
      );
    });
  }
}

