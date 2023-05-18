import 'package:flutter/material.dart';
import 'package:noteapp/Db/note_functions.dart';
import 'package:noteapp/Db/note_model.dart';
import 'package:noteapp/Screens/all_note_screen.dart';
import 'package:noteapp/Theme/my_theme.dart';
import 'package:noteapp/Widgets/my_icon_button.dart';
import 'package:provider/provider.dart';

class AddAndEditScreen extends StatefulWidget {
  final int? id;
  const AddAndEditScreen({super.key, this.id});

  @override
  State<AddAndEditScreen> createState() => _AddAndEditScreenState();
}

class _AddAndEditScreenState extends State<AddAndEditScreen> {
  var _titleController = TextEditingController();

  var _contentController = TextEditingController();

  late NoteModel note;

  NoteModel findNote(BuildContext context, int id) {
    final _note =
        Provider.of<NoteFunctions>(context, listen: false).findNoteById(id);

    setState(() {
      note = _note;
    });
    return _note;
  }

  @override
  void initState() {
    if (widget.id == null) {
      return;
    }
    findNote(context, widget.id!);
    _titleController.text = note.title!;
    _contentController.text = note.content!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notesData = Provider.of<NoteFunctions>(context, listen: false);
    return Scaffold(
      backgroundColor: MyTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 70,
                    child: MyIconButton(
                        icon: Icons.arrow_back_ios_new_rounded,
                        onTap: () {
                          Navigator.of(context).pop();
                        }),
                  ),
                  SizedBox(
                    width: 70,
                    child: MyIconButton(
                        icon: Icons.save,
                        onTap: () {
                          //save note to database
                          if (_contentController.text.isEmpty) {
                            return;
                          }
                          if (widget.id != null) {
                            final note = NoteModel(
                              noteKey: widget.id,
                              date: DateTime.now(),
                              content: _contentController.text,
                              title: _titleController.text,
                            );

                            notesData.editeNote(note);

                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const AllNotesScreen(),
                            ));
                          } else {
                            final note = NoteModel(
                              date: DateTime.now(),
                              content: _contentController.text,
                              title: _titleController.text,
                            );
                            notesData.addNote(note);
                            Navigator.of(context).pop();
                          }
                        }),
                  ),
                ],
              ),
              TextFormField(
                controller: _titleController,
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 22,
                    letterSpacing: 1.7,
                    fontWeight: FontWeight.w800),
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 22,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w400),
                  hintText: 'Title',
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                child: TextFormField(
                  controller: _contentController,
                  style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      letterSpacing: 1.7,
                      fontWeight: FontWeight.w500),
                  maxLines: 30,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.5),
                    hintText: 'Content',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
