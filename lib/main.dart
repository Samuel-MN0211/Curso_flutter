import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Layout'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButtonColumn(Icons.call, 'CALL'),
                buildButtonColumn(Icons.near_me, 'ROUTE'),
                buildButtonColumn(Icons.share, 'SHARE'),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget buildButtonColumn(IconData icon, String label) {
    // ignore: prefer_const_constructors
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        /* 
        -PRÁTICA DE LAYOUTS-

        Com o diagrama o que já aprendeu até então sobre Widgets tente replicar a NavBar no seu app!

        1. Crie um Widget Container() para armazenar o Icon() sendo passado como parâmetro
        Lembre-se de estilizar a cor dele

        2. Crie um Widget Text() para exibir a label passada como parâmetro
        Lembre-se também de estilizar a cor do texto

        VAI ALGUMAS DICAS :
        -> Para estilizar Widgets do tipo Icons(), pode criar-lo da seguinte maneira
        Icon(icon, color: SUACOR)

        -> Para estilizar Widgets do tipo Text(), pode criar-lo da seguinte maneira
        Text(
          label,
          style: const TextStyle(
              SEUS ESTILOS AQUI
            ),
          )

        -> Pode consultar o papai ChatGPT
        */
      ],
    );
  }
}