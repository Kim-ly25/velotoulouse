import 'package:flutter/material.dart';
import 'package:velotoulouse/ui/theme/theme.dart';

class InactivePassWidget extends StatelessWidget {
  final VoidCallback onGetPass;

  const InactivePassWidget({super.key, required this.onGetPass});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.background,
        border: Border.all(color: AppTheme.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.card_membership_outlined,
              color: AppTheme.textSecondary, size: 32),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('No Active Pass',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary)),
                Text('Get a pass to unlock bikes',
                    style: TextStyle(
                        fontSize: 12, color: AppTheme.textSecondary)),
              ],
            ),
          ),
          TextButton(
            onPressed: onGetPass,
            child: const Text('Get Pass',
                style: TextStyle(color: AppTheme.primary)),
          ),
        ],
      ),
    );
  }
}
