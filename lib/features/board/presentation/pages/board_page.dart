import 'package:flutter/material.dart';
import 'package:for_dayeon/features/board/presentation/view_models/board_view_model.dart';

import '../../../../core/theme/text_styles.dart';
import '../widgets/board_item.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BoardViewModel boardViewModel = BoardViewModel(
        title: "테스트 제목",
        content: "테스트 내용",
        imageUrl: "https://picsum.photos/200/300");

    final CarouselController controller = CarouselController(initialItem: 2);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "공대생이라 미안해",
          style: AppTextStyles.bold16,
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.person),
        ],
      ),
      body: ListView(
        children: [
          Text("일상"),
          SizedBox(
            height: 300, // Carousel의 높이 설정
            child: CarouselView(

              itemExtent: 1000,
              shrinkExtent: 100,
              children: [
                BoardItem(boardViewModel: boardViewModel),
                BoardItem(boardViewModel: boardViewModel),
                BoardItem(boardViewModel: boardViewModel),
              ],
            ),
          ),
          Text("여행"),
          SizedBox(
            height: 300, // Carousel의 높이 설정
            child: CarouselView(
              controller: controller,
              itemExtent: double.infinity,
              scrollDirection: Axis.horizontal,
              shrinkExtent: 100,
              children: List<BoardItem>.generate(10, (int index){
                return BoardItem(boardViewModel: boardViewModel);
              },),
            ),
          ),
          Text("맛집"),
          SizedBox(
            height: 300, // Carousel의 높이 설정
            child: CarouselView(
              itemExtent: 1000,
              shrinkExtent: 100,
              children: [
                BoardItem(boardViewModel: boardViewModel),
                BoardItem(boardViewModel: boardViewModel),
                BoardItem(boardViewModel: boardViewModel),
              ],
            ),
          ),
        ],
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
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "설정"
          ),
        ],
      ),
    );
  }
}
