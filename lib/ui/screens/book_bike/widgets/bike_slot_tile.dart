import 'package:flutter/material.dart';

import '../../../../model/bike/bike_slot.dart';
import '../../../theme/theme.dart';


class BikeSlotTile extends StatelessWidget {
  const BikeSlotTile({
    super.key,
    required this.slot,
    required this.onTap,
  });

  final BikeSlot slot;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.divider),
          ),
          child: Row(
            children: [
              // Bike icon
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.pedal_bike,
                  color: AppColors.primary,
                  size: 22,
                ),
              ),
              const SizedBox(width: 14),

              // Slot info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Slot ${slot.id}', style: AppTextStyles.subheading),
                    const SizedBox(height: 2),
                    Text(
                      'Complete Station - ${slot.stationName}',
                      style: AppTextStyles.label,
                    ),
                  ],
                ),
              ),

              // Arrow
              const Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: AppColors.textLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
