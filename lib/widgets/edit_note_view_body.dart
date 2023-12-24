import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            CustomAppBar(
              title: "Edit Note",
              icon: Icons.check,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(hintText: "Title", onChanged: (text) {}),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              hintText: "Content",
              onChanged: (text) {},
              minLines: 5,
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
