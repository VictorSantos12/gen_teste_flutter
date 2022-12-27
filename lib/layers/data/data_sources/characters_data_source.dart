import 'package:flutter/services.dart';
import 'package:gen_teste_flutter/layers/data/models/character_model.dart';
import 'package:gen_teste_flutter/layers/data/data_sources/characters_data_source_interface.dart';

class CharactersDataSource implements CharactersDataSourceInterface {
  @override
  Future<List<CharacterModel>> getCharactersList() async {
    final Map mock = rootBundle.loadString('./mock.json') as Map;

    final List<CharacterModel> characters = mock['mcu'] as List<CharacterModel>;
    
    return characters;
  }

}