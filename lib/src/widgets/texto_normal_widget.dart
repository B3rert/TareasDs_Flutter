import 'package:flutter/material.dart';

class TextoNormalWidget extends StatelessWidget {
  final String texto;
  TextoNormalWidget(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 5.0, right: 20.0),
      child: Text(
        texto,
        style: TextStyle(
            fontFamily: "Lato", fontSize: 18.0, fontWeight: FontWeight.w500),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
