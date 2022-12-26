import 'package:gen_teste_flutter/core/use_case.dart';
import 'package:gen_teste_flutter/layers/domain/entities/character_entity.dart';

import '../repositories/characters_repository.dart';

class GetCharactersList implements AUseCase<CharacterEntity> {
  
  final ACharactersRepository repository;
  
  GetCharactersList({
    required this.repository,
  });
  
  @override
  Future<Map<dynamic, CharacterEntity>> call() async {
    return await repository.getCharactersList();
  }
  
}
