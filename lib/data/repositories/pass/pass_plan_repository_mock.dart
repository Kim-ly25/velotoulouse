import '../../../model/pass/pass_plan.dart';
import 'pass_plan_repository.dart';

class PassPlanRepositoryMock implements PassPlanRepository {
  final List<PassPlan> _plans = const [
    PassPlan(
      type: PassType.daily,
      price: 3.00,
      label: 'Daily Pass',
      description: 'Perfect for visitors. Valid 24 hours.',
    ),
    PassPlan(
      type: PassType.monthly,
      price: 14.50,
      label: 'Monthly Pass',
      description: 'Unlimited rides. Valid 30 days.',
    ),
    PassPlan(
      type: PassType.annual,
      price: 99.00,
      label: 'Annual Pass',
      description: 'Best value. Valid 1 year.',
    ),
  ];

  @override
  Future<List<PassPlan>> fetchPlans() async {
    return Future.delayed(const Duration(milliseconds: 600), () => _plans);
  }
}
