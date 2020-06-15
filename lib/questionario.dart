import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) selecionarResposta;
  Questionario(
      {@required this.perguntaSelecionada,
      @required this.perguntas,
      @required this.selecionarResposta});

  bool get temPergunta {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> listaRespostas =
        temPergunta ? perguntas[perguntaSelecionada]['respostas'] : [];

    return Container(
      padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['questao']),
        // ...respostas
        ...listaRespostas.map((e) => Resposta(e['texto'], () => selecionarResposta(e['pontuacao']))).toList()
      ],
    ));
  }
}
