import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman/helper.dart';
import 'AnimationPlayer.dart';
import 'Options.dart';
import 'Word.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> wordChar;
  List<List<String>> options;
  List<List<bool>> done;
  List<String> words;
  String word;
  int picks;

  @override
  void initState() {
    super.initState();
    wordChar = List();
    options = List();
    done = List();
    words = List();
    picks = 0;
    for (int i = 0; i < 5; i++) {
      wordChar.add('?');
    }
    for (int i = 0; i < 2; i++) {
      options.add(List());
      for (int j = 0; j < 5; j++) {
        options[i].add('?');
      }
    }
    for (int i = 0; i < 2; i++) {
      done.add(List());
      for (int j = 0; j < 5; j++) {
        done[i].add(false);
      }
    }
    for (int i = 0; i < allWords.length; i++) {
      if (allWords[i].length == 5) {
        words.add(allWords[i].toUpperCase());
      }
    }
    int rand = Random().nextInt(words.length);
    word = words[rand];
    for (int i = 0; i < 5; i++) {
      if (options[0].contains(word[i]) || options[1].contains(word[i])) {
        continue;
      }
      int x = Random().nextInt(2);
      int y = Random().nextInt(5);
      while (options[x][y] != '?') {
        x = Random().nextInt(2);
        y = Random().nextInt(5);
      }
      options[x][y] = word[i];
    }
    String addedChar = word;
    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 5; j++) {
        if (options[i][j] == '?') {
          int x = Random().nextInt(26);
          while (addedChar.contains(char[x])) {
            x = Random().nextInt(26);
          }
          addedChar += char[x];
          options[i][j] = char[x];
        }
      }
    }
  }

  pick(String s) {
    if (picks > 4) return;
    if (word.contains(s)) {
      for (int i = 0; i < 5; i++) {
        if (word[i] == s) {
          setState(() {
            wordChar[i] = s;
          });
        }
      }
    } else {
      setState(() {
        picks++;
      });
    }
  }

  remove(int x, int y) {
    if (picks > 4) return;
    setState(() {
      done[x][y] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimationPlayer(
            animation: animations[picks],
          ),
          Word(
            wordChar: wordChar,
          ),
          Options(
            options: options,
            pick: pick,
            remove: remove,
            done: done,
          ),
        ],
      ),
    );
  }
}
