
import 'package:flutter/material.dart';
import 'package:islami/main.dart';
void main(){
  runApp(MyApp());
}
class splash_screen extends StatelessWidget {
  const splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
 return MaterialApp(
     debugShowCheckedModeBanner: false,
     home:  splash_screen()
    );
  }
}
