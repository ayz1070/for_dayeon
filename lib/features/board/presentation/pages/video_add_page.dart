import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoAddPage extends ConsumerStatefulWidget {
  const VideoAddPage({Key? key}) : super(key: key);

  @override
  ConsumerState<VideoAddPage> createState() => _VideoAddPageState();
}

class _VideoAddPageState extends ConsumerState<VideoAddPage> {
  final TextEditingController youtubeUrlController = TextEditingController();
  String? thumbnailUrl;

  void _fetchYoutubeThumbnail(String url) {
    final videoId = _extractYoutubeId(url);
    if (videoId != null) {
      setState(() {
        thumbnailUrl = 'https://img.youtube.com/vi/$videoId/0.jpg';
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("유효하지 않은 유튜브 URL입니다.")),
      );
    }
  }

  String? _extractYoutubeId(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) return null;

    if (uri.host.contains('youtube.com')) {
      return uri.queryParameters['v'];
    } else if (uri.host.contains('youtu.be')) {
      return uri.pathSegments.isNotEmpty ? uri.pathSegments.first : null;
    }
    return null;
  }

  void _saveVideoPost() {
    if (youtubeUrlController.text.trim().isEmpty || thumbnailUrl == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("유튜브 URL과 썸네일을 확인해주세요.")),
      );
      return;
    }

    print("저장된 유튜브 URL: ${youtubeUrlController.text.trim()}");
    print("저장된 썸네일 URL: $thumbnailUrl");

    Navigator.pop(context); // 페이지 닫기
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("영상 추가"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _saveVideoPost,
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                if (thumbnailUrl != null) {
                  // 썸네일을 클릭했을 때 원하는 동작 추가 가능
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("썸네일이 선택되었습니다.")),
                  );
                }
              },
              child: AspectRatio(
                aspectRatio: 16 / 9, // 유튜브 영상 비율
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Colors.grey[300], // 기본 배경색
                    child: thumbnailUrl == null
                        ? const Center(
                      child: Icon(
                        Icons.video_library,
                        size: 50,
                        color: Colors.grey,
                      ),
                    )
                        : Image.network(
                      thumbnailUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                      const Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: youtubeUrlController,
                    decoration: const InputDecoration(
                      hintText: "유튜브 URL을 입력하세요",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    final url = youtubeUrlController.text.trim();
                    _fetchYoutubeThumbnail(url);
                  },
                  child: const Text("확인"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}