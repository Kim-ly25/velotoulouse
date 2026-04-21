import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/ui/screens/booking/booking_screen.dart';
import 'ui/theme/theme.dart';
import 'ui/screens/pass/subscription_screen.dart';

void mainCommon(List<InheritedProvider> providers) {
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;

  final pages = const [
    BookBikeScreen(),
    SubscriptionScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: pages[_index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          selectedItemColor: AppTheme.primary,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.pedal_bike),
              label: "Booking",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              label: "Pass",
            ),
          ],
        ),
      ),
    );
  }
}