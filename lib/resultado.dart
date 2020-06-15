import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciar;

  Resultado(this.pontuacao, this.reiniciar);

  String get resultado {
    if (pontuacao < 0) {
      return 'Pato demais sua pontuação é $pontuacao';
    } else if (pontuacao < 8) {
      return 'Ruim demais sua pontuação é $pontuacao';
    } else if (pontuacao < 12) {
      return 'Tá melhorando sua pontuação é $pontuacao';
    } else if (pontuacao < 16) {
      return 'Boa Guri sua pontuação é $pontuacao';
    } else {
      return 'Vc é foda sua pontuação é $pontuacao';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultado,
            style: TextStyle(fontSize: 26),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          RaisedButton(
            child: Text(
              'Reiniciar questionario',
              style: TextStyle(fontSize: 26),
            ),
            padding: const EdgeInsets.all(15.0),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: reiniciar,
          ),
        ],
      ),
    );
  }
}
