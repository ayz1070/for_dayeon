import 'package:flutter/material.dart';

import '../view_models/board_view_model.dart';

class BoardAddPage extends StatefulWidget {

  const BoardAddPage({Key? key}) : super(key: key);

  @override
  State<BoardAddPage> createState() => _BoardAddPageState();
}

class _BoardAddPageState extends State<BoardAddPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _saveBoard() {
    if (_formKey.currentState?.validate() ?? false) {
      final newBoard = BoardViewModel(
        title: _titleController.text,
        content: _contentController.text,
        imageUrl: _imageUrlController.text,
      );

      // 콜백을 통해 부모 위젯에 데이터 전달
      //widget.onBoardAdded(newBoard);

      // 화면 종료
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("게시판 추가"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 제목 입력 필드
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "제목"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "제목을 입력해주세요.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // 내용 입력 필드
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: "내용"),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "내용을 입력해주세요.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // 이미지 URL 입력 필드
              TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(labelText: "이미지 URL"),
              ),
              const SizedBox(height: 32),

              // 저장 버튼
              Center(
                child: ElevatedButton(
                  onPressed: _saveBoard,
                  child: const Text("저장"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}