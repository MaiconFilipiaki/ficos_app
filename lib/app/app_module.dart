import 'package:dio/dio.dart';
import 'package:ficos_app/app/app_widget.dart';
import 'package:ficos_app/config/custom_dio.dart';
import 'package:ficos_app/pages/Home/home_page.dart';
import 'package:ficos_app/pages/Home/home_controller.dart';
import 'package:ficos_app/pages/Login/login_controller.dart';
import 'package:ficos_app/pages/Login/login_page.dart';
import 'package:ficos_app/pages/PromptDelivery/editPromptDelivery/edit_prompt_delivery_page.dart';
import 'package:ficos_app/pages/PromptDelivery/editPromptDelivery/edit_prompt_delivery_controller.dart';
import 'package:ficos_app/pages/PromptDelivery/formPromptDelivery/form_prompt_delivery_controller.dart';
import 'package:ficos_app/pages/PromptDelivery/formPromptDelivery/form_prompt_delivery_page.dart';
import 'package:ficos_app/pages/PromptDelivery/listPrompDelivery/list_prompt_delivery_controller.dart';
import 'package:ficos_app/pages/PromptDelivery/listPrompDelivery/list_prompt_delivery_page.dart';
import 'package:ficos_app/pages/item/formItem/form_item_controller.dart';
import 'package:ficos_app/pages/item/formItem/form_item_page.dart';
import 'package:ficos_app/pages/register/register_controller.dart';
import 'package:ficos_app/pages/register/register_page.dart';
import 'package:ficos_app/repositories/item_repository.dart';
import 'package:ficos_app/repositories/login_repository.dart';
import 'package:ficos_app/repositories/prompt_delivery_repository.dart';
import 'package:ficos_app/repositories/register_repository.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {

  @override
  List<Bind> get binds => [
    Bind((i) => RegisterRepository()),
    Bind((i) => RegisterController()),
    Bind((i) => LoginRepositoty()),
    Bind((i) => LoginController()),
    Bind((i) => HomeController()),
    Bind((i) => PromptDeliveryRepository()),
    Bind((i) => FormPromptDeliveryController()),
    Bind((i) => ListPromptDeliveryController()),
    Bind((i) => EditPromptDeliveryController()),
    Bind((i) => ItemRepository()),
    Bind((i) => FormItemController())
  ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [
    Router("/", child: (_, args) => Home()),
    Router("/login", child: (_, args) => Login()),
    Router("/register", child: (_, args) => RegisterPage()),
    Router("/listPrompt", child: (_, args) => ListPrompDelivery()),
    Router("/formPrompt", child: (_, args) => FormPromptDeliveryPage()),
    Router(
        "/editPromptDelivery",
        child: (_, args) =>
            EditPromptDeliveryPage(promptEdit: args.data)
    ),
    Router(
        "/formItem",
        child: (_, args) => FormItemPage(itemEdit: args.data)
    ),
  ];

}