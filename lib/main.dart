import 'package:flutter/material.dart';

import 'ui/screens/chessboard/chessboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      home: const ChessboardScreen(),
    );
  }
}
