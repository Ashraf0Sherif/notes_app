import 'package:flutter/material.dart';
import 'package:animation_search_bar/animation_search_bar.dart'
    show AnimationSearchBar;
import 'notes_list_view.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          AnimationSearchBar(
            centerTitle: "Notes",
            centerTitleStyle:
                const TextStyle(color: Colors.white, fontSize: 20),
            isBackButtonVisible: false,
            onChanged: (text) {},
            searchTextEditingController: controller,
            horizontalPadding: 20,
            hintStyle: const TextStyle(color: Colors.white),
            textStyle: const TextStyle(color: Colors.white),
            searchIconColor: Colors.white,
            closeIconColor: Colors.white,
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: NotesListView(),
            ),
          ),
        ],
      ),
    );
  }
}
