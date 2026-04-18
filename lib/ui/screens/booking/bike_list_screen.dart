import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'bike_item.dart';

class BikeListScreen extends StatelessWidget {
  const BikeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select a Bike')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          BikeItem(title: 'Slot #1022',  location: 'Station A'),
          BikeItem(title: 'Slot #1023',  location: 'Station B'),
          BikeItem(title: 'Slot #1024',  location: 'Station C'),
        ],
      ),
    );
  }
}
