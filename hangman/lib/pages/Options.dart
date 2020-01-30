import 'package:flutter/material.dart';
import 'package:hangman/helper.dart';

class Options extends StatefulWidget {
  final List<List<String>> options;
  final List<List<bool>> done;
  final Function pick, remove;

  Options({
    this.options,
    this.pick,
    this.remove,
    this.done,
  });

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final size = data.size.width * 0.15;
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(widget.options.length, (i) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(widget.options[i].length, (j) {
                return Option(
                  char: widget.options[i][j],
                  size: size,
                  x: i,
                  y: j,
                  pick: widget.pick,
                  remove: widget.remove,
                  color: widget.done[i][j] ? black : gray,
                );
              }),
            );
          }),
        ),
      ),
    );
  }
}

class Option extends StatefulWidget {
  final String char;
  final double size;
  final int x, y;
  final Function pick, remove;
  final Color color;

  Option({
    this.char,
    this.size,
    this.x,
    this.y,
    this.pick,
    this.remove,
    this.color,
  });

  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.pick(widget.char);
        widget.remove(widget.x, widget.y);
      },
      child: Container(
        height: widget.size,
        width: widget.size,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            widget.char,
            style: TextStyle(
              color: black,
              fontSize: widget.size * 0.75,
            ),
          ),
        ),
      ),
    );
  }
}
