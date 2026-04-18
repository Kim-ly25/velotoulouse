import 'package:flutter/material.dart';
import 'ui/screens/booking/bike_list_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VeloToulouse',
      home: const BikeListScreen(),
    );
  }
}
