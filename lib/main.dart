import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/earn_screen.dart';
import 'screens/campaigns_screen.dart';
import 'screens/ads_screen.dart';
import 'screens/login_screen.dart';
import 'screens/user_screen.dart';

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
  int _points = 0;

  // ✅ 로그인 상태 관련 변수
  bool _isLoggedIn = false;
  String _userName = '';

  void _addPoints(int value) {
    setState(() {
      _points += value;
    });
  }

  void _login(String name) {
    setState(() {
      _isLoggedIn = true;
      _userName = name;
    });
  }

  void _logout() {
    setState(() {
      _isLoggedIn = false;
      _userName = '';
      _currentIndex = 0;
      _points = 0; // 필요하면 유지해도 됨
    });
  }

  @override
  Widget build(BuildContext context) {
    // ✅ 로그인 안 되어 있으면 로그인 화면 먼저 보여줌
    if (!_isLoggedIn) {
      return MaterialApp(
        title: 'GreenCash',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        home: LoginScreen(onLogin: _login),
      );
    }

    // ✅ 로그인 된 이후에는 기존 탭 구조 + 사용자 페이지
    final screens = [
      HomeScreen(points: _points),
      EarnScreen(
        points: _points,
        onEarnPoints: _addPoints,
      ),
      const CampaignsScreen(),
      const AdsScreen(),
      UserScreen(
        userName: _userName,
        points: _points,
        onLogout: _logout,
      ),
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
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '내 정보',
            ),
          ],
        ),
      ),
    );
  }
}
