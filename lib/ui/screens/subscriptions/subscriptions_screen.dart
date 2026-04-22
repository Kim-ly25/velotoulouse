import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/pass/pass_plan_repository.dart';
import '../../widgets/bike/bike_app_bar.dart';
import 'view_model/subscriptions_view_model.dart';
import 'widgets/subscriptions_content.dart';

class SubscriptionsScreen extends StatelessWidget {
  const SubscriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SubscriptionsViewModel(
        passPlanRepository: context.read<PassPlanRepository>(),
      ),
      child: const Scaffold(
        appBar: BikeAppBar(title: 'Subscriptions'),
        body: SafeArea(child: SubscriptionsContent()),
      ),
    );
  }
}
