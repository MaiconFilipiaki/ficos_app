import 'package:flutter/material.dart';

class InputCustomizado extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final bool autofocus;
  final bool obscure;
  final TextInputType type;
  final IconData icon;

  InputCustomizado({
    @required this.controller,
    @required this.hint,
    @required this.icon,
    this.obscure = false,
    this.autofocus = false,
    this.type = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      autofocus: this.autofocus,
      keyboardType: this.type,
      obscureText: this.obscure,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 20, 32, 20),
          prefixIcon: Icon(this.icon),
          hintText: this.hint,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6)
          )
      ),
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }
}
