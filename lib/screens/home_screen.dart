import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final int points;

  const HomeScreen({
    super.key,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '현재 포인트',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 8),
          Text(
            '$points P',
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 16),
          const Text('대중교통 / 친환경 매장 / 캠페인 참여로 포인트를 적립해보세요.'),
        ],
      ),
    );
  }
}
