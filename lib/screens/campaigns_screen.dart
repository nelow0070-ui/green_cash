import 'package:flutter/material.dart';

class CampaignsScreen extends StatelessWidget {
  const CampaignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 나중에 여기서 실제 캠페인 리스트(Firebase 등)로 대체
    final dummyCampaigns = [
      '주말 쓰레기 줍기 캠페인 (한강공원)',
      '플로깅 데이 (동네 산책길)',
      '일회용품 줄이기 챌린지',
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: dummyCampaigns.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: const Icon(Icons.event),
            title: Text(dummyCampaigns[index]),
            subtitle: const Text('참여 시 포인트 적립'),
            trailing: TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('캠페인 상세/인증 기능은 추후 추가 예정')),
                );
              },
              child: const Text('자세히'),
            ),
          ),
        );
      },
    );
  }
}
