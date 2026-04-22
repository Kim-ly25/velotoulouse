import 'package:provider/provider.dart';

import 'data/repositories/bike/bike_slot_repository.dart';
import 'data/repositories/bike/bike_slot_repository_mock.dart';
import 'data/repositories/booking/booking_repository.dart';
import 'data/repositories/booking/booking_repository_mock.dart';
import 'data/repositories/pass/pass_plan_repository.dart';
import 'data/repositories/pass/pass_plan_repository_mock.dart';
import 'main_common.dart';
import 'ui/states/booking_state.dart';

/// Configure provider dependencies for the dev environment.
List<InheritedProvider> get devProviders {
  return [
    // 1 - Inject repositories
    Provider<BikeSlotRepository>(
      create: (_) => BikeSlotRepositoryMock(),
    ),
    Provider<PassPlanRepository>(
      create: (_) => PassPlanRepositoryMock(),
    ),
    Provider<BookingRepository>(
      create: (_) => BookingRepositoryMock(),
    ),

    // 2 - Inject global booking state (do the entire flow)
    ChangeNotifierProvider<BookingState>(
      create: (_) => BookingState(),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
