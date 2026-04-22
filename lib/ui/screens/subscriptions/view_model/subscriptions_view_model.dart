import 'package:flutter/material.dart';

import '../../../../data/repositories/pass/pass_plan_repository.dart';
import '../../../../model/pass/pass_plan.dart';
import '../../../utils/async_value.dart';

class SubscriptionsViewModel extends ChangeNotifier {
  final PassPlanRepository passPlanRepository;

  AsyncValue<List<PassPlan>> plansValue = AsyncValue.loading();

  SubscriptionsViewModel({required this.passPlanRepository}) {
    _init();
  }

  void _init() {
    fetchPlans();
  }

  void fetchPlans() async {
    // 1- Set loading state
    plansValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2- Fetch succeeded
      List<PassPlan> plans = await passPlanRepository.fetchPlans();
      plansValue = AsyncValue.success(plans);
    } catch (e) {
      // 3- Fetch failed
      plansValue = AsyncValue.error(e);
    }
    notifyListeners();
  }
}
