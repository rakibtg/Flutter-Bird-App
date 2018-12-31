import 'package:flutter/material.dart';
import 'bird_model.dart';

class BirdDetailPage extends StatefulWidget {
  final Bird bird;
  BirdDetailPage(this.bird);
  @override
  _BirdDetailPageState createState() => _BirdDetailPageState();
}

class _BirdDetailPageState extends State<BirdDetailPage> {
  final double birdAvatarSize = 200.0;

  Widget get birdImage {
    return Hero(
      tag: widget.bird,
      child: Container(
        height: birdAvatarSize,
        width: birdAvatarSize,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(widget.bird.photo),
            )
        ),
      ),
    );
  }

  Widget get rating {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.star,
          size: 40.0,
        ),
        Text(
          ' ${widget.bird.rating} / 10',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 20.0
          ),
        ),
      ],
    );
  }

  Widget get birdProfile {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: birdImage,
          ),
          Text(
            widget.bird.name,
            style: TextStyle(fontSize: 32.0),
          ),
          Text(
            widget.bird.location,
            style: TextStyle(fontSize: 20.0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Text(
              widget.bird.description,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          rating,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(widget.bird.name),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: birdProfile,
        ),
      ),
    );
  }

}