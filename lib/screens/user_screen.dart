import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  final String userName;
  final int points;
  final VoidCallback onLogout;

  const UserScreen({
    super.key,
    required this.userName,
    required this.points,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 32,
              child: Icon(Icons.person, size: 32),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text('그린캐쉬 사용자'),
              ],
            )
          ],
        ),
        const SizedBox(height: 24),
        Card(
          child: ListTile(
            leading: const Icon(Icons.savings),
            title: const Text('현재 포인트'),
            trailing: Text(
              '$points P',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          '환경 발자국',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          '대중교통, 친환경 매장, 캠페인 참여로 모은 포인트입니다.\n'
          '앞으로 이 포인트를 어떻게 사용할지도 함께 정해보자 🚶‍♂️🌍',
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: onLogout,
          icon: const Icon(Icons.logout),
          label: const Text('로그아웃'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
