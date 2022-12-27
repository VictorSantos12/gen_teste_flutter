import 'package:gen_teste_flutter/layers/data/models/character_model.dart';

abstract class HomeStates {}

class Initial extends HomeStates {}

class Loading extends HomeStates {}

class Success extends HomeStates {
  
  final List<CharacterModel> characters;

  Success({
    required this.characters,
  });
}

class Error extends HomeStates {

  final String error;
  
  Error({
    required this.error,
  });
  
}
