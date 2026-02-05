
import 'package:final_project/features/history/presentation/functions/delete_document.dart';
import 'package:final_project/features/history/presentation/widgets/diagnosis_history_card.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> history =
        ModalRoute.of(context)!.settings.arguments
            as List<Map<String, dynamic>>;
    return Scaffold(
      appBar: AppBar(title: const Text('Diagnosis History'), centerTitle: true),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: history.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.startToEnd,
            background: Container(
              padding: const EdgeInsets.only(left: 16),
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              removeFromHistory(history[index]['date']);
            },
            child: DiagnosisHistoryCard(model: history[index]),
          );
        },
      ),
    );
  }
}
