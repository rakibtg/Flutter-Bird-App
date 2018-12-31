class Bird {
  final String name;
  final String location;
  final String description;
  final String photo;

  // Rating should start from 1.
  int rating = 1;

  Bird(this.name, this.location, this.description, this.photo);
/*
  Future getPhotoUrl() async {
    if(photo != null) {
      return;
    }

      // Making an HTTP call.
      HttpClient http = HttpClient();
      try {
        var uri = Uri.http('source.unsplash.com', '/800x600/?bird');
        var request = await http.getUrl(uri);
        var response = await request.close();
        var resBody = await response.transform(utf8.decoder).join();
        photo = json.decode(resBody); // If it returns an json response.
      } catch (exception) {
        print(exception);
      }
  }
*/
}