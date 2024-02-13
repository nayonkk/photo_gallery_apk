import 'package:photo_gallery_apk/model/post.dart';
import 'package:http/http.dart' as http;

class Remote_service {
  Future<List<Post>?> getPosts() async {
    var url = 'https://jsonplaceholder.typicode.com/photos';
    var client = http.Client();
    var uri = Uri.parse(url);
    var responce = await client.get(uri);
    var body = responce.body;
    if (responce.statusCode == 200) {
      var json = responce.body;
      return postFromJson(json);
    }
  }
}
