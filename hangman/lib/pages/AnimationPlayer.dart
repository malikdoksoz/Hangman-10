import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class AnimationPlayer extends StatefulWidget {
  final String animation;

  AnimationPlayer({
    this.animation,
  });

  @override
  _AnimationPlayerState createState() => _AnimationPlayerState();
}

class _AnimationPlayerState extends State<AnimationPlayer> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Container(
      height: data.size.height * 0.6,
      width: data.size.width * 0.9,
      child: Center(
        child: FlareActor(
          'assets/Hangman.flr',
          animation: widget.animation,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
