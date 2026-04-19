import 'package:flutter/material.dart';
import 'booking_screen.dart';


class BikeItem extends StatelessWidget {
  final String title;
  final String location;

  const BikeItem({
    super.key,
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.pedal_bike),
        title: Text(title),
        subtitle: Text(location),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BikeDetailScreen(bike: title),
            ),
          );
        },
      ),
    );
  }
}