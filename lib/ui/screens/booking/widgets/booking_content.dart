import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/booking_view_model.dart';
import 'slot_tile.dart';

class BookingContent extends StatelessWidget {
  final VoidCallback onSelect;

  const BookingContent({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BookingViewModel>();

    return ListView.builder(
      itemCount: vm.availableSlots.length,
      itemBuilder: (_, i) {
        final slot = vm.availableSlots[i];

        return SlotTile(
          slot: slot,
          onTap: () {
            vm.selectSlot(slot);
            onSelect();
          },
        );
      },
    );
  }
}
