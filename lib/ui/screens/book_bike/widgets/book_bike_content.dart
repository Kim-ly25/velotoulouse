import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/bike/bike_slot.dart';
import '../../../states/booking_state.dart';
import '../../../theme/theme.dart';
import '../../../utils/async_value.dart';
import '../slot_detail_view.dart';
import '../view_model/book_bike_view_model.dart';
import 'bike_slot_tile.dart';


class BookBikeContent extends StatelessWidget {
  const BookBikeContent({super.key});

  @override
  Widget build(BuildContext context) {
    BookBikeViewModel vm = context.watch<BookBikeViewModel>();

    AsyncValue<List<BikeSlot>> asyncValue = vm.slotsValue;

    Widget content;
    switch (asyncValue.state) {
      case AsyncValueState.loading:
        content = const Center(child: CircularProgressIndicator());
        break;

      case AsyncValueState.error:
        content = Center(
          child: Text(
            'Error: ${asyncValue.error}',
            style: const TextStyle(color: AppColors.error),
          ),
        );
        break;

      case AsyncValueState.success:
        List<BikeSlot> slots = asyncValue.data!;
        Set<String> removedSlotIds = context
            .watch<BookingState>()
            .removedSlotIds;
        List<BikeSlot> availableSlots = slots
            .where((slot) => !removedSlotIds.contains(slot.id))
            .toList();

        if (availableSlots.isEmpty) {
          content = const Center(
            child: Text(
              'No bikes available right now.',
              style: AppTextStyles.body,
              textAlign: TextAlign.center,
            ),
          );
        } else {
          content = ListView.builder(
            itemCount: availableSlots.length,
            itemBuilder: (context, index) => BikeSlotTile(
              slot: availableSlots[index],
              onTap: () {
                // Save selection to global booking state, then navigate
                context.read<BookingState>().selectSlot(availableSlots[index]);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: const RouteSettings(
                      name: SlotDetailView.routeName,
                    ),
                    builder: (_) => const SlotDetailView(),
                  ),
                );
              },
            ),
          );
        }
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const Text('Select A Bike', style: AppTextStyles.heading),
          const SizedBox(height: 4),
          const Text(
            'Choose a dock slot to begin booking',
            style: AppTextStyles.body,
          ),
          const SizedBox(height: 24),
          Expanded(child: content),
        ],
      ),
    );
  }
}
