int ebobHesapla(int kucukSayi, int buyukSayi) {
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
