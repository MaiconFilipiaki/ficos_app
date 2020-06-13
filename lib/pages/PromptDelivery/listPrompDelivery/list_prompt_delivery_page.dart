import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'list_prompt_delivery_controller.dart';

class ListPrompDelivery extends StatefulWidget {
  @override
  _ListPrompDeliveryState createState() => _ListPrompDeliveryState();
}

class _ListPrompDeliveryState extends ModularState<ListPrompDelivery, ListPromptDeliveryController> {

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Lista de Pronta Entregas"),
          ),
          body: Container(
            child: ListView.builder(
                itemCount: this.controller.listApresentation.length,
                itemBuilder: (BuildContext contextBuild, int index) {
                  return Dismissible(
                      key: UniqueKey(),
                      child: ListTile(
                        title: Row(
                          children: <Widget>[
                            Image.asset(
                              "imgs/image-not-found.png",
                              width: 70,
                              height: 70,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    this.controller.listApresentation[index].name.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text(
                                      "Sapato bege, sapato tens",
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.grey
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ),
                      background: Container(
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        color: Colors.red,
                        alignment: Alignment.centerLeft,
                      ),
                      secondaryBackground: Container(
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        color: Colors.blue,
                        alignment: Alignment.centerRight,
                      ),
                      onDismissed: (DismissDirection dir) {
                        if (dir == DismissDirection.startToEnd) {
                          this.controller.deleteItem(index);
                          Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Pronta entrega deletada"),
                              )
                          );
                        } else {
                          this.controller.editPromptDelivery(
                              this.controller.listApresentation[index],
                              index
                          );
                        }
                      },
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
    );
  }
}