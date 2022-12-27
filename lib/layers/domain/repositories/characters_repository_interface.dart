import 'package:gen_teste_flutter/layers/domain/entities/character_entity.dart';

abstract class CharactersRepositoryInterface {
   
   Future<List<CharacterEntity>> getCharactersList();
   
}