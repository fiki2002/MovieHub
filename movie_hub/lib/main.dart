import 'package:flutter/material.dart';
import 'package:movie_hub/views/movie_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Hub',
      home: MoviePage(),
    );
  }
}
