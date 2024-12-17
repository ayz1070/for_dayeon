import 'package:flutter/material.dart';
import 'package:for_dayeon/core/theme/text_styles.dart';
import 'package:for_dayeon/features/board/presentation/view_models/board_view_model.dart';

class BoardItem extends StatelessWidget {
  final BoardViewModel boardViewModel;

  const BoardItem({
    required this.boardViewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              "${boardViewModel.imageUrl}",
              width: 290,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 4),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "설마 ${boardViewModel.formattedDate} ${boardViewModel.formattedTime}에 있었던 일 기억 못해?",
                  style: AppTextStyles.regular11,
                ),
                SizedBox(height: 4),
                Text(
                  "${boardViewModel.title}",
                  style: AppTextStyles.bold14,
                ),
                SizedBox(height: 4),

                Text(
                  "${boardViewModel.content}",
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
