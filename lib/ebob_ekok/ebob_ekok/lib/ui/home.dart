import 'package:flutter/material.dart';
import 'package:ebob_ekok/util/mathe_ebob_ekok_hesaplama.dart';

class EbobEkokHesaplama extends StatefulWidget {
  @override
  _EbobEkokHesaplamaState createState() => _EbobEkokHesaplamaState();
}

class _EbobEkokHesaplamaState extends State<EbobEkokHesaplama> {
  final TextEditingController _sayi1Controller = TextEditingController();
  final TextEditingController _sayi2Controller = TextEditingController();

  int sayi1 = 0;
  int sayi2 = 0;
  int ebob = 0;
  int ekok = 0;

  void _hesapla() {
    setState(() {
      sayi1 = int.tryParse(_sayi1Controller.text) ?? 0;
      sayi2 = int.tryParse(_sayi2Controller.text) ?? 0;

      int kucukSayi = (sayi1 < sayi2) ? sayi1 : sayi2;
      int buyukSayi = (sayi1 > sayi2) ? sayi1 : sayi2;

      ebob = ebobHesapla(kucukSayi, buyukSayi);
      ekok = (sayi1 * sayi2) ~/ ebob;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ebob ve Ekok Hesaplama'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _sayi1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'İlk sayı',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _sayi2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'İkinci sayı',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: _hesapla,
              child: Text('Hesapla'),
            ),
            SizedBox(height: 10.0),
            Text(
              'Ebob: $ebob',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Ekok: $ekok',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
