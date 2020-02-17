import 'package:flutter/material.dart'; // importamos todos os widget relacionados ao material

void main() { // Todo o projeto deve inciar com void main
  runApp( // Comando para rodar o App, temos que passar um widget como parâmetro
      MaterialApp( //Widget do tipo MaterialApp, para que o nosso App suporte wigdets do tipo Material Design
        title: "Contador de pessoas", // parãmetro opcional ( o título não será visível no app )// Define a página inicial da nossa aplicação, passamos um widget de parâmetro
        home: Home() ));
}

//widget statefull = Que muda a sua forma
class Home extends StatefulWidget { // Classe Home que extende um State
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> { // A função build é chamada sempre que quisermos modificar alguma coisa no nosso layout

  int _people = 0;
  String _infoText = "Pode Entrar!";

  void _changePeople(int delta){
    setState(() { // Comando para atualizar a tela
      _people += delta;

      if( _people < 0 ){
        _infoText = "Mundo invertido?!";
      }else if(_people <= 10){
        _infoText = "Pode entrar!";
      }else{
        _infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack( // O primeiro item é o que vai ficar por baixo
      children: <Widget>[
        Image.asset( // Imagem definida no pubspec.yaml
          "images/restaurant.jpg",
          fit:BoxFit.cover, // Vai tentar cobrir a tela com a imagem ( Em dúvida olhar na documentação)
          height: 1000.0,
        ),
        Column( // Define a página inicial da nossa aplicação, passamos um widget de parâmetro -> Column ( permite colocar um widget abaixo do outro)
          mainAxisAlignment: MainAxisAlignment.center, // Alinhamento do eixo principal
          children: <Widget>[ // Passa para o widget as colunas que eu quero colocar
            Text(
              "Pessoas: $_people", // O texto em si
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold), // style: As formatações
            ),
            Row( // Adiciona uma linha para botar widgets lado a lado
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0), // Espaço em todas as direções
                  child: FlatButton(
                    child: Text("+1",style: TextStyle(fontSize: 40.0,color: Colors.white),) ,
                    onPressed: () {
                      _changePeople(1);
                      }, // trigger
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("-1",style: TextStyle(fontSize: 40.0,color: Colors.white),) ,
                    onPressed: () {
                      _changePeople(-1);
                    }, // trigger
                  ),
                )
              ],
            ),
            Text( // Primeiro widget da Column
              _infoText, // O texto em si
              style: TextStyle(color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0 ),
            )
          ],
        )
      ],
    );
  }
}









