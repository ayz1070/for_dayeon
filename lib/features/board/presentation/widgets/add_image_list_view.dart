import 'package:flutter/material.dart';
import 'package:for_dayeon/features/board/presentation/widgets/add_image_item.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/theme/text_styles.dart';
import '../../../../core/theme/colors.dart';

class AddImageListView extends StatelessWidget {
  final List<XFile> images;
  final Function(XFile) onAddImage;
  final Function(XFile) onRemoveImage;

  const AddImageListView({
    required this.images,
    required this.onAddImage,
    required this.onRemoveImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: AppColors.backgroundPrimaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('사진을 첨부해 주세요. (최대 2장)', style: AppTextStyles.semiBold15),
              SizedBox(width: 4),
            ],
          ),
          SizedBox(height: 16),
          AddImageItem(
            images: images,
            onRemoveImage: onRemoveImage,
            onAddImage: () {},
            onAddPressed: () async {
              if (images.length >= 2) {
                // 이미지가 2개 이상일 경우 사용자에게 알림 표시
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('이미지는 최대 2장까지 등록할 수 있습니다.'),
                    duration: Duration(seconds: 2),
                  ),
                );
                return;
              }

              // 이미지 추가 로직
              final picker = ImagePicker();
              final image = await picker.pickImage(source: ImageSource.gallery);
              if (image != null) onAddImage(image);
            },
          ),
          SizedBox(height: 16),
          Text(
            "캡처한 이미지, 포장을 제거하지 않은 상품, 식별 불가능한 이미지를 등록하는 경우 이미지 비노출 및 마일리지가 지급되지 않습니다.",
            style: AppTextStyles.regular11.copyWith(
              color: Color(0xFFFF4F4D),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}