import 'package:flutter/material.dart';

class AdsScreen extends StatelessWidget {
  const AdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 나중에 친환경 광고만 DB에서 가져오도록 변경 예정
    final dummyAds = [
      {
        'title': '친환경 세제 GreenWash',
        'desc': '미세플라스틱 0%, 동물실험 0%.',
      },
      {
        'title': '리필 스테이션 ReFill Me',
        'desc': '샴푸, 세제, 세탁세제 리필하고 플라스틱 줄이기.',
      },
      {
        'title': '재사용 텀블러 이벤트',
        'desc': '일주일간 다회용컵 사용하고 포인트 추가 적립!',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: dummyAds.length,
      itemBuilder: (context, index) {
        final ad = dummyAds[index];
        return Card(
          child: ListTile(
            leading: const Icon(Icons.eco),
            title: Text(ad['title']!),
            subtitle: Text(ad['desc']!),
          ),
        );
      },
    );
  }
}
