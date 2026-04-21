import 'package:velotoulouse/data/repositories/subscription/subscription_repository.dart';
import 'package:velotoulouse/model/subscription/pass_model.dart';

class SubscriptionRepositoryMock implements SubscriptionRepository {
  Pass? _activePass;

  @override
  Pass? getActivePass(String userId) =>
      (_activePass != null && _activePass!.userId == userId && _activePass!.isValid)
          ? _activePass
          : null;

  @override
  Pass savePass(Pass pass) {
    _activePass = pass;
    return pass;
  }
}
