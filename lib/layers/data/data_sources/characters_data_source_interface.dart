import 'package:gen_teste_flutter/layers/data/models/character_model.dart';

abstract class CharactersDataSourceInterface {

  Future<List<CharacterModel>> getCharactersList();

}