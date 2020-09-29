import 'package:flutter/material.dart';

class TituloNegritaWidget extends StatelessWidget {
  final String texto;
  TituloNegritaWidget(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 5.0),
      child: Text(
        texto,
        style: TextStyle(
            fontFamily: "Lato", fontSize: 20.0, fontWeight: FontWeight.w900),
      ),
    );
  }
}
