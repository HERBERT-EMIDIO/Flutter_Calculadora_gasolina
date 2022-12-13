import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            "O número que você digitou é inválido. Digite números maiores que (0) e use o ponto(.) como separador.";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com Gasolina";
        });
      } else {
        setState(() {
          _textoResultado = "Melhor abastecer com Alcool";
        });
      }
      _limparCampos();
    }
  }

  void _limparCampos() {
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Álcool ou Gasolina'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Image.asset('assets/images/logo.png'),
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                // ignore: prefer_const_constructors
                child: Text(
                  'Saiba qual a melhor opção de abastecimento para seu veículo',
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                    labelText:
                        "Preço Alcool, ex 1.59" //exemplo para guiar o usuário
                    ),
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerAlcool,
                //controller:_controllerGasolina,
              ),
              TextField(
                keyboardType: TextInputType.number,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                    labelText:
                        "Preço Gasolina, ex 1.59" //exemplo para guiar o usuário
                    ),
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerGasolina,
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    primary: Colors.blueAccent,
                    onSurface: Colors.green, //
                    elevation: 20, //
                    shadowColor: Colors.amber, //
                  ),
                  onPressed: _calcular,
                  child: Text(
                    'Calcular',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
