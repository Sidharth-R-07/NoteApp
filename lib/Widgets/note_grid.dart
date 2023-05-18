import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/Db/note_model.dart';

import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/Db/note_functions.dart';
import 'package:noteapp/Theme/my_theme.dart';
import 'package:noteapp/Screens/details_note_screen.dart';

class NoteGrid extends StatefulWidget {
  const NoteGrid({super.key});

  @override
  State<NoteGrid> createState() => _NoteGridState();
}

class _NoteGridState extends State<NoteGrid> {
  List<NoteModel> notes = [];

  @override
  Widget build(BuildContext context) {
    final isLandscap =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final notesData = Provider.of<NoteFunctions>(context);
    var searchList = notesData.searchList;

    setState(() {
      notes = searchList.isNotEmpty
          ? searchList
          : notesData.notelist.reversed.toList();
    });

    if (notes.isEmpty) {
      return Center(
        child: Text(
          'There Is No Notes Available Now !\n \nAdd New Note',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
              color: Colors.grey,
              fontSize: 22,
              fontWeight: FontWeight.w300,
              letterSpacing: 1.5),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: MasonryGridView.builder(
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          itemCount: notes.length,
          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isLandscap ? 4 : 2),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailNoteScreen(
                    id: notes[index].noteKey!,
                    title: notes[index].title!,
                    dateTime: notes[index].date!,
                    content: notes[index].content!,
                  ),
                ));
              },
              child: Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.90),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notes[index].title!, style: MyTheme.titleTextStyle),
                      const SizedBox(
                        height: 8,
                      ),
                      FittedBox(
                        child: Text(
                          DateFormat('dd/MM/yyyy').format(notes[index].date!),
                          style: MyTheme.dateTextStyle,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(notes[index].content!,
                          maxLines: isLandscap ? 5 : 8,
                          style: MyTheme.contentTextBlack)
                    ],
                  )),
            );
          }),
    );
  }
}
