import 'package:ficos_app/components/ButtonActionPrimary.dart';
import 'package:ficos_app/components/Input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validadores/Validador.dart';
import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends ModularState<RegisterPage, RegisterController> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return Observer(builder: (_) {
          return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("imgs/login.jpg"),
                    fit: BoxFit.cover
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                    title: Text("Cadastrar-se")
                ),
                body: Padding(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight - 150,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RaisedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset(
                                    "imgs/facebook.png",
                                    width: 50,
                                    height: 40,
                                  ),
                                  Text(
                                    "Entrar com o facebook",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                ],
                              ),
                              color: Color(0xFF295396),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              padding: EdgeInsets.all(3),
                              onPressed: (){}
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Divider(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "OU",
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
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  child: InputCustomizado(
                                    controller: this.controller.controllerName,
                                    hint: "Nome",
                                    icon: Icons.person_outline,
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
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  child: InputCustomizado(
                                    controller: this.controller.controllerEmail,
                                    hint: "E-mail",
                                    icon: Icons.email,
                                    type: TextInputType.emailAddress,
                                    validator: (valor) {
                                      return Validador()
                                          .add(
                                          Validar.OBRIGATORIO,
                                          msg: "Campo obrigatorio"
                                      )
                                          .add(
                                          Validar.EMAIL,
                                          msg: "Digite um e-mail valido"
                                      )
                                          .minLength(4)
                                          .maxLength(25)
                                          .valido(valor);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  child: InputCustomizado(
                                    controller: this.controller.controllerPassword,
                                    hint: "Senha",
                                    icon: Icons.lock,
                                    obscure: true,
                                    validator: (valor) {
                                      return Validador()
                                          .add(
                                          Validar.OBRIGATORIO,
                                          msg: "Campo obrigatorio"
                                      )
                                          .minLength(6)
                                          .maxLength(12)
                                          .valido(valor);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  child: Text(
                                    this.controller.textError,
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  child: ButtonActionPrimary(
                                      label: "Cadastre-se",
                                      onPressed: () {
                                        if(_formKey.currentState.validate()) {
                                          this.controller.saveUser();
                                        }
                                      }
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
          );
        });
      },
    );
  }
}

