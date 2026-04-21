import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/ui/screens/booking/booking_success_screen.dart';
import 'package:velotoulouse/ui/screens/booking/view_model/booking_view_model.dart';
import 'package:velotoulouse/ui/screens/pass/subscription_screen.dart';
import 'package:velotoulouse/ui/theme/theme.dart';

class BookingDetailScreen extends StatelessWidget {
  const BookingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BookingViewModel>();
    final session = viewModel.session;

    if (session == null) {
      return const Scaffold(
        body: Center(child: Text('No active booking session')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Slot Detail')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Icon(
                    Icons.directions_bike,
                    size: 80,
                    color: AppTheme.primary,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    session.slotId,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    session.stationName,
                    style: const TextStyle(color: AppTheme.textSecondary),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Slot details',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text('• Bike unlocks immediately'),
                  Text('• Requires pass or ticket'),
                ],
              ),
            ),
            const Spacer(),
            if (viewModel.hasPass)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _onConfirm(context),
                  child: const Text('Confirm Booking'),
                ),
              )
            else ...[
              _buildOptionButton(
                context,
                text: 'Buy Single Ticket',
                onTap: () => _onBuy(context),
              ),
              const SizedBox(height: 10),
              _buildOptionButton(
                context,
                text: 'Choose Subscription',
                onTap: () => _onPass(context),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(
    BuildContext context, {
    required String text,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          side: BorderSide(color: Colors.grey.shade400),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  void _onConfirm(BuildContext context) {
    final viewModel = context.read<BookingViewModel>();
    final booking = viewModel.confirmWithPass();

    if (booking == null) {
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => BookingSuccessScreen(booking: booking)),
    );
  }

  void _onBuy(BuildContext context) {
    final viewModel = context.read<BookingViewModel>();
    final booking = viewModel.buyTicket();

    if (booking == null) {
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => BookingSuccessScreen(booking: booking)),
    );
  }

  void _onPass(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SubscriptionScreen(fromBooking: true),
      ),
    );
  }
}
