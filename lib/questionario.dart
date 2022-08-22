import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder; /* declarando funcao responder */

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
    /* required diz que sao obrigatorios */
  }); /* fazendo construtor(variaveis sao finals, precisa inicializar) */
  bool get temPerguntaSelecionada {
    return perguntaSelecionada <
        perguntas
            .length; /* se pergunta selecionada for menor que tamanho da lista, é verdade*/
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['resposta']
        : [];
    return Column(
      /* se tem pergunta selecionada, coloca a coluna, se nao, nao mostra nada */
      children: [
        Questao(perguntas.elementAt(perguntaSelecionada)['texto'].toString()),
        /* acessando o valor do map texto */
        /* Aqui, chamando o outro componente, questao.dart*/
        ...respostas.map((resp) {  /* retornando todos os botoes responder com seu texto e pontuacao */
          return Resposta(  /* quando clica para responder, ele retorna o texto, + a pontuacao do botao clicado */
            resp['texto'].toString(),
            () => quandoResponder(int.parse(resp['pontuacao'].toString())),
          );
        }) /* resposta recebe como segundo parametro a pontuacao */
            .toList(), /* criando o numero de botoes baseado no numero de resposta la do Map */
      ],
    );
  }
}
