import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.index, required this.clicked});

  final int index;
  final bool clicked;
  final List<Color> colors = const [
    Color(0xff1E1E24),
    Color(0xffFB9F89),
    Color(0xffC4AF9A),
    Color(0xff81AE9D),
    Color(0xff21A179),
    Color(0xff2176FF),
    Color(0xff33A1FD),
    Color(0xff33A1FD),
    Color(0xffFDCA40),
    Color(0xffF79824),
  ];

  @override
  Widget build(BuildContext context) {
    CircleAvatar colorItem = CircleAvatar(
      backgroundColor: colors[index],
      radius: 23,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: clicked
          ? CircleAvatar(
              backgroundColor: Colors.white,
              radius: 26,
              child: colorItem,
            )
          : colorItem,
    );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int tappedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                tappedIndex = index;
              });
            },
            child: ColorItem(
              index: index,
              clicked: tappedIndex == index,
            ),
          );
        },
        itemCount: 9,
      ),
    );
  }
}
