import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
   
class CharacterPage extends StatelessWidget {
  
  const CharacterPage({
    Key? key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(  
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: const [
                Color(0xFF000000),
                Color(0xFF5C1FA1),
              ],
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
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
             Container(
               height: 300,
               width: 210,
               alignment: Alignment.topRight,
               padding: EdgeInsets.all(8.0),
               margin: const EdgeInsets.all(20),
               decoration: BoxDecoration(
                 color: Colors.black,
                 image: DecorationImage(  
                   image: NetworkImage('https://image.tmdb.org/t/p/original/${args['poster_path']}'),
                   fit: BoxFit.cover,
                 ),
                 borderRadius: BorderRadius.all(
                   Radius.circular(12)
                 ),
               ),
               child: Visibility(
                 visible: (args['adult'] == false),
                 child: Container(  
                   height: 30,
                   width: 30,
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                     color: Colors.green,
                     borderRadius: BorderRadius.all(
                       Radius.circular(5),
                     ),
                   ),
                   child: Text(
                     'L',
                     style: TextStyle(
                       fontSize: 17,
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
               ),
             ),
             Container(
               height: 30,
               width: MediaQuery.of(context).size.width,
               margin: const EdgeInsets.only(left: 20, right: 20),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                    '${args['vote_average']}',
                    style: TextStyle(  
                      fontSize: 16,
                      color: (args['vote_average'] >= 7) ? Colors.green : Colors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                   ),
                   SizedBox(
                    width: 10,
                   ),
                   RatingBarIndicator(
                     itemCount: 10,
                     itemSize: 15,
                     rating: args['vote_average'],
                     physics: BouncingScrollPhysics(),
                     itemBuilder: (context, _) => Icon(
                       Icons.star,
                       color: (args['vote_average'] >= 7) ? Colors.green : Colors.yellow,
                     ),
                   ),
                 ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(20),
               child: Column(
                 children: [
                   Text(
                      '${args['title']}',
                      style: TextStyle(  
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                     '${args['overview']}',
                     style: TextStyle(  
                       fontSize: 16,
                       color: Colors.white,
                       fontFamily: ''
                     ),
                     textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF5C1FA1),
    );
  }
}
