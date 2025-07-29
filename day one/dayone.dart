import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  int nyawa = 3;
  int angkaRandom = Random().nextInt(10);
  for (var i = 0; i < nyawa; i++) {
    stdout.write("Masukkan angka: ");
    int input = int.parse(stdin.readLineSync()!);

    if (input == angkaRandom) {
      print("Selamat, anda benar");

      break;
    } else if (input > angkaRandom) {
      print("Terlalu besar");
      print('nyawa tinggal ${nyawa - i - 1}');
    } else {
      print("Terlalu kecil");
      print('nyawa tinggal ${nyawa - i - 1}');
    }
  }
}
