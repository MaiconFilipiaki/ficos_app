import 'package:ficos_app/components/ButtonActionPrimary.dart';
import 'package:ficos_app/components/Input.dart';
import 'package:ficos_app/pages/Login/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validadores/Validador.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends ModularState<Login, LoginController> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("imgs/login.jpg"),
                fit: BoxFit.cover
            )
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text("Login"),
            ),
            body: Padding(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Image.asset("imgs/logo_login.png"),
                    ),
                    Form(
                      key: _formKey,
                      child: Wrap(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: InputCustomizado(
                                controller: this.controller.controllerEmail,
                                hint: 'E-mail',
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
                                }
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: InputCustomizado(
                              controller: this.controller.controllerPassword,
                              hint: 'Senha',
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
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
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
                      padding: EdgeInsets.only(top: 10),
                      child: ButtonActionPrimary(
                          label: "LOGIN",
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              this.controller.login();
                            }
                          }
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Não tem uma conta?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(10, 25, 0, 0),
                          child: Text(
                            "Cadastrar-se",
                            style: TextStyle(
                              color: Color(0xFF2CDBA3),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Colors.transparent,
                          onPressed: (){
                            Modular.to.pushNamed("/register");
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
        ),
      );
    });
  }
}

