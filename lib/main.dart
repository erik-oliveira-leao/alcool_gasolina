import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
    ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _resultado = "Informe os valores";

  void _limparCampos() {
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
    setState(() {
        _resultado = "Informe os valores";  
    });
  }

  void _calcular() {
    double precoAlcool = double.parse(_controllerAlcool.text.replaceAll(',', '.'));
    double precoGasolina = double.parse(_controllerGasolina.text.replaceAll(',', '.'));
    double proporcao = precoAlcool / precoGasolina; 

    _resultado = (proporcao < 0.7) ? "Melhor utilizar Álcool" : "Melhor utilizar Gasolina"; 
    setState(() {
      
    });



    
    
    //if (proporcao < 0.7) {
      
      //  _resultado = "Melhor utilizar Gasolina";
      
    //} else {
      
      //  _resultado = "Melhor utilizar Álcool";
      
    //}

  }   




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Álcool ou Gasolina",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            color: Colors.white,
            onPressed: () {
              _limparCampos();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.local_gas_station,
                size: 140.0,
                color: Colors.lightBlue[900],
              ),
              TextFormField(
                controller: _controllerAlcool,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Valor do Álcool",
                  labelStyle: TextStyle(color: Colors.lightBlue[900]),
                ),
                style: TextStyle(color: Colors.lightBlue[900], fontSize: 25.0),
              ),
              TextFormField(
                controller: _controllerGasolina,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Valor do Gasolina",
                  labelStyle: TextStyle(color: Colors.lightBlue[900]),
                ),
                style: TextStyle(color: Colors.lightBlue[900], fontSize: 25.0),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue[900],
                    ),
                    onPressed: () {
                      _calcular();
                    },
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                ),
              ),
              Text(
                _resultado,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlue[900], 
                  fontSize: 25.0
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
