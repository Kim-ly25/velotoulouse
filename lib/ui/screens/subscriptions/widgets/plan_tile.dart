import 'package:flutter/material.dart';
import '../../../../model/pass/pass_plan.dart';
import '../../../theme/theme.dart';

class PlanTile extends StatelessWidget {
  const PlanTile({
    super.key,
    required this.plan,
    required this.isExpanded,
    required this.onTap,
    required this.onSubscribe,
  });

  final PassPlan plan;
  final bool isExpanded;
  final VoidCallback onTap;
  final VoidCallback onSubscribe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isExpanded ? AppColors.primary : AppColors.divider,
              width: isExpanded ? 2 : 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(plan.label, style: AppTextStyles.subheading),
                      const SizedBox(height: 2),
                      Text(
                        plan.displayPrice,
                        style: AppTextStyles.priceLarge,
                      ),
                    ],
                  ),
                  Icon(
                    isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                    color: AppColors.textLight,
                  ),
                ],
              ),

              // Expanded details
              if (isExpanded) ...[
                const SizedBox(height: 12),
                _CheckRow(text: plan.description),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: onSubscribe,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: Text('Subscribe', style: AppTextStyles.buttonText),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _CheckRow extends StatelessWidget {
  const _CheckRow({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check_circle, color: AppColors.success, size: 16),
        const SizedBox(width: 6),
        Expanded(child: Text(text, style: AppTextStyles.body)),
      ],
    );
  }
}
