import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(TrainApp());
}

// 앱 클래스 선언
class TrainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '기차앱',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HomePage(),
    );
  }
}
