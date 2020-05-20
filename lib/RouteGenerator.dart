import 'package:ficos_app/pages/Announcement/Announcement.dart';
import 'package:ficos_app/pages/Login/Login.dart';
import 'package:ficos_app/pages/register/Register.dart';
import 'package:flutter/material.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch(settings.name){
      case "/":
        return MaterialPageRoute(
          builder: (_) =>  Announcement()
        );
      case "/login":
        return MaterialPageRoute(
          builder: (_) => Login()
        );
      case "/register":
        return MaterialPageRoute(
            builder: (_) => Register()
        );
      default:
        _erroRouter();
    }

  }

  static Route<dynamic> _erroRouter() {
    return MaterialPageRoute(
        builder: (_) {
          return Scaffold(
              appBar: AppBar(
                  title: Text("tela nao encontrada")
              ),
              body: Center(
                child: Text("tela nao encontrada"),
              )
          );
        }
    );
  }

}
