import '../../../model/pass/pass_plan.dart';


abstract class PassPlanRepository {
  Future<List<PassPlan>> fetchPlans();
}
