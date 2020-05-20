import 'package:ficos_app/app/app_widget.dart';
import 'package:ficos_app/pages/Home/Home.dart';
import 'package:ficos_app/pages/Login/Login.dart';
import 'package:ficos_app/pages/register/register_controller.dart';
import 'package:ficos_app/pages/register/register_page.dart';
import 'package:ficos_app/repositories/register_repository.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {

  @override
  List<Bind> get binds => [
    Bind((i) => RegisterRepository()),
    Bind((i) => RegisterController())
  ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [
    Router("/", child: (_, args) => Home()),
    Router("/login", child: (_, args) => Login()),
    Router("/register", child: (_, args) => RegisterPage()),
  ];

}