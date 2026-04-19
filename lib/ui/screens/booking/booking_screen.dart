import 'package:flutter/material.dart';
import 'package:velotoulouse/ui/theme/theme.dart';

class BikeDetailScreen extends StatelessWidget {
  final String bike;

  const BikeDetailScreen({super.key, required this.bike});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Bike")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Icon(Icons.pedal_bike, size: 80),
            const SizedBox(height: 20),

            // bike title
            Text(
              bike,
              style: AppTextStyles.title,
            ),
            const SizedBox(height: 20),

            // description box
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "• Bike unlocks immediately on confirmation\n"
                "• Requires active pass or one-time ticket",
              ),
            ),

            const Spacer(),

            // confirm button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                },
                child: const Text("Confirm Booking"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
