import 'dart:io';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:ficos_app/components/ButtonActionPrimary.dart';
import 'package:ficos_app/components/Input.dart';
import 'package:ficos_app/config/variables.dart';
import 'package:ficos_app/models/item.dart';
import 'package:ficos_app/models/itemTransition.dart';
import 'package:ficos_app/pages/item/formItem/form_item_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:validadores/Validador.dart';

class FormItemPage extends StatefulWidget {

  final ItemTransition itemEdit;

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
    if (widget.itemEdit.imgs != null && widget.itemEdit.imgs.length > 0) {
      List<dynamic> tste = [];
      widget.itemEdit.imgs.forEach((e) {
        print(e.nameImg);

        tste.add('${API}api/v1/img/item/${e.nameImg}');
      });
      this.controller.listFile = tste;
    }
    this.controller.itemCategoriaSelect = widget.itemEdit.categorie;
    this.controller.textDescriptionComplet =
      new TextEditingController(text: widget.itemEdit.descriptionComplet);
    this.controller.textDescription =
      new TextEditingController(text: widget.itemEdit.description);
    this.controller.textPrice =
      new TextEditingController(text: widget.itemEdit.price);
  }

  _showImg(dynamic e) {
    if (e is File) {
      return FileImage(e);
    }
    return NetworkImage(e);
  }
  _showImgWidget(dynamic e) {
    if (e is File) {
      return FileImage(e);
    }
    return Image.network(e);
  }

  _showBtnDelete() {
    if (this.controller.item.id != null) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: ButtonActionPrimary(
          label: "Deletar",
          color: 0xFFc90000,
          onPressed: () {
            this.controller.deleteItem();
          },
        ),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Info Item"),
        ),
        body: SingleChildScrollView(
          child: Form(
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
                                                            _showImgWidget(this.controller.listFile[index]),
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
                                                  backgroundImage: _showImg(this.controller.listFile[index]),
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
                  Card(
                      color: Colors.grey,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          maxLines: 8,
                          decoration: InputDecoration.collapsed(hintText: "Digite a descrição"),
                          controller: this.controller.textDescriptionComplet,
                        ),
                      )
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: DropdownButtonFormField(
                          hint: Text("Categoria"),
                          items: this.controller.listaItensCategoria,
                          onChanged: (valor) {
                            this.controller.itemCategoriaSelect = valor;
                          },
                        ),
                      )
                    ],
                  ),
                  _showBtnDelete(),
                  ButtonActionPrimary(
                    label: "Salvar",
                    onPressed: () {
                      this.controller.registerItem();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

