import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/model/pass/pass_plan.dart';
import 'package:velotoulouse/ui/states/booking_state.dart';
import 'package:velotoulouse/ui/theme/theme.dart';

class PassSelected extends StatelessWidget {
  const PassSelected({super.key});
  @override
  Widget build(BuildContext context) {
    final bookingState = context.watch<BookingState>();
    final plan = bookingState.selectedPlan!;
 
    final dateFormatter = DateFormat('MMM dd, yyyy');
    final expiryDate = plan.type == PassType.daily
      ? DateTime.now().add(const Duration(hours: 24))
      : plan.type == PassType.monthly
      ? DateTime.now().add(const Duration(days: 30))
      : DateTime.now().add(const Duration(days: 365));
 
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                const SizedBox(height: 4),
                Text(
                  plan.displayPrice,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Enjoy With Your Trip!',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
 
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.divider),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, color: AppColors.primary, size: 18),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Expires: ${dateFormatter.format(expiryDate)}',
                      style: AppTextStyles.subheading,
                    ),
                    Text('Started: ${dateFormatter.format(DateTime.now())}',
                      style: AppTextStyles.label,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 
class _BreakdownRow extends StatelessWidget {
  const _BreakdownRow({
    required this.label,
    required this.value,
    this.isBold = false,
  });
 
  final String label;
  final String value;
  final bool isBold;
 
  @override
  Widget build(BuildContext context) {
    final style = isBold ? AppTextStyles.subheading : AppTextStyles.body;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(value, style: style),
      ],
    );
  }
}