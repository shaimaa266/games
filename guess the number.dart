import 'dart:io';
import 'dart:math';

void main() {
  final random = Random();
  final mynum = random.nextInt(100) + 1;
  int counter = 7;
  for (int i = 0; i < counter + 1; i++) {
    print('enter a number from 1 to 100');
    int u_answer = int.parse(stdin.readLineSync()!);
    if (u_answer < mynum) {
      print('too low ! try again ');
    } else if (u_answer > mynum) {
      print('too high..try again!');
    } else {
      print('exactly  bravo! ');
    }
  }
  print('no more trail ..the number was$mynum ..good luck another time.');
}
