import 'package:flutter/material.dart';
import 'bird_model.dart';

class AddBirdFormPage extends StatefulWidget {
  @override
  _AddBirdFormPageState createState() => _AddBirdFormPageState();
}

class _AddBirdFormPageState extends State<AddBirdFormPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController familyController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController photoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new bird'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 32.0,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Name'
                  ),
                  onChanged: (v) => nameController.text = v,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Bird Family",
                      hintText: "Spheniscidae, Bonaparte ..."
                  ),
                  onChanged: (v) => familyController.text = v,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Description"
                  ),
                  maxLines: 4,
                  onChanged: (v) => descriptionController.text = v,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Photo",
                      hintText: "https://example.com/photo.bird.jpg"
                  ),
                  onChanged: (v) => photoController.text = v,
                ),
              ),

              // Submit Button
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Builder(
                  builder: (context) {
                    return RaisedButton(
                      onPressed: () => handleSubmit(context),
                      color: Colors.lightBlue,
                      child: Text(
                        "Add Bird",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0
                        ),
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
        ),
      ),
    );
  }

  void handleSubmit(BuildContext context) {
    if(nameController.text.isEmpty) {
      print("Bird name cant be empty");
    } else {
      Bird newBird = Bird(nameController.text, familyController.text, descriptionController.text, photoController.text);
      Navigator.of(context).pop(newBird);
    }
  }

}