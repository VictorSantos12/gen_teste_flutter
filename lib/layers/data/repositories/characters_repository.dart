import 'package:gen_teste_flutter/layers/data/models/character_model.dart';
import 'package:gen_teste_flutter/layers/domain/repositories/characters_repository_interface.dart';

import '../data_sources/characters_data_source_interface.dart';

class CharactersRepository implements CharactersRepositoryInterface {
  
  final CharactersDataSourceInterface charactersDataSourceInterface;
  
  CharactersRepository({
    required this.charactersDataSourceInterface,
  });
  
  @override
  Future<List<CharacterModel>> getCharactersList() async {
   
    try {
     
     final result = await charactersDataSourceInterface.getCharactersList();
     return result;
 
    } on Exception { 
      throw Error();
    }
  }

}
