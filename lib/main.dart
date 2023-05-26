import 'package:flutter/material.dart';
import 'package:widget_testing_using_ownmock_data/post_model_repository.dart';
import 'home_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'post app',
    theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromARGB(255, 0, 188, 31),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 14),
          titleMedium: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black54),
        )),
    home: HomeScreen(postListFromApi: PostModelRepository().fetchPosts),
  ));
}
