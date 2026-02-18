import 'package:flutter/material.dart';

class DiagnosisHistoryCard extends StatelessWidget {
  final Map<String, dynamic> model;

  const DiagnosisHistoryCard({super.key, required this.model, this.ontap});
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(16),
              ),
              child: Image.network(
                model['image'],
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
      
            const SizedBox(width: 12),
      
            // Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model['diagnosis'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff111827),
                      ),
                    ),
                    const SizedBox(height: 6),
      
                    Text(
                      'Date: ${model['date'].toDate().day}/${model['date'].toDate().month}/${model['date'].toDate().year}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xff6B7280),
                      ),
                    ),
      
                    const SizedBox(height: 8),
      
                    // Confidence
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: model['confidence'],
                            minHeight: 7,
                            backgroundColor: const Color(0xffE5E7EB),
                            color: getConfidenceColor(model['confidence']),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${model['confidence'].toStringAsFixed(2)}%',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff374151),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getConfidenceColor(double value) {
    if (value >= 0.8) return const Color(0xff16A34A); // أخضر
    if (value >= 0.5) return const Color(0xffF59E0B); // برتقالي
    return const Color(0xffDC2626); // أحمر
  }
}
