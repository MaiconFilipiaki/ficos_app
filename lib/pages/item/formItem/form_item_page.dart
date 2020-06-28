import 'dart:io';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:ficos_app/components/ButtonActionPrimary.dart';
import 'package:ficos_app/components/Input.dart';
import 'package:ficos_app/models/item.dart';
import 'package:ficos_app/pages/item/formItem/form_item_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:validadores/Validador.dart';

class FormItemPage extends StatefulWidget {

  final Item itemEdit;

  FormItemPage({ this.itemEdit });

  @override
  _FormItemPageState createState() => _FormItemPageState();
}

class _FormItemPageState extends ModularState<FormItemPage, FormItemController> {

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    this.controller.item = widget.itemEdit;
    this.controller.textDescription =
      new TextEditingController(text: widget.itemEdit.description);
    this.controller.textPrice =
      new TextEditingController(text: widget.itemEdit.price);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Info Item"),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            color: Colors.black.withOpacity(0.6),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                FormField<List>(
                    initialValue: this.controller.listFile,
                    validator: (imagens) {
                      if (imagens.length == 0) {
                        return "Necessario selecionar uma imagem!";
                      }
                      return null;
                    },
                    builder: (state) {
                      return Column(
                        children: <Widget>[
                          Container(
                              height: 100,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: this.controller.listFile.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index == this.controller.listFile.length) {
                                      return Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8),
                                          child: GestureDetector(
                                            onTap: () async {
                                              await this.controller.addImage();
                                            },
                                            child: CircleAvatar(
                                                backgroundColor: Colors.grey[400],
                                                radius: 50,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Icon(
                                                        Icons.add_a_photo,
                                                        size: 40,
                                                        color: Colors.grey[100]
                                                    ),
                                                    Text(
                                                        "Adicionar",
                                                        style: TextStyle(
                                                            color: Colors.grey[100]
                                                        )
                                                    )
                                                  ],
                                                )
                                            ),
                                          )
                                      );
                                    }
                                    if (this.controller.listFile.length > 0) {
                                      return Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8),
                                          child: GestureDetector(
                                              onTap: (){
                                                showDialog(
                                                    context: context,
                                                    builder: (context) => Dialog(
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: <Widget>[
                                                          Image.file(this.controller.listFile[index]),
                                                          FlatButton(
                                                            child: Text("Excluir"),
                                                            textColor: Colors.red,
                                                            onPressed: () {
                                                              this.controller.removeImage(index);
                                                              Navigator.of(context).pop();
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                );
                                              },
                                              child: CircleAvatar(
                                                radius: 50,
                                                backgroundImage: FileImage(this.controller.listFile[index]),
                                                child: Container(
                                                    color: Color.fromRGBO(255, 255, 255, 0.4),
                                                    alignment: Alignment.center,
                                                    child: Icon(Icons.delete, color: Colors.red,)
                                                ),
                                              )
                                          )
                                      );
                                    }
                                    return Container();
                                  }
                              )
                          ),
                          if(state.hasError)
                            Container(
                              child: Text(
                                "[${state.errorText}]",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14
                                ),
                              ),
                            )
                        ],
                      );
                    }
                ),

                InputCustomizado(
                  hint: "Nome do item",
                  icon: Icons.edit,
                  controller: this.controller.textDescription,
                  validator: (valor) {
                    return Validador()
                            .add(
                              Validar.OBRIGATORIO,
                              msg: "Campo obrigatorio"
                            )
                            .minLength(4)
                            .maxLength(20)
                            .valido(valor);
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: InputCustomizado(
                    hint: "Preço do item",
                    icon: Icons.attach_money,
                    formatter: [
                      WhitelistingTextInputFormatter.digitsOnly,
                      RealInputFormatter(centavos: true)
                    ],
                    controller: this.controller.textPrice,
                    validator: (valor) {
                      return Validador()
                          .add(
                          Validar.OBRIGATORIO,
                          msg: "Campo obrigatorio"
                      )
                          .minLength(4)
                          .maxLength(20)
                          .valido(valor);
                    },
                  ),
                ),
                ButtonActionPrimary(
                  label: "Salvar",
                  onPressed: () {
                    this.controller.sendFile();
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

