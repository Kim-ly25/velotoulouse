import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/ui/screens/subscriptions/subscriptions_screen.dart';

import 'ui/screens/book_bike/book_bike_screen.dart';
import 'ui/theme/theme.dart';

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
  int _currentIndex = 0;

  final List<Widget> _pages = [BookBikeScreen(),SubscriptionsScreen()];

  @override
  Widget build(BuildContext context) {
 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(
        body: _pages[_currentIndex],
    
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: AppColors.primary,
          items: [
             BottomNavigationBarItem(
              icon: Icon(Icons.pedal_bike),
              label: 'Booking',
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              label: 'Pass',
            ),
          ],
        ),
      ),
    );
  }
}


