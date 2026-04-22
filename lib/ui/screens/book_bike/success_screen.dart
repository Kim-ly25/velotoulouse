import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/ui/screens/book_bike/slot_detail_screen.dart';
import 'package:velotoulouse/ui/states/booking_state.dart';
import 'package:velotoulouse/ui/theme/theme.dart';
import 'package:velotoulouse/ui/widgets/bike/primary_button.dart';

import 'book_bike_screen.dart';

enum SuccessMode { passActivated, bikeUnlocked }

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.mode});

  final SuccessMode mode;

  @override
  Widget build(BuildContext context) {
    final bookingState = context.watch<BookingState>();
    final booking = bookingState.confirmedBooking;
    final isPassMode = mode == SuccessMode.passActivated;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: isPassMode
                      ? AppColors.primaryLight
                      : const Color(0xFFE8F5E9),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isPassMode ? Icons.check_circle : Icons.lock_open,
                  size: 50,
                  color: isPassMode ? AppColors.primary : AppColors.success,
                ),
              ),
              const SizedBox(height: 28),

              Text(
                isPassMode ? 'Your Pass is now active' : 'The Bike is Unlocked!',
                textAlign: TextAlign.center,
                style: AppTextStyles.heading,
              ),
              const SizedBox(height: 12),

              Text(
                isPassMode
                    ? 'Your pass is now active. Go back to confirm your booking.'
                    : 'Enjoy your ride! Return the bike to any station in the network.',
                textAlign: TextAlign.center,
                style: AppTextStyles.body,
              ),
              const SizedBox(height: 24),

              if (!isPassMode && booking != null)
                _InfoBadge(
                  label: booking.plan.label,
                  sublabel: 'Valid for one ride – unlocks slot ${booking.slot.id}',
                ),

              const Spacer(),
              PrimaryButton(
                label: isPassMode ? 'Back To Booking' : 'Done',
                onTap: () {
                  if (isPassMode) {
                    if (bookingState.selectedSlot != null) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SlotDetailScreen()),
                          (route) => route.isFirst,
                        );
                      } else {
                        bookingState.reset();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BookBikeScreen()),
                          (route) => false,
                        );
                      }
                    } else {
                      bookingState.clearCurrentRideKeepPass();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BookBikeScreen()),
                        (route) => route.isFirst,
                      );
                    }
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoBadge extends StatelessWidget {
  const _InfoBadge({required this.label, required this.sublabel});

  final String label;
  final String sublabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: [
          Text(label, style: AppTextStyles.subheading),
          const SizedBox(height: 4),
          Text(
            sublabel,
            style: AppTextStyles.label,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}