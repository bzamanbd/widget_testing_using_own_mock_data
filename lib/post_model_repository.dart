import 'dart:convert';

import 'package:widget_testing_using_mocktail/post_model.dart';
import 'package:http/http.dart' as http;

class PostModelRepository {
  final _url = 'https://jsonplaceholder.typicode.com/posts';
  Future<List<PostModel>> get fetchPosts => _fetchPosts();
  Future<List<PostModel>> _fetchPosts() async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      final List<dynamic> posts = jsonDecode(response.body);
      return posts.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch the posts');
    }
  }
}
