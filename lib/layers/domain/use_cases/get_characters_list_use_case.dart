import 'package:gen_teste_flutter/core/use_case_interface.dart';
import 'package:gen_teste_flutter/layers/domain/entities/character_entity.dart';

import '../repositories/characters_repository_interface.dart';

class GetCharactersList implements UseCaseInterface<CharacterEntity> {
  
  final CharactersRepositoryInterface repository;
  
  GetCharactersList({
    required this.repository,
  });
  
  @override
  Future<List<CharacterEntity>> call() async {
    return await repository.getCharactersList();
  }
  
}
