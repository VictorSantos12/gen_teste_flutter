import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:gen_teste_flutter/layers/data/repositories/characters_repository.dart';
import 'package:gen_teste_flutter/layers/data/data_sources/characters_data_source.dart';

import 'package:gen_teste_flutter/layers/presenter/pages/home_page/home_page.dart';
import 'package:gen_teste_flutter/layers/presenter/pages/character_page/character_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CharactersDataSource>(
          create: (_) => CharactersDataSource(),
        ),
        Provider<CharactersRepository>(
          create: (_) => CharactersRepository(
            charactersDataSourceInterface: CharactersDataSource(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(  
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/character-page': (context) => CharacterPage(),
        },
      ),
    );
  }
}

