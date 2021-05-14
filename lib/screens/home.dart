import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  final TextEditingController _valorReais = TextEditingController();
  final TextEditingController _cotacaoDollar = TextEditingController();
  double _resultado = 0;
  double _valorRs = 0;
  double _cotacaoDol = 0;

  _converterValores() {
    setState(() {
      _valorRs = double.parse(_valorReais.text);
      _cotacaoDol = double.parse(_cotacaoDollar.text);
      _resultado = _valorRs/_cotacaoDol;
    });
  }
  _limpar() {
    setState(() {
      _cotacaoDollar.clear();
      _valorReais.clear();
      _resultado = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Reais para Dólares'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.attach_money, size: 90,),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextField(
              controller: _valorReais,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(hintText: 'Valor em reais'),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextField(
              controller: _cotacaoDollar,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(hintText: 'Cotação do Dolar',),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _limpar,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Limpar"),
                ),
              ),
              ElevatedButton(
                onPressed: _converterValores,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Calcular"),
                ),
              ),
            ],
          ),
          Visibility(
            visible: _resultado > 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 20.0, right: 20),
              child: Text("Com R\$ ${_valorRs.toStringAsFixed(2)} é possível comprar U\$ ${_resultado.toStringAsFixed(2)} a U\$ ${_cotacaoDol.toStringAsFixed(2)} cada",
              style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),),
            )
          ),
        ],
      ),

    );
  }
}