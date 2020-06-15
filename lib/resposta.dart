import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() selecionar;

  Resposta(this.texto, this.selecionar);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: EdgeInsets.all(15),
      child: RaisedButton(
        child: Text(
          texto,
          style: TextStyle(fontSize: 26),
        ),
        padding: const EdgeInsets.all(15.0),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: selecionar,
      ),
    );
  }
}
