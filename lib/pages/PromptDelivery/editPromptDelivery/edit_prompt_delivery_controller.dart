import 'dart:async';

import 'package:ficos_app/models/prompt_delivery_model.dart';
import 'package:ficos_app/repositories/prompt_delivery_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
part 'edit_prompt_delivery_controller.g.dart';

class EditPromptDeliveryController = _EditPromptDeliveryBase with _$EditPromptDeliveryController;

abstract class _EditPromptDeliveryBase with Store {

  final repositoryPromptDelivery = Modular.get<PromptDeliveryRepository>();


  _EditPromptDeliveryBase(){
    this.getPromptDeliveryByServer();
  }


  @observable
  Completer<GoogleMapController> controllerMap = Completer();

  @observable
  TextEditingController textTeste = new TextEditingController();

  @observable
  double latitudeUser = -29.626117;

  @observable
  double longitudeUser = -50.848332;

  @observable
  double latitudePrompt;

  @observable
  double longitudePrompt;

  @observable
  dynamic reach = 100;

  @observable
  int id;

  @observable
  String textSuccess = "";

  @observable
  String textError = "";

  @observable
  List<dynamic> itens = List();

  @observable
  CameraPosition cameraPositionMap = CameraPosition(
      target: LatLng(-29.626117, -50.848332),
      zoom: 15
  );

  @action
  getPromptDeliveryByServer() async {
    if (this.id != null) {
      try {
        PromptDelivery promptDeliveryFromServer = await this.repositoryPromptDelivery.getById(this.id.toString());
        var listItens = promptDeliveryFromServer.items;
        itens = listItens;
        print(promptDeliveryFromServer);
      } catch (err) {
        print(err);
      }
    }
  }

  @action
  completedMap(GoogleMapController controller) {
    controllerMap.complete(controller);
    this.circle.add(Circle(
        center: LatLng(latitudeUser, longitudeUser),
        circleId: CircleId("87466"),
        radius: 100,
        fillColor: Color(0xFF2CDBA3).withOpacity(0.5),
        strokeColor: Color(0xFF2CDBA3),
        strokeWidth: 3
    ));
  }

  @observable
  double valueSlide = 100;

  @observable
  Set<Circle> circle = {};


  double calcZoomMap(double value) {
    if (value <= 200) {
      return 15;
    } else if (value <= 700) {
      return 14;
    } else if (value <= 1000) {
      return 13;
    } else if (value <= 2000) {
      return 12;
    } else if (value <= 3000) {
      return 11;
    } else if (value <= 4000) {
      return 10;
    }
  }

  @action
  changeRadiusSlide(double result) async {
    this.circle = Set.from([Circle(
        center: LatLng(latitudeUser, longitudeUser),
        circleId: CircleId("8974984"),
        radius: result,
        fillColor: Color(0xFF2CDBA3).withOpacity(0.5),
        strokeColor: Color(0xFF2CDBA3),
        strokeWidth: 3
    )]);
    double zoomPerso = calcZoomMap(result);
    GoogleMapController googleMapController = await this.controllerMap.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(latitudeUser, longitudeUser),
          zoom: zoomPerso
      ))
    );
    this.valueSlide = result;
    this.reach = result;
  }



  @action
  positionOfUser() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print('AQUI MAICON' + this.latitudePrompt.toString() + this.longitudeUser.toString() + reach.toString());
    if (this.latitudePrompt != null && this.longitudeUser != null && reach != null) {
      this.latitudeUser = this.latitudePrompt;
      this.longitudeUser = this.longitudeUser;
      this.circle = Set.from([Circle(
          center: LatLng(latitudeUser, longitudeUser),
          circleId: CircleId("51566"),
          radius: reach.toDouble(),
          fillColor: Color(0xFF2CDBA3).withOpacity(0.5),
          strokeColor: Color(0xFF2CDBA3),
          strokeWidth: 3
      )]);
      GoogleMapController googleMapController = await this.controllerMap.future;
      double zoomPerso = calcZoomMap(reach.toDouble());
      googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(latitudeUser, longitudeUser),
              zoom: zoomPerso
          ))
      );
      this.valueSlide = reach.toDouble();
      return;
    }
    if(position != null) {
      this.latitudeUser = position.latitude;
      this.longitudeUser = position.longitude;
      this.circle = Set.from([Circle(
          center: LatLng(latitudeUser, longitudeUser),
          circleId: CircleId("4554"),
          radius: 100,
          fillColor: Color(0xFF2CDBA3).withOpacity(0.5),
          strokeColor: Color(0xFF2CDBA3),
          strokeWidth: 3
      )]);
      GoogleMapController googleMapController = await this.controllerMap.future;
      googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(latitudeUser, longitudeUser),
              zoom: 15
          ))
      );
      return;
    }
    this.circle = Set.from([Circle(
        center: LatLng(latitudeUser, longitudeUser),
        circleId: CircleId("4554"),
        radius: 100,
        fillColor: Color(0xFF2CDBA3).withOpacity(0.5),
        strokeColor: Color(0xFF2CDBA3),
        strokeWidth: 3
    )]);
    GoogleMapController googleMapController = await this.controllerMap.future;
    googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(latitudeUser, longitudeUser),
            zoom: 15
        ))
    );
  }

  @action
  savePromptDelivery() async {
    try {
      PromptDelivery promptDelivery = await repositoryPromptDelivery.updatePromptDelivery(
          promptDelivery: new PromptDelivery(
            id: this.id,
            name: this.textTeste.text,
            latitude: this.latitudePrompt == null ? this.latitudeUser : this.latitudePrompt,
            longitude: this.longitudePrompt == null ? this.longitudeUser : this.longitudePrompt,
            reach: this.valueSlide
          )
      );
      textSuccess = "Pronta entrega atualizada com sucesso";
    } catch (expection) {
      if (expection.response = null || expection.response.statusCode == 500) {
        textError = "Houve um erro, por favor tente mais tarde";
        return;
      }
    }
  }

}
