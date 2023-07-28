import 'dart:io';

List<String> board = List.generate(9, (_) => " "); //(_)= index
// List<String> board = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
int currentPlayer = 1;

void main() {
  printBoard();
  while (true) {
    print(
        "Player $currentPlayer's turn. Enter a number between 1 and 9 or 'stop' to end the game:");
    String input = stdin.readLineSync()!;
    if (input == "stop") {
      break;
    }
    int cell = int.tryParse(input)!;
    if (cell >= 1 && cell <= 9) {
      if (board[cell - 1] == " ") {
        board[cell - 1] = currentPlayer == 1 ? "X" : "O";
        printBoard();
        if (checkWin()) {
          print("Player $currentPlayer wins!");
          break;
        }
        if (board.every((element) => element != " ")) {
          print("It's a tie!");
          break;
        }
        currentPlayer = currentPlayer == 1 ? 2 : 1;
      } else {
        print("That cell is already taken.");
      }
    } else {
      print("Please enter a number between 1 and 9.");
    }
  }
}

void printBoard() {
  print("${board[0]}|${board[1]}|${board[2]}");
  print("-+-+-");
  print("${board[3]}|${board[4]}|${board[5]}");
  print("-+-+-");
  print("${board[6]}|${board[7]}|${board[8]}");
}

bool checkWin() {
  return checkLine(0, 1, 2) ||
      checkLine(3, 4, 5) ||
      checkLine(6, 7, 8) ||
      checkLine(0, 3, 6) ||
      checkLine(1, 4, 7) ||
      checkLine(2, 5, 8) ||
      checkLine(0, 4, 8) ||
      checkLine(2, 4, 6);
}

bool checkLine(int a, int b, int c) {
  return board[a] != " " && board[a] == board[b] && board[b] == board[c];
}
