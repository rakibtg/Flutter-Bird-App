import 'package:flutter/material.dart';

import 'bird_card.dart';
import 'bird_model.dart';

class BirdList extends StatelessWidget {

  final List<Bird> birds;
  BirdList(this.birds);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: birds.length,
      itemBuilder: (context, int) {
        return BirdCard(birds[int]);
      },
    );
  }
}