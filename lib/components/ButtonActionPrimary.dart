import 'package:flutter/material.dart';

class ButtonActionPrimary extends StatelessWidget {

  final String label;
  final Function onPressed;
  final int color;

  ButtonActionPrimary({
    @required this.label,
    @required this.onPressed,
    this.color = 0xFF2CDBA3,
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
      color: Color(this.color),
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6)
      ),
      onPressed: this.onPressed,
    );
  }
}

