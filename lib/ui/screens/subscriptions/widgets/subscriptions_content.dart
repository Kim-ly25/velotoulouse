import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/pass/pass_plan.dart';
import '../../../states/booking_state.dart';
import '../../../theme/theme.dart';
import '../../../utils/async_value.dart';
import '../../book_bike/success_screen.dart';
import '../view_model/subscriptions_view_model.dart';
import 'plan_tile.dart';

class SubscriptionsContent extends StatefulWidget {
  const SubscriptionsContent({super.key});

  @override
  State<SubscriptionsContent> createState() => _SubscriptionsContentState();
}

class _SubscriptionsContentState extends State<SubscriptionsContent> {
  int _expandedIndex = 0; // Daily pass expanded by default

  @override
  Widget build(BuildContext context) {
    // 1- Watch the view model
    SubscriptionsViewModel vm = context.watch<SubscriptionsViewModel>();

    AsyncValue<List<PassPlan>> asyncValue = vm.plansValue;
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
        List<PassPlan> plans = asyncValue.data!;
        content = ListView.builder(
          itemCount: plans.length,
          itemBuilder: (context, index) => PlanTile(
            plan: plans[index],
            isExpanded: _expandedIndex == index,
            onTap: () {
              setState(() => _expandedIndex = index);
            },
            onSubscribe: () {
              // Activate selected plan and go to pass success screen.
              context.read<BookingState>().activatePass(plans[index]);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                    const SuccessScreen(mode: SuccessMode.passActivated),
                ),
              );
            },
          ),
        );
      }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const Text('Choose Your Plan', style: AppTextStyles.heading),
          const SizedBox(height: 4),
          const Text(
            'Active pass needed to unlock this slot.',
            style: AppTextStyles.body,
          ),
          const SizedBox(height: 24),
          Expanded(child: content),
        ],
      ),
    );
  }
}
