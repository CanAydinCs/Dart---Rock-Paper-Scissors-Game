import 'dart:io';
import 'dart:math';

enum Role{
  Rock,
  Paper,
  Scissors
}

void main(List<String> args) {
  bool quit = false;

  while (!quit) {
    Role player = GetPlayer();
    Role computer = GetRandom();

    if(player == computer){
      print("Tie.");
    }
    else if((player == Role.Paper && computer == Role.Rock) || (player == Role.Scissors && computer == Role.Paper) || (player == Role.Rock && computer == Role.Scissors)){
      print("Win.");
    }
    else{
      print("Lose.");
    }

    print("Press 'q' if you want to quit.");
    quit = stdin.readLineSync().toString().toLowerCase() == "q";
  }
}

Role GetPlayer(){
  bool selected = false;
  Role player = Role.Rock;

  while (!selected) {
      print("Please select one of following (Rock, Paper, Scissors):");
      String secim = stdin.readLineSync().toString().toUpperCase();

      if(secim == "ROCK"){
        player = Role.Rock;
        selected = true;
      }
      else if(secim == "PAPER"){
        player = Role.Paper;
        selected = true;
      }
      else if(secim == "SCISSORS"){
        player = Role.Scissors;
        selected = true;
      }
  }

  return player;
}

Role GetRandom(){
  var rng = new Random();

  int randomChoose = rng.nextInt(3);
  Role computer;

  switch (randomChoose) {
    case 0:
      computer = Role.Rock;
      break;
    case 1:
      computer = Role.Paper;
      break;
    default:
      computer = Role.Scissors;
      break;
  }

  return computer;
}