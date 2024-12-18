import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theme/colors.dart';

class AddImageItem extends StatelessWidget {
  final List<XFile> images;
  final Function(XFile) onRemoveImage;
  final Function onAddImage;
  final VoidCallback onAddPressed;

  const AddImageItem({
    required this.images,
    required this.onRemoveImage,
    required this.onAddImage,
    required this.onAddPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        // 이미지 리스트를 렌더링
        ...images.map((image) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: kIsWeb
                    ? Image.network(
                  image.path,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                )
                    : Image.file(
                  File(image.path),
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              // 삭제 버튼
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    onRemoveImage(image);
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.black,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        }).toList(),

        // 이미지 추가 버튼
        GestureDetector(
          onTap: onAddPressed,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
              borderRadius: BorderRadius.circular(0),
              color: AppColors.buttonSecondaryColor,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
