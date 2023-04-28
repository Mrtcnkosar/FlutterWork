import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ebob ve Ekok Hesaplama',
      home: EbobEkokHesaplama(),
    );
  }
}

class EbobEkokHesaplama extends StatefulWidget {
  @override
  _EbobEkokHesaplamaState createState() => _EbobEkokHesaplamaState();
}

class _EbobEkokHesaplamaState extends State<EbobEkokHesaplama> {
  final TextEditingController _sayi1Controller =
      TextEditingController();
  final TextEditingController _sayi2Controller =
      TextEditingController();

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

      ebob = _ebobHesapla(kucukSayi, buyukSayi);
      ekok = (sayi1 * sayi2) ~/ ebob;
    });
  }

  int _ebobHesapla(int kucukSayi, int buyukSayi) {
    if (buyukSayi % kucukSayi == 0) {
      return kucukSayi;
    }

    for (int i = kucukSayi ~/ 2; i >= 1; i--) {
      if (kucukSayi % i == 0 && buyukSayi % i == 0) {
        return i;
      }
    }
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ebob ve Ekok Hesaplama'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
            16.0),
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
            SizedBox(height: 20.0),
            ElevatedButton(
             onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SonucSayfasi(ebob: ebob, ekok: ekok),
      ),
    );
  },
  child: Text('Sonuçları Gör'),
  style: ElevatedButton.styleFrom(
    primary: Colors.blueAccent,
    textStyle: TextStyle(color: Colors.white),
  ),
),
