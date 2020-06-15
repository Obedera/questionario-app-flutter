import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(PerguntasApp());

class PerguntasApp extends StatefulWidget {
  @override
  _PerguntasAppState createState() => _PerguntasAppState();
}

class _PerguntasAppState extends State<PerguntasApp> {
  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;

  List<Map<String, Object>> _perguntas = [
    {
      'questao': 'Qual é o maior time de SP?',
      'respostas': [
        {'texto': 'Santos', 'pontuacao': 5},
        {'texto': 'São Paulo', 'pontuacao': 8},
        {'texto': 'Corinthians', 'pontuacao': 10},
        {'texto': 'Palmeiras', 'pontuacao': 0},
      ]
    },
    {
      'questao': 'Que time não tem mundial?',
      'respostas': [
        {'texto': 'Palmeiras', 'pontuacao': 10},
        {'texto': 'São Paulo', 'pontuacao': 3},
        {'texto': 'Santos', 'pontuacao': 7},
        {'texto': 'Corinthians', 'pontuacao': -10},
      ]
    }
  ];

  void _selecionarResposta(int pontuacao) {
    if (temPergunta) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPergunta {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Perguntas app"),
          ),
          body: temPergunta
              ? Questionario(
                  perguntaSelecionada: _perguntaSelecionada,
                  perguntas: _perguntas,
                  selecionarResposta: _selecionarResposta,
                )
              : Resultado(_pontuacaoTotal, _reiniciarQuestionario)),
    );
  }
}
