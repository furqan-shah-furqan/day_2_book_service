import 'package:day_2_book_service/Provider/book_mark_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Home/home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BookMarkProvider(),
      child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SERVICE BOOKING',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
