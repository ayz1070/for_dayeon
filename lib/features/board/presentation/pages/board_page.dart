import 'package:flutter/material.dart';
import 'package:for_dayeon/core/animation/snow_fall_effect.dart';
import 'package:for_dayeon/features/board/presentation/pages/board_add_page.dart';
import 'package:for_dayeon/features/board/presentation/view_models/board_view_model.dart';

import '../../../../core/background/snow_background.dart';
import '../../../../core/theme/text_styles.dart';
import '../widgets/board_item.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BoardViewModel boardViewModel = BoardViewModel(
        title: "아무 텍스트",
        content:
            "itemExtent가 1000으로 설정된 것은 각 캐러셀 아이템의 너비(혹은 높이)를 1000으로 고정하여, 한 번에 하나의 아이템이 크게 표시되도록 설정한 것일 수 있습니다. 이는 캐러셀 아이템이 전체 화면을 가득 채우거나 특정 크기로 표시되도록 할 때 유용합니다.",
        imageUrl: "https://picsum.photos/200/300",
        createdAt: DateTime.now());

    final CarouselController controller = CarouselController(initialItem: 2);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "공대생이라 미안해",
          style: AppTextStyles.bold16,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => BoardAddPage()));
            },
            icon: Icon(
              Icons.add_box_outlined,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              "일상",
              style: AppTextStyles.bold16,
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: SizedBox(
                height: 570,
                width: 300,
                child: CarouselView(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // 반경을 0으로 설정
                  ),
                  itemExtent: 400,
                  shrinkExtent: 100.0,
                  children: [
                    BoardItem(boardViewModel: boardViewModel),
                    BoardItem(boardViewModel: boardViewModel),
                    BoardItem(boardViewModel: boardViewModel),
                  ],
                ),
              ),
            ),
            Text("여행"),
            SizedBox(
              height: 700,
              child: CarouselView(
                controller: controller,
                itemExtent: double.infinity,
                scrollDirection: Axis.horizontal,
                shrinkExtent: 100,
                children: List<BoardItem>.generate(
                  10,
                  (int index) {
                    return BoardItem(boardViewModel: boardViewModel);
                  },
                ),
              ),
            ),
            Text("맛집"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "게시판",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "설정"),
        ],
      ),
    );
  }
}
