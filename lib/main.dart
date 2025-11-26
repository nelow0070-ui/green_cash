import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/earn_screen.dart';
import 'screens/campaigns_screen.dart';
import 'screens/ads_screen.dart';

void main() {
  runApp(const GreenCashApp());
}

class GreenCashApp extends StatefulWidget {
  const GreenCashApp({super.key});

  @override
  State<GreenCashApp> createState() => _GreenCashAppState();
}

class _GreenCashAppState extends State<GreenCashApp> {
  int _currentIndex = 0;
  int _points = 0; // 전체 포인트

  void _addPoints(int value) {
    setState(() {
      _points += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(points: _points),
      EarnScreen(
        points: _points,
        onEarnPoints: _addPoints,
      ),
      const CampaignsScreen(),
      const AdsScreen(),
    ];

    return MaterialApp(
      title: 'GreenCash',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GreenCash'),
        ),
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_bus),
              label: '포인트',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              label: '캠페인',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.eco),
              label: '광고',
            ),
          ],
        ),
      ),
    );
  }
}
