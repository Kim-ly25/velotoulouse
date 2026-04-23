import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/data/repositories/booking/booking_repository.dart';
import 'package:velotoulouse/model/booking/booking.dart';
import 'package:velotoulouse/ui/screens/book_bike/success_view.dart';
import '../../states/booking_state.dart';
import '../../theme/theme.dart';
import '../../widgets/bike/bike_app_bar.dart';
import '../../widgets/bike/primary_button.dart';
import '../subscriptions/subscriptions_screen.dart';

class SlotDetailView extends StatefulWidget {
  const SlotDetailView({super.key});
 
  /// Named route so SuccessScreen (passActivated) can popUntil here.
  static const String routeName = '/slot-detail';
 
  @override
  State<SlotDetailView> createState() => _SlotDetailScreenState();
}
 
class _SlotDetailScreenState extends State<SlotDetailView> {
  bool _isConfirming = false;
 
  Future<void> _confirmBooking(BuildContext context) async {
    final bookingState = context.read<BookingState>();
    final bookingRepository = context.read<BookingRepository>();
    final slot = bookingState.selectedSlot!;
    final plan = bookingState.selectedPlan!;
 
    setState(() => _isConfirming = true);
    try {
      final Booking booking = await bookingRepository.confirmBooking(
        slot: slot,
        plan: plan,
      );
      bookingState.setConfirmedBooking(booking);
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SuccessView(mode: SuccessMode.bikeUnlocked)),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Booking failed. Please try again.')),
        );
      }
    }
    if (mounted) setState(() => _isConfirming = false);
  }
 
  @override
  Widget build(BuildContext context) {
    final bookingState = context.watch<BookingState>();
    final slot = bookingState.selectedSlot!;
    final hasPass = bookingState.hasActivePass;
 
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const BikeAppBar(title: 'Slot Detail'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.pedal_bike,
                    size: 52,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 20),
 
              //slot ID ans dock
              Center(
                child: Column(
                  children: [
                    // slotId is the primary identifier shown to the user
                    Text('Slot ${slot.id}', style: AppTextStyles.heading),
                    const SizedBox(height: 4),
                    Text('Completed - Station ${slot.stationName}', style: AppTextStyles.body),
                  ],
                ),
              ),
              const SizedBox(height: 32),
 
              // Slot details card 
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Slot details', style: AppTextStyles.subheading),
                    const SizedBox(height: 12),
                    _DetailRow(
                      icon: Icons.bolt,
                      text: 'Bike unlocks immediately on confirmation',
                    ),
                    const SizedBox(height: 8),
                    _DetailRow(
                      icon: Icons.credit_card,
                      text: hasPass
                        ? 'Active pass detected – ready to unlock'
                        : 'Requires active pass or one-time ticket',

                      iconColor: hasPass ? AppColors.success : AppColors.textMedium,
                    ),
                  ],
                ),
              ),
 
              // Active pass badge (shown once the user has a pass) 
              if (hasPass && bookingState.selectedPlan != null) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.success),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle, color: AppColors.success, size: 18),
                      const SizedBox(width: 10),
                      Text(
                        '${bookingState.selectedPlan!.label} is active',
                        style: AppTextStyles.body.copyWith(color: AppColors.success),
                      ),
                    ],
                  ),
                ),
              ],
              const Spacer(),
              PrimaryButton(
                label: 'Confirm Booking',
                isLoading: _isConfirming,
                onTap: () {
                  if (hasPass) {
                    _confirmBooking(context);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SubscriptionsScreen(),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
 
class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.text,
    this.iconColor = AppColors.textMedium,
  });
 
  final IconData icon;
  final String text;
  final Color iconColor;
 
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: iconColor),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: AppTextStyles.body)),
      ],
    );
  }
}