import 'package:velotoulouse/model/subscription/pass_model.dart';


abstract class SubscriptionRepository {
  Pass? getActivePass(String userId);
  Pass savePass(Pass pass);
}