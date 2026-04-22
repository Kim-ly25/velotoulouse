import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/bike/bike_slot_repository.dart';
import '../../widgets/bike/bike_app_bar.dart';
import '../subscriptions/subscriptions_screen.dart';
import 'view_model/book_bike_view_model.dart';
import 'widgets/book_bike_content.dart';

class BookBikeScreen extends StatelessWidget {
  const BookBikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookBikeViewModel(
        bikeSlotRepository: context.read<BikeSlotRepository>(),
      ),
      child: Scaffold(
        appBar: const BikeAppBar(title: 'Book Bike'),
        body: const SafeArea(child: BookBikeContent()),
        )
      );
  }
}
