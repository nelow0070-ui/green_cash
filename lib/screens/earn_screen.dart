import 'package:flutter/material.dart';

class EarnScreen extends StatelessWidget {
  final int points;
  final void Function(int) onEarnPoints;

  const EarnScreen({
    super.key,
    required this.points,
    required this.onEarnPoints,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          '현재 포인트: $points P',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),

        /// 1. 대중교통 이용
        Card(
          child: ListTile(
            leading: const Icon(Icons.directions_bus),
            title: const Text('대중교통 이용'),
            subtitle: const Text('버스 / 지하철 이용 시 포인트 적립'),
            trailing: ElevatedButton(
              onPressed: () {
                onEarnPoints(10); // 예: 10포인트 적립
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('대중교통 이용 +10P 적립!')),
                );
              },
              child: const Text('+10P'),
            ),
          ),
        ),
        const SizedBox(height: 12),

        /// 2. 친환경 매장 이용
        Card(
          child: ListTile(
            leading: const Icon(Icons.store),
            title: const Text('친환경 매장 이용'),
            subtitle: const Text('제로웨이스트샵, 리필 스테이션 등'),
            trailing: ElevatedButton(
              onPressed: () {
                onEarnPoints(20); // 예: 20포인트 적립
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('친환경 매장 +20P 적립!')),
                );
              },
              child: const Text('+20P'),
            ),
          ),
        ),
        const SizedBox(height: 12),

        /// 3. 환경 캠페인 참여
        Card(
          child: ListTile(
            leading: const Icon(Icons.volunteer_activism),
            title: const Text('환경 캠페인 참여'),
            subtitle: const Text('쓰레기 줍기, 플로깅 등'),
            trailing: ElevatedButton(
              onPressed: () {
                onEarnPoints(50); // 예: 50포인트 적립
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('환경 캠페인 참여 +50P 적립!')),
                );
              },
              child: const Text('+50P'),
            ),
          ),
        ),
      ],
    );
  }
}
