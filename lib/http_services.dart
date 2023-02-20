import 'dart:convert';
import 'package:http/http.dart';
import 'post_model.dart';

class HttpService {
 // final String postsURL = "https://jsonplaceholder.typicode.com/posts";
  Future<List<Post>> getPosts() async {
    Response res = await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
      )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";

    }
  }Future<void> deletePost(int id) async {
    Response res = await delete (Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"));

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Unable to delete post.";
    }
  }

}

