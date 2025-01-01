import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../state/board_state_notifier_provider.dart';

class BoardAddPage extends ConsumerWidget {
  const BoardAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boardState = ref.watch(boardAddProvider);
    final boardNotifier = ref.read(boardAddProvider.notifier);

    final ImagePicker _picker = ImagePicker();

    Future<void> _addImage() async {
      final XFile? pickedFile =
      await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        boardNotifier.setImage(pickeg햐dFile.path); // 이미지 경로를 상태에 저장
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("이미지를 선택하지 않았습니다.")),
        );
      }
    }

    void _savePost() {
      if (boardState.title.isEmpty || boardState.content.isEmpty || boardState.imageUrl == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("이미지, 제목, 내용을 모두 입력해주세요.")),
        );
        return;
      }

      // 저장 로직 구현
      print("저장된 제목: ${boardState.title}");
      print("저장된 내용: ${boardState.content}");
      print("저장된 이미지: ${boardState.imageUrl}");

      Navigator.pop(context); // 페이지 닫기
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("게시글 추가"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _savePost,
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 이미지 추가 섹션
            GestureDetector(
              onTap: _addImage,
              child: AspectRatio(
                aspectRatio: 4 / 5, // 비율 설정
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Colors.grey[300], // 배경색 회색
                    child: boardState.imageUrl == null
                        ? const Center(
                      child: Icon(
                        Icons.add,
                        size: 50,
                        color: Colors.grey,
                      ),
                    )
                        : Image.file(
                      File(boardState.imageUrl!), // 로컬 파일로부터 이미지 표시
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(
                        Icons.broken_image,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 제목 입력 필드
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                onChanged: boardNotifier.setTitle,
                decoration: const InputDecoration(
                  hintText: "제목을 입력하세요",
                  border: UnderlineInputBorder(), // 하단에만 테두리
                ),
              ),
            ),
            const SizedBox(height: 8),

            // 내용 입력 필드
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                onChanged: boardNotifier.setContent,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: "내용을 입력하세요",
                  border: UnderlineInputBorder(), // 하단에만 테두리
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}