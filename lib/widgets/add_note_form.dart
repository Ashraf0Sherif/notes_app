import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../models/note_model.dart';
import 'colors_list_view.dart';
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
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
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
                subTitle = content;
              },
            ),
            const SizedBox(
              height: 25,
            ),
            const ColorsListView(),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
              label: "Add",
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  var noteModel = NoteModel(
                    title: title!,
                    subTitle: subTitle!,
                    date: DateTime.now().toString(),
                    color: Colors.blue.value,
                  );
                  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
