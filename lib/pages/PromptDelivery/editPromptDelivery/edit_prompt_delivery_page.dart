import 'package:ficos_app/models/prompt_delivery_model.dart';
import 'package:flutter/material.dart';

class EditPromptDeliveryPage extends StatefulWidget {

  final PromptDelivery promptEdit;

  EditPromptDeliveryPage({this.promptEdit});

  @override
  _EditPromptDeliveryPageState createState() => _EditPromptDeliveryPageState();
}

class _EditPromptDeliveryPageState extends State<EditPromptDeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.promptEdit.name),
      ),
    );
  }
}

