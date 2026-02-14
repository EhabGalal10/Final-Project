import 'package:final_project/core/utils/app_text_styles.dart';
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
      backgroundColor: const Color(0xffF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text('Diagnosis History', style: AppTextStyles.inter700style20),
      ),
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
              decoration: BoxDecoration(
                color: const Color(0xffDC2626),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.delete_outline,
                color: Colors.white,
                size: 28,
              ),
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
