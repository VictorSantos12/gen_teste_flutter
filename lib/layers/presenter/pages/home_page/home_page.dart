import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen_teste_flutter/layers/presenter/pages/home_page/bloc/home_bloc.dart';
import 'package:gen_teste_flutter/layers/presenter/pages/home_page/bloc/home_events.dart';
import 'package:gen_teste_flutter/layers/presenter/pages/home_page/bloc/home_states.dart';
import 'package:gen_teste_flutter/layers/presenter/widgets/character_card.dart';
import 'package:gen_teste_flutter/layers/presenter/widgets/loading_characters_list.dart';
    
class HomePage extends StatefulWidget {

  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  
  late HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
 
  }

  @override
  Widget build(BuildContext context) {

    homeBloc = HomeBloc(context: context);
    homeBloc.add(GetCharactersEvent());

    return Scaffold(
      drawer: Container(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(  
            image: AssetImage('assets/images/avengers_poster.jpg'),
            fit: BoxFit.cover,
            opacity: 90,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBar(
              elevation: 0,
              title: Image.asset(
                'assets/images/marvel_studios.png',
                height: 35,
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'MARVEL\nCINAMATIC\nUNIVERSE',
                      style: TextStyle(  
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'LINHA DO TEMPO',
                      style: TextStyle(  
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  BlocBuilder<HomeBloc, HomeStates>(
                    bloc: homeBloc,
                    builder: (context, state) {
                      if(state is Loading) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 2.8,
                          child: LoadingCharactersList(),
                        );
                      } else if(state is Error) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 2.8,
                        );
                      } else if(state is Success) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 2.8,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.characters.length,
                            padding: EdgeInsets.only(left: 20),
                            itemBuilder: (context, index) {
                              return CharacterCard(
                                position: index + 1,
                                character: state.characters[index],
                              );
                            },
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 2.8,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}