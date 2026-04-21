import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velotoulouse/model/subscription/pass_model.dart';
import 'package:velotoulouse/ui/theme/theme.dart';

class ActivePassWidget extends StatelessWidget {
  final Pass pass;

  const ActivePassWidget({super.key, required this.pass});

  @override
  Widget build(BuildContext context) {
    final fmt = DateFormat('MMM dd yyyy');
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.card_membership, color: Colors.white, size: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pass.label,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
                Text('Expires: ${fmt.format(pass.expiresAt)}',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.85), fontSize: 12)),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('Active',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
