import 'package:flutter/material.dart';
import 'package:discmobile/services/via_cep_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Aplicação de apresentação"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                buildBuscarCep(),
                buildIconButton(),
              ],
            ),
          ),
          Text(_result ?? ""),
        ],
      ),
    );
  }

  Widget buildBuscarCep() {
    return Expanded(
      child: TextField(
        controller: tfController,
        decoration: InputDecoration(
          labelText: "Digite o CEP",
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget buildIconButton() {
    return IconButton(
      onPressed: receberEndereco,
      icon: Icon(Icons.check),
    );
  }

// Adicionar dados
  final tfController = TextEditingController();
  String dadosEndereco;

  Future receberEndereco() async {
    final String cep = tfController.text.toString();
    final resultCep = await ViaCepService.fetchCep(cep: cep);

    setState(() {
      _result = resultCep.toJson();
    });
  }
}
