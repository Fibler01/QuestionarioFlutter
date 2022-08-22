import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function()
      quandoSelecionado; /* definindo uma funcao quandoSelecionado */

  const Resposta(
      this.texto, this.quandoSelecionado); /* criando construtor de forma resumida, resposta recebe um texto e uma function, se trata de um elevated button, que mostra o texto recebido */

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      /* estica o botao, fica com a largura do container */
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          /* muda a cor do texto do botão */
          primary: Colors.blue, /* muda o bg color do botão */
        ),
        /* basicamente um bgcolor */
        onPressed: quandoSelecionado,  /* quando clicou no botao, chama a funçao que ta sendo
        recebida como parametro */
        /* função */
        child: Text(texto),
      ),
    );
  }
}
