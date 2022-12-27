import 'package:flutter/material.dart';
   
class CharacterCard extends StatefulWidget {

  final int position;
  final String posterPath;
  final String originalTitle;
  final String releaseDate;

  const CharacterCard({
    Key? key,
    required this.position,
    required this.posterPath,
    required this.originalTitle,
    required this.releaseDate,
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
        Container(
          height: 200,
          width: 130,
          alignment: Alignment.topRight,
          padding: EdgeInsets.all(8.0),
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            image: DecorationImage(  
              image: NetworkImage(widget.posterPath),
              fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12)
            )
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
        SizedBox(
          height: 10,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(  
            maxWidth: 130,
          ),
          child: Text(
            widget.originalTitle,
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
          '(${widget.releaseDate.split('-')[0]})',
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