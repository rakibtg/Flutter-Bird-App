import 'package:flutter/material.dart';
import 'bird_model.dart';
import 'bird_detail_page.dart';

class BirdCard extends StatefulWidget {
  final Bird bird;
  BirdCard(this.bird);

  @override
  _BirdCardState createState() => _BirdCardState(bird);
}

class _BirdCardState extends State<BirdCard> {
  Bird bird;
  _BirdCardState(this.bird);

  Widget get birdImage {
    return Hero(
      tag: bird,
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          shape: BoxShape.rectangle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(bird.photo ?? ''),
          ),
        ),
      ),
    );
  }

  Widget get birdCard {
    return Container(
      width: 265.0,
      height: 115.0,
      child: Card(
        elevation: 0.0,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            bottom: 10.0,
            left: 10.0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(widget.bird.name, style: Theme.of(context).textTheme.headline,),
              Text(widget.bird.location, style: Theme.of(context).textTheme.subhead,),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                  ),
                  Text(' (${widget.bird.rating} / 10)')
                ],
              ),
            ]
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: goToBirdDetailPage,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Container(
          height: 115.0,
          child: Stack(
            children: <Widget>[
              Positioned(left: 110.0, child: birdCard,),
              Positioned(top: 7.5, child: birdImage,)
            ],
          ),
        ),
      ),
    );
  }

  goToBirdDetailPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return BirdDetailPage(bird);
      })
    );
  }

}