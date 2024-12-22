import 'package:flutter/material.dart';
import 'package:for_dayeon/core/theme/text_styles.dart';
import 'package:for_dayeon/core/utils/formatter.dart';
import 'package:for_dayeon/features/board/presentation/view_models/board_view_model.dart';
import '../pages/board_detail_page.dart';

class BoardItem extends StatelessWidget {
  final BoardViewModel boardViewModel;

  const BoardItem({
    required this.boardViewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BoardDetailPage(boardViewModel: boardViewModel),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Column 크기를 자식 크기로 설정
          children: [
            // Hero 애니메이션 추가
            Hero(
              tag: 'boardImage-${boardViewModel.id}',
              child: AspectRatio(
                aspectRatio: 3 / 4, // 이미지 비율 3:4
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    //boardViewModel.imageUrl,
                    "assets/images/${boardViewModel.imageUrl}.jpeg",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    ),
                    // loadingBuilder: (context, child, progress) {
                    //   if (progress == null) return child;
                    //   return const Center(
                    //     child: CircularProgressIndicator(),
                    //   );
                    // },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // 텍스트 섹션
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 80, // 텍스트 섹션의 고정 높이
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "${Formatter.formatYearMonthDate(boardViewModel.createdAt)}",
                      style: AppTextStyles.regular11,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      boardViewModel.title,
                      style: AppTextStyles.bold14,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      boardViewModel.content,
                      maxLines: 2, // 최대 2줄까지만 표시
                      overflow: TextOverflow.ellipsis, // 넘치는 텍스트는 "..."으로 처리
                      style: AppTextStyles.regular12,
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
}