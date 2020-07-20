import 'dart:async';

import 'package:ficos_app/components/ButtonActionPrimary.dart';
import 'package:ficos_app/components/Input.dart';
import 'package:ficos_app/config/variables.dart';
import 'package:ficos_app/models/item.dart';
import 'package:ficos_app/models/itemTransition.dart';
import 'package:ficos_app/models/prompt_delivery_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'edit_prompt_delivery_controller.dart';
import 'package:geolocator/geolocator.dart';

class EditPromptDeliveryPage extends StatefulWidget {

  final PromptDelivery promptEdit;

  EditPromptDeliveryPage({this.promptEdit});

  @override
  _EditPromptDeliveryPageState createState() => _EditPromptDeliveryPageState();
}

class _EditPromptDeliveryPageState extends ModularState<EditPromptDeliveryPage, EditPromptDeliveryController> {

 _recup() async {
   Position position = await Geolocator().getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
 }

  @override
  void initState() {
    super.initState();
    this.controller.textTeste = new TextEditingController(text: widget.promptEdit.name);
    print('AQUI MAICON 1' +  widget.promptEdit.reach.toString());
    this.controller.latitudePrompt = widget.promptEdit.latitude;
    this.controller.longitudePrompt = widget.promptEdit.longitude;
    this.controller.reach = widget.promptEdit.reach;
    this.controller.id = widget.promptEdit.id;
    this.controller.getPromptDelivery();
  }

  _convertString(dynamic e) {
   String newString = '';
    if(e != null && e.description.length > 10) {
      newString = e.description.substring(0, 10);
    } else {
      newString = e.description;
    }
    return newString;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
      appBar: AppBar(
        title: Text(widget.promptEdit.name),
      ),
      body: Container(
        color: Colors.black.withOpacity(0.6),
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              InputCustomizado(
                hint: "Nome da pronta entrega",
                icon: Icons.edit,
                controller: this.controller.textTeste,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Wrap(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        myLocationButtonEnabled: false,
                        initialCameraPosition: this.controller.cameraPositionMap,
                        zoomGesturesEnabled: true,
                        onMapCreated: (GoogleMapController controller) {
                          this.controller.completedMap(controller);
                        },
                        circles: this.controller.circle,
                      ),
                    ),
                    Slider(
                        value: this.controller.valueSlide,
                        min: 100,
                        max: 4000,
                        label: (this.controller.valueSlide).toString(),
                        divisions: 40,
                        activeColor: Color(0xFF2CDBA3),
                        onChanged: (double result) {
                          this.controller.changeRadiusSlide(result);
                        }
                    )
                  ],
                ),
              ),
              Text(
                this.controller.textError,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                this.controller.textSuccess,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: ButtonActionPrimary(
                    label: "Salvar",
                    onPressed: () {
                      this.controller.savePromptDelivery();
                    }
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Itens",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Column(
                  children: this.controller.itens.map((e) => Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        )
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              FadeInImage.assetNetwork(
                                placeholder: 'imgs/image-not-found.png',
                                image: e.imgs != null && e.imgs.length > 0 ? "${API}api/v1/img/item/${e.imgs[0].nameImg}" : '',
                                height: 70,
                                width: 70,
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      this._convertString(e),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        "R ${e.price}",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        OutlineButton(
                          borderSide: BorderSide(
                            width: 0,
                            color: Colors.black.withOpacity(0.0),
                          ),
                          color: Colors.black.withOpacity(0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "EDITAR",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              )
                            ],
                          ),
                          onPressed: (){},
                        )
                      ],
                    ),
                  )).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        onPressed: (){
            Modular.to.pushNamed(
                '/formItem',
                arguments: ItemTransition(
                  idPromptDelivery: this.controller.id,
                )
            );
        },
      ),
    );
    });
  }
}

