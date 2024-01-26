import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, required this.clicked});

  final Color color;
  final bool clicked;

  @override
  Widget build(BuildContext context) {
    CircleAvatar colorItem = CircleAvatar(
      backgroundColor: color,
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
                BlocProvider.of<AddNoteCubit>(context).noteColor =
                    kColors[index];
              });
            },
            child: ColorItem(
              color: kColors[index],
              clicked: tappedIndex == index,
            ),
          );
        },
        itemCount: kColors.length,
      ),
    );
  }
}
