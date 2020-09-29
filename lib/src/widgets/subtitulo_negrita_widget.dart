import 'package:flutter/material.dart';

class SubtituloNegritaWidget extends StatelessWidget {
  final String texto;
  SubtituloNegritaWidget(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 5.0),
      child: Text(
        texto,
        style: TextStyle(
            fontFamily: "Lato", fontSize: 17.0, fontWeight: FontWeight.w600),
      ),
    );
  }
}
