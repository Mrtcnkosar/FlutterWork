import 'package:flutter/material.dart';

class EbobEkokCalculator extends StatefulWidget {
  @override
  _EbobEkokCalculatorState createState() => _EbobEkokCalculatorState();
}

class _EbobEkokCalculatorState extends State<EbobEkokCalculator> {
  int number1;
  int number2;
  int ebob;
  int ekok;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ebob Ekok Hesaplayıcı'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'İlk Sayı'),
              onChanged: (value) {
                number1 = int.parse(value);
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'İkinci Sayı'),
              onChanged: (value) {
                number2 = int.parse(value);
              },
            ),
            SizedBox(height: 10),
            RaisedButton(
              child: Text('Hesapla'),
              onPressed: () {
                _calculate();
              },
            ),
            SizedBox(height: 10),
            Text('Ebob: $ebob'),
            SizedBox(height: 10),
            Text('Ekok: $ekok'),
          ],
        ),
      ),
    );
  }

  void _calculate() {
    int a = number1;
    int b = number2;

    while (a != b) {
      if (a > b) {
        a -= b;
      } else {
        b -= a;
      }
    }

    setState(() {
      ebob = a;
      ekok = (number1 * number2) ~/ a;
    });
  }
}
**