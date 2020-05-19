import 'package:flutter/material.dart';

class ButtonActionPrimary extends StatelessWidget {

  final String label;
  final Function onPressed;

  ButtonActionPrimary({
    @required this.label,
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        this.label,
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
      onPressed: this.onPressed,
    );
  }
}

