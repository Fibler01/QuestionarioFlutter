import 'package:flutter/material.dart';
import 'questionario.dart';
import 'resultado.dart';

main() =>
    runApp(PerguntaApp()); /* passando uma instancia da classe perguntaapp */

class PerguntaAppState extends State<PerguntaApp> {
  /* passa o componente que vc quer controlar o estado */
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    /*  */
    {
      'texto': 'Qual é a sua cor favorita?',
      'resposta': [
        {'texto': 'Preto', 'pontuacao': 8},
        /* map dentro do map, um map de texto, e nota */
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'resposta': [
        {'texto': 'Cachorro', 'pontuacao': 10},
        {'texto': 'Gato', 'pontuacao': 6},
        {'texto': 'Elefante', 'pontuacao': 5},
        {'texto': 'Leão', 'pontuacao': 4},
      ],
    },
    {
      'texto': 'Qual é o seu jogo favorito?',
      'resposta': [
        {'texto': 'The Last of Us', 'pontuacao': 9},
        {'texto': 'The Witcher 3', 'pontuacao': 10},
        {'texto': 'Call Of Duty', 'pontuacao': 8},
        {'texto': 'Fifa', 'pontuacao': 7},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() => {
            _perguntaSelecionada++,
            _pontuacaoTotal += pontuacao,
          });

      print(_pontuacaoTotal);
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0; /* assim ira voltar p o começo, com 0 pontos */
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada <
        _perguntas
            .length; /* se pergunta selecionada for menor que tamanho da lista, é verdade*/
  }

  @override /*  */
  Widget build(BuildContext context) {
    /* List<Widget> respostas = []; */

    /* se tem pergunta selecionada, pegue resposta, se nao, n faça nada */
    /* List<Widget> widgets =
        respostas.map((t) => Resposta(t, _responder)).toList(); */

    /* for(var textoResp in perguntas[  _perguntaSelecionada].cast()['resposta']){
      respostas.add(Resposta(textoResp, _responder));
      
    } Aqui foi feito a adicao de resposta utilizando for */

    return MaterialApp(
      debugShowCheckedModeBanner: false,  /* para retirar a faixa de debug */
      /* home: Text('Olá Flutter!'), /* widget de texto, preciso chamar no main
      p funcionar app */ */
      home: Scaffold(
        /* estrutura da aplicação (widget) */
        appBar: AppBar(
          /* barra do app (widget) */ centerTitle: true,
          /* para centralizar titulo */
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada /* se tem pergunta selecionada */
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario), /* o corpo do home, ficara embaixo de title/appbar */
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  /* tornando a classe um widget sem estado */

  PerguntaAppState createState() {
    /* necessario p transformar stateless em stateful */
    return PerguntaAppState();
  }
}

/* para colocar mais componentes no mesmo widget, tem como utilizar column*/