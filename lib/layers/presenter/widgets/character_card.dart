import 'package:flutter/material.dart';
import 'package:gen_teste_flutter/layers/data/models/character_model.dart';
   
class CharacterCard extends StatefulWidget {

  final int position;
  final CharacterModel character;

  const CharacterCard({
    Key? key,
    required this.position,
    required this.character,
  }) : super(key: key);

  @override
  _CharacterCardState createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            '/character-page',
            arguments: widget.character.toMap(),
          ),
          child: Container(
            height: 200,
            width: 130,
            alignment: Alignment.topRight,
            padding: EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              image: DecorationImage(  
                image: NetworkImage(widget.character.posterPath),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(12)
              ),
              color: Colors.black,
            ),
            child: Container(  
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(111, 138, 130, 130),
              ),
              child: Text(
                '${widget.position}',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(  
            maxWidth: 130,
          ),
          child: Text(
            widget.character.title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '(${widget.character.releaseDate.split('-')[0]})',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}