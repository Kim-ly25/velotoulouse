import 'package:flutter/material.dart';

import '../../../../data/repositories/bike/bike_slot_repository.dart';
import '../../../../model/bike/bike_slot.dart';
import '../../../utils/async_value.dart';

class BookBikeViewModel extends ChangeNotifier {
  final BikeSlotRepository bikeSlotRepository;

  AsyncValue<List<BikeSlot>> slotsValue = AsyncValue.loading();

  BookBikeViewModel({required this.bikeSlotRepository}) {
    _init();
  }

  void _init() {
    fetchSlots();
  }

  void fetchSlots() async {
    // 1- Set loading state
    slotsValue = AsyncValue.loading();
    notifyListeners();
    try {
      // 2- Fetch slots successfully
      List<BikeSlot> slots = await bikeSlotRepository.fetchSlots();
      slotsValue = AsyncValue.success(slots);
    } catch (e) {
      // 3- Fetch failed
      slotsValue = AsyncValue.error(e);
    }
    notifyListeners();
  }
}
