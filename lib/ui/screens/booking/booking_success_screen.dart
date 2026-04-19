import 'package:flutter/material.dart';

class BikeListScreen extends StatelessWidget {
  const BikeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BookingViewModel>();
    final state = viewModel.bikesState;

    return Scaffold(
      appBar: AppBar(title: const Text("Select The Bike")),

      body: Builder(
        builder: (_) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.isError) {
            return const Center(child: Text("Something went wrong"));
          }

          final bikes = state.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: bikes.length,
            itemBuilder: (_, index) {
              final bike = bikes[index];

              return ListTile(
                title: Text(bike.name),
                subtitle: Text(bike.location),
              );
            },
          );
        },
      ),
    );
  }
}