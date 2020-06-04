import 'package:ficos_app/components/ButtonActionPrimary.dart';
import 'package:ficos_app/components/Input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validadores/Validador.dart';
import 'form_prompt_delivery_controller.dart';

class FormPromptDeliveryPage extends StatefulWidget {
  @override
  _FormPromptDeliveryPageState createState() => _FormPromptDeliveryPageState();
}

class _FormPromptDeliveryPageState extends ModularState<FormPromptDeliveryPage, FormPromptDeliveryController> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Inserir Anúncio"),
            actions: <Widget>[
              FlatButton(
                textColor: Colors.white,
                child: Text("Limpar"),
                onPressed: (){
                  this.controller.controllerTitle.text = "";
                },
              )
            ],
          ),
          body: Container(
            color: Colors.black.withOpacity(0.6),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 5, 10),
                  child: Center(
                    child: Text(
                      "Atenção esse titulo vai ser apresentado na parte inicial do anúncio. Seja Criativo!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Wrap(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: InputCustomizado(
                          hint: "Titulo",
                          icon: Icons.edit,
                          controller: this.controller.controllerTitle,
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
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: ButtonActionPrimary(
                    label: "CRIAR",
                    onPressed: (){
                      if (_formKey.currentState.validate()) {
                        this.controller.createdPromptDelivery();
                      }
                    }
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

