import 'package:flutter/material.dart';
import 'package:for_dayeon/features/board/presentation/view_models/board_view_model.dart';

class BoardItem extends StatelessWidget {
  final BoardViewModel boardViewModel;

  const BoardItem({
    required this.boardViewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.zero, // 둥근 모서리 제거
          child: Image.network(
            "${boardViewModel.imageUrl}",
            height: 200,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ),
        Text("${boardViewModel.title}"),
        Text("${boardViewModel.content}"),
      ],
    );
  }
}
