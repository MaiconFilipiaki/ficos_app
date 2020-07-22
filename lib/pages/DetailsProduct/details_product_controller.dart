import 'package:ficos_app/models/item.dart';
import 'package:ficos_app/repositories/item_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ficos_app/config/variables.dart';

part 'details_product_controller.g.dart';

class DetailsProductController = _DetailsProductControlllerBase with _$DetailsProductController;

abstract class _DetailsProductControlllerBase with Store {

  final apiItem = Modular.get<ItemRepository>();

  @observable
  List<dynamic> imgs = [
    AssetImage("imgs/image-not-found.png")
  ];

  @observable
  String price = "R\$ 00,00";

  @observable
  String descricaoExplicativa = "";

  @observable
  String descricao = "";

  @action
  getItem(int id) async {
    try {
      Item item = await apiItem.getFindById(id);
      List<dynamic> imgsMount = [];
      if (item.imgs != null && item.imgs.length > 0) {
        item.imgs.forEach((element) {
          imgsMount.add(NetworkImage("${API}api/v1/img/item/${element.nameImg}"));
        });
      } else {
        imgsMount.add(AssetImage("imgs/image-not-found.png"));
      }
      imgs = imgsMount;
      descricao = item.description;
      price = "R\$${item.price}";
    } catch (err) {
      print(err);
    }
  }

}
