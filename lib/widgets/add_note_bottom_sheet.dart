import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddNoteForm();
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: ListView(
            children: [
              CustomTextField(
                hintText: "Title",
                onChanged: (data) {},
                onSaved: (title) {
                  this.title = title;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "Content",
                onChanged: (data) {},
                minLines: 5,
                maxLines: 5,
                onSaved: (content) {
                  this.content = content;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                  label: "Add",
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      var notesBox = Hive.box(kNotesBox);
                      print("$title $content");
                    }
                    else{
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {

                      });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
