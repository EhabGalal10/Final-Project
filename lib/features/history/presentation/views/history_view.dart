import 'dart:io';

import 'package:final_project/features/history/presentation/widgets/diagnosis_history_card.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> history =
        ModalRoute.of(context)!.settings.arguments
            as List<Map<String, dynamic>>;
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Diagnosis History'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: history.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return DiagnosisHistoryCard(
            model: history[index],
          );
        },
      ),
    );
  }
}
