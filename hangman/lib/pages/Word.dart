import 'package:flutter/material.dart';
import 'package:hangman/helper.dart';

class Word extends StatefulWidget {
  final List<String> wordChar;

  Word({
    this.wordChar,
  });

  @override
  _WordState createState() => _WordState();
}

class _WordState extends State<Word> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final fontSize = data.size.width * 0.15;
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(widget.wordChar.length, (index) {
            return getLetter(index, fontSize);
          }),
        ),
      ),
    );
  }

  Widget getLetter(int index, double fontSize) {
    return Container(
      child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Center(
                  child: Text(
                    widget.wordChar[index],
                    style: TextStyle(
                      color: widget.wordChar[index] == '?' ? black : gray,
                      fontSize: fontSize,
                    ),
                  ),
                ),
              ),
              ContainerLine(size: fontSize),
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerLine extends StatelessWidget {
  final double size;
  ContainerLine({
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.0,
      width: size,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: red,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
