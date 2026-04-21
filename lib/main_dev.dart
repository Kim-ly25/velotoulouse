import 'package:provider/provider.dart';
import 'package:velotoulouse/data/repositories/station/station_repository.dart';
import 'package:velotoulouse/data/repositories/station/station_repository_mock.dart';
import 'data/repositories/booking/booking_repository.dart';
import 'data/repositories/booking/booking_repository_mock.dart';
import 'data/repositories/subscription/subscription_repository.dart';
import 'data/repositories/subscription/subscription_repository_mock.dart';
import 'main_common.dart';
import 'ui/states/app_state.dart';
import 'ui/states/subscription_state.dart';

List<InheritedProvider> get devProviders {
  return [
    // global state
    ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
    ),

    // repositories
    Provider<StationRepository>(create: (_) => StationRepositoryMock()),
    Provider<SubscriptionRepository>(create: (_) => SubscriptionRepositoryMock()),
    Provider<BookingRepository>(create: (_) => BookingRepositoryMock()),

    // state
    ChangeNotifierProvider<SubscriptionState>(
      create: (context) => SubscriptionState(
        subscriptionRepository: context.read<SubscriptionRepository>(),
      ),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}