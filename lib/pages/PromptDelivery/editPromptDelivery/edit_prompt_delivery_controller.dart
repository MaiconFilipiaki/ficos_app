import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
part 'edit_prompt_delivery_controller.g.dart';

class EditPromptDeliveryController = _EditPromptDeliveryBase with _$EditPromptDeliveryController;

abstract class _EditPromptDeliveryBase with Store {

  _EditPromptDeliveryBase(){
    this.positionOfUser();
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
  CameraPosition cameraPositionMap = CameraPosition(
      target: LatLng(-29.626117, -50.848332),
      zoom: 15
  );

  @action
  completedMap(GoogleMapController controller) {
    controllerMap.complete(controller);
    this.circle.add(Circle(
        center: LatLng(latitudeUser, longitudeUser),
        circleId: CircleId("4554"),
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


  @action
  changeRadiusSlide(double result) async {
    this.circle = Set.from([Circle(
        center: LatLng(latitudeUser, longitudeUser),
        circleId: CircleId("4554"),
        radius: result,
        fillColor: Color(0xFF2CDBA3).withOpacity(0.5),
        strokeColor: Color(0xFF2CDBA3),
        strokeWidth: 3
    )]);
    double zoomPerso = 10;
    if (result <= 200) {
      zoomPerso = 15;
    } else if (result <= 700) {
      zoomPerso = 14;
    } else if (result <= 1000) {
      zoomPerso = 13;
    } else if (result <= 2000) {
      zoomPerso = 12;
    } else if (result <= 3000) {
      zoomPerso = 11;
    } else if (result <= 4000) {
      zoomPerso = 10;
    }
    GoogleMapController googleMapController = await this.controllerMap.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(latitudeUser, longitudeUser),
          zoom: zoomPerso
      ))
    );
    this.valueSlide = result;
  }



  @action
  positionOfUser() async {
    Position position = await Geolocator()
        .getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
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

    }
  }

}
