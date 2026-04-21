import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/ui/screens/booking/booking_detail_screen.dart';
import 'package:velotoulouse/ui/screens/booking/view_model/booking_view_model.dart';
import 'package:velotoulouse/ui/screens/booking/widgets/booking_content.dart';
import 'package:velotoulouse/ui/states/app_state.dart';

class BookBikeScreen extends StatelessWidget {
  const BookBikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookingViewModel(appState: context.read<AppState>()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Book Bike')),
        body: Builder(
          builder: (innerContext) => BookingContent(
            onSelect: () {
              final bookingViewModel = innerContext.read<BookingViewModel>();
              Navigator.push(
                innerContext,
                MaterialPageRoute(
                  builder: (_) => ChangeNotifierProvider.value(
                    value: bookingViewModel,
                    child: const BookingDetailScreen(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
