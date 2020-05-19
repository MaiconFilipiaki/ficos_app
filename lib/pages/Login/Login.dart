import 'package:ficos_app/components/Input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

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
          title: Text("Login"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Image.asset("imgs/logo_login.png"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: InputCustomizado(
                    controller: _controllerEmail,
                    hint: 'E-mail',
                    icon: Icons.email,
                  type: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: InputCustomizado(
                  controller: _controllerPassword,
                  hint: 'Senha',
                  icon: Icons.lock,
                  obscure: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  color: Color(0xFF2CDBA3),
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)
                  ),
                  onPressed: (){},
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
                      Navigator.pushNamed(context, "/register");
                    },
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}

