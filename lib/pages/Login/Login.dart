import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                child: TextField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 20, 32, 20),
                      prefixIcon: Icon(Icons.email),
                      hintText: 'E-mail',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)
                      )
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 20, 32, 20),
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Senha',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)
                      )
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
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
                    onPressed: (){},
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

