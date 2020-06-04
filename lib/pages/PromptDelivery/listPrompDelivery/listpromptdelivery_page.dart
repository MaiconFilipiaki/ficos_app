import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListPrompDelivery extends StatefulWidget {
  @override
  _ListPrompDeliveryState createState() => _ListPrompDeliveryState();
}

class _ListPrompDeliveryState extends State<ListPrompDelivery> {

  final List<String> entries = <String>['a', 'b', 'c','d','e','f','g','h','a', 'b', 'c','d','e','f','g','h','a', 'b', 'c','d','e','f','g','h'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Pronta Entregas"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.red,
              child: Center(
                child: Text(index.toString()),
              )
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        onPressed: (){
          Modular.to.pushNamed("/formPrompt");
        },
      ),
    );
  }
}

