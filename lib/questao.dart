import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;
  const Questao(this.texto); /* criando construtor de forma resumida */

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      /* assim ele faz o impacto de colocar o texto no centro */
      margin: EdgeInsets.all(10),
      /* adicionando margem a todos os lados dos componentes dentro do container */
      child: Text(
        texto,
        style: TextStyle(fontSize: 28),
        /* mudando tamanho do texto */
        textAlign: TextAlign.center,
      ),
    );
  }
}
