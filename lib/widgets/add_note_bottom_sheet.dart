import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll){
          overScroll.disallowIndicator();
          return true;
        },
        child: Column(
          children: [
            CustomTextField(hintText: "Title", onChanged: (data) {}),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(hintText: "Content", onChanged: (data) {},minLines: 5,maxLines: 5,),
            const SizedBox(
              height: 25,
            ),
            CustomButton(label: "Add", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
