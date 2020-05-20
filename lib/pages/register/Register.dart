import 'package:ficos_app/components/ButtonActionPrimary.dart';
import 'package:ficos_app/components/Input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _controllerName;
  TextEditingController _controllerEmail;
  TextEditingController _controllerPassword;


  @override
  Widget build(BuildContext context) {
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
          title: Text("Cadastrar-se")
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    )                  ],
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: InputCustomizado(
                      controller: _controllerName,
                      hint: "Nome",
                      icon: Icons.person_outline,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: InputCustomizado(
                      controller: _controllerEmail,
                      hint: "E-mail",
                      icon: Icons.email,
                      type: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: InputCustomizado(
                      controller: _controllerPassword,
                      hint: "Senha",
                      icon: Icons.lock,
                      obscure: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: ButtonActionPrimary(
                        label: "Cadastre-se",
                        onPressed: () {}
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}

