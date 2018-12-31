import 'package:flutter/material.dart';

import 'bird_model.dart';
import 'bird_list.dart';
import 'new_bird_form.dart';

void main() => runApp(Center(
  child: MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Favorite Birds';
    return Center(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          brightness: Brightness.light
        ),
        home: MyHomePage(title: title),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  List<Bird> initialBirds = []
    ..add(Bird('Parrot', 'Animalia', 'Parrots, also known as psittacines, are birds of the roughly 393 species in 92 genera that make up the order Psittaciformes, found in most tropical and subtropical regions. The order is subdivided into three superfamilies: the Psittacoidea, the Cacatuoidea, and the Strigopoidea.', 'https://cdn.omlet.co.uk/images/originals/fischer\'s-lovebird.jpg'))
    ..add(Bird('Hummingbird', 'Trochilidae', 'Hummingbirds are birds native to the Americas and constitute the biological family Trochilidae. They are among the smallest of birds, most species measuring 7.5–13 cm in length. Indeed, the smallest extant bird species is a hummingbird, the 5 cm bee hummingbird weighing less than 2.0 g.', 'https://cdn.audubon.org/cdn/farfuture/IqG6xv-Xc6wQV9XCeIen_tnFqG60_zrGjSjHYXJBze0/mtime:1525374728/sites/default/files/apa_2015_kevinrees_279316_annas_hummingbird_kk_1.jpg'))
    ..add(Bird('Owl', 'Aves', 'Owls are birds from the order Strigiformes, which includes about 200 species of mostly solitary and nocturnal birds of prey typified by an upright stance, a large, broad head, binocular vision, binaural hearing, sharp talons, and feathers adapted for silent flight.', 'https://d1ia71hq4oe7pn.cloudfront.net/photo/63737991-720px.jpg'))
    ..add(Bird('Swallow', 'Hirundinidae', 'The swallows, martins and saw-wings, or Hirundinidae, are a family of passerine birds found around the world on all continents, including occasionally in Antarctica. Highly adapted to aerial feeding, they have a distinctive appearance. The term Swallow is used colloquially in Europe as a synonym for the barn swallow.', 'http://s3.amazonaws.com/production.mediajoint.prx.org/public/piece_images/544716/Barn-Swallow-Bawk-Bawk-Cc-285_medium.jpg'))
    ..add(Bird('Sparrow', 'Passeridae', 'Sparrows are a family of small passerine birds. They are also known as true sparrows, or Old World sparrows, names also used for a particular genus of the family, Passer. ', 'https://d1ia71hq4oe7pn.cloudfront.net/photo/64971291-480px.jpg'));
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _goToNewBirdForm,
          )
        ],
      ),
      body: Container(
        child: BirdList(initialBirds),
      ),
    );
  }

  Future _goToNewBirdForm() async {
    Bird newBird = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return AddBirdFormPage();
        }
      ),
    );

    // Once the user submitted this form, we would have all the info here.
    if(newBird != null) {
      initialBirds.add(newBird);
    }

  }

}