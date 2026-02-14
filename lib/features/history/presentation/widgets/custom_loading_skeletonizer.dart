import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:final_project/features/history/presentation/widgets/diagnosis_history_card.dart';
class CustomLoadingSkeletonizer extends StatelessWidget {
    CustomLoadingSkeletonizer({
    super.key,
  });

  final fakeHistory = List.generate(
    10,
    (_) => {
      'diagnosis': 'Loading...',
      'confidence': 0.0,
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6kxLFean8JgfTMTgR9CRO9kS7u8Z1ebZdaA&s',
      'date': Timestamp.now(),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        enabled: true,
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: fakeHistory.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: DiagnosisHistoryCard(
                model: fakeHistory[index],
              ),
            );
          },
        ),
      );
  }
}
