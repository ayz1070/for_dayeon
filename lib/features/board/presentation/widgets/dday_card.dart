import 'package:flutter/material.dart';
import 'package:for_dayeon/core/theme/text_styles.dart';

class DdayCard extends StatelessWidget {
  final DateTime targetDate = DateTime(2024, 3, 30);

  DdayCard({super.key});

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final difference = currentDate.difference(targetDate).inDays;

    return Opacity(
      opacity: 0.8,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "어느덧 ${difference}일...",
                style: AppTextStyles.bold24
              ),
              Divider(),
              Text(
                "결혼까지 D-${365-difference}",
                style: AppTextStyles.semiBold15
              ),
              Text(
                  "다준 탄생일까지 D-${366-difference}일",
                  style: AppTextStyles.semiBold15
              ),
              Text(
                  "다영(손녀임) 탄생일까지 : D-${10950-difference}일",
                  style: AppTextStyles.semiBold15
              ),

              Text(
                  "다안(증손자임) 탄생일까지 : D-${328500-difference}일",
                  style: AppTextStyles.semiBold15
              ),

              Text(
                  "지구 멸망일까지 : D-${100000000-difference}일",
                  style: AppTextStyles.semiBold15
              ),

              const SizedBox(height: 8),


            ],
          ),
        ),
      ),
    );
  }
}