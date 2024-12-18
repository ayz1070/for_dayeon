import 'package:flutter/material.dart';
import '../view_models/board_view_model.dart';
import '../widgets/add_image_list_view.dart';

class BoardAddPage extends StatefulWidget {
  const BoardAddPage({Key? key}) : super(key: key);

  @override
  State<BoardAddPage> createState() => _BoardAddPageState();
}

class _BoardAddPageState extends State<BoardAddPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final List<String> _imageUrls = [];

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _addImage(String imageUrl) {
    setState(() {
      _imageUrls.add(imageUrl);
    });
  }

  void _removeImage(int index) {
    setState(() {
      _imageUrls.removeAt(index);
    });
  }

  void _savePost() {
    if (_titleController.text.isEmpty || _contentController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("제목과 내용을 모두 입력해주세요.")),
      );
      return;
    }

    final newPost = BoardViewModel(
      title: _titleController.text,
      content: _contentController.text,
      imageUrl: _imageUrls.isNotEmpty ? _imageUrls.first : '',
      createdAt: DateTime.now(),
    );

    // 게시글 저장 로직 (예: 서버로 전송 또는 로컬 DB에 저장)
    print('저장된 게시글: ${newPost.title}, ${newPost.content}, ${newPost.imageUrl}');

    Navigator.pop(context, newPost); // 새 게시글 데이터를 반환하며 페이지 닫기
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("게시판 추가"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _savePost,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: "제목",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _contentController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: "내용",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            // AddImageListView(
            //   images: _imageUrls,
            //   onAddImage: _addImage,
            //   onRemoveImage: _removeImage,
            // ),
          ],
        ),
      ),
    );
  }
}