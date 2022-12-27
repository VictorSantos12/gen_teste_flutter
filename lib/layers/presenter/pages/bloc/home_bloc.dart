import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen_teste_flutter/layers/data/models/character_model.dart';
import 'package:gen_teste_flutter/layers/data/repositories/characters_repository.dart';
import 'package:gen_teste_flutter/layers/presenter/pages/bloc/home_states.dart';
import 'package:provider/provider.dart';

import 'home_events.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {

  final BuildContext context;

  HomeBloc({required this.context}) : super(Initial()) {

   final CharactersRepository charactersRepository = Provider.of<CharactersRepository>(context);

    on<GetCharactersEvent>((event, emit) async {
      emit(Loading());
      await Future.delayed(const Duration(seconds: 2));
      try {
        
        List<CharacterModel> characters = await charactersRepository.getCharactersList();
        emit(Success(characters: characters));

      } on Exception {
        emit(Error(error: 'error'));
      }
    });
  }
}
