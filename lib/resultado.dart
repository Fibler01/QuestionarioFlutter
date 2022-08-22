import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 12) {
      return 'Parabéns!';
    } else if (pontuacao < 16) {
      return 'Vocé é fera!';
    } else if (pontuacao < 18) {
      return 'Impressionante!';
    } else {
      return 'Vocé é brabo!';
    }
  }

  /* final String texto; */
  /* const Resultado(this.texto); /* criando construtor de forma resumida */ */

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          
          onPressed: quandoReiniciarQuestionario,
          child: Text('Reiniciar',
          style: TextStyle(color: Colors.blue)),
          
          

        )
      ],
    );
  }
}
