import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

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
                    //BlocProvider.of<AddNoteCubit>(context).addNote(NoteModel(title: title!, subTitle: content!, date: date, color: color))
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
