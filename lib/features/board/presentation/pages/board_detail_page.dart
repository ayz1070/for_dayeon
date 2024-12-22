import 'package:flutter/material.dart';
import 'package:for_dayeon/core/theme/text_styles.dart';
import 'package:for_dayeon/features/board/presentation/view_models/board_view_model.dart';

class BoardDetailPage extends StatelessWidget {
  final BoardViewModel boardViewModel;

  const BoardDetailPage({required this.boardViewModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("게시글 상세"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero 애니메이션을 위한 이미지 섹션
            Hero(
              tag: 'boardImage-${boardViewModel.id}',
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    boardViewModel.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    ),
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 제목 섹션
            Text(
              boardViewModel.title,
              style: AppTextStyles.bold16,
            ),
            const SizedBox(height: 8),

            // 날짜 섹션
            Text(
              "작성일: ${boardViewModel.createdAt}",
              style: AppTextStyles.regular12,
            ),
            const SizedBox(height: 16),

            // 내용 섹션
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  boardViewModel.content,
                  style: AppTextStyles.regular14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}