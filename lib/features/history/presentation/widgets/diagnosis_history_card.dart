import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DiagnosisHistoryCard extends StatelessWidget {
  final Map<String, dynamic> model;
  final VoidCallback? ontap;

  const DiagnosisHistoryCard({super.key, required this.model, this.ontap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black26 : Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(16),
              ),
              child: CachedNetworkImage(
                imageUrl: model['image'],
                errorWidget: (context, url, error) => Container(
                  color: theme.colorScheme.surfaceContainerHighest,
                  child: Icon(Icons.error, color: theme.colorScheme.error),
                ),
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model['diagnosis'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 6),

                    Text(
                      'Date: ${model['date'].toDate().day}/${model['date'].toDate().month}/${model['date'].toDate().year}',
                      style: TextStyle(
                        fontSize: 13,
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: model['confidence'],
                            minHeight: 7,
                            backgroundColor:
                                theme.colorScheme.surfaceContainerHighest,
                            color: getConfidenceColor(
                              model['confidence'],
                              theme,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${(model['confidence'] * 100).toStringAsFixed(0)}%',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurface,
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

  Color getConfidenceColor(double value, ThemeData theme) {
    if (value >= 0.8) {
      return Colors.green;
    }
    if (value >= 0.5) {
      return Colors.orange;
    }
    return theme.colorScheme.error;
  }
}
