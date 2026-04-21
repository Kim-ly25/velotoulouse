import 'package:flutter/material.dart';
import 'package:velotoulouse/model/booking/booking_model.dart';
import 'package:velotoulouse/ui/theme/theme.dart';

class BookingSuccessScreen extends StatelessWidget {
  final Booking booking;
  const BookingSuccessScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surface,
      appBar: AppBar(
        title: const Text('Success'),
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppTheme.successLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.lock_open,
                color: AppTheme.success,
                size: 40,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'The Bike is Unlocked!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Your pass is valid for 24h. You can now unlock any bike in the network.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: AppTheme.textSecondary),
            ),
            const SizedBox(height: 16),
            _infoRow('• ${booking.slotId} ${booking.stationName}'),
            _infoRow('• Enjoy your trip!'),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.popUntil(context, (r) => r.isFirst),
                child: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary),
      ),
    ),
  );
}
