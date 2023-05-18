import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/Screens/add_and_edite_screen.dart';
import 'package:provider/provider.dart';

import '../Db/note_functions.dart';
import '../Theme/my_theme.dart';
import '../Widgets/my_icon_button.dart';

class DetailNoteScreen extends StatelessWidget {
  final int id;
  final String title;
  final String content;
  final DateTime dateTime;
  const DetailNoteScreen({
    super.key,
    required this.title,
    required this.content,
    required this.id,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    final isLandscap =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final notesData = Provider.of<NoteFunctions>(context);
    return Scaffold(
        backgroundColor: MyTheme.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyIconButton(
                        icon: Icons.arrow_back_ios_new_rounded,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Row(
                        children: [
                          MyIconButton(
                            icon: Icons.edit_note,
                            lable: isLandscap ? 'Edit' : '',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddAndEditScreen(id: id),
                              ));
                            },
                          ),
                          MyIconButton(
                            icon: Icons.delete_outline,
                            lable: isLandscap ? 'Delete' : '',
                            onTap: () {
                              notesData.deleteNote(id);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: MyTheme.headerTitle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  DateFormat('dd/MM/yyyy').format(dateTime),
                  style: GoogleFonts.roboto(
                      color: Colors.grey.withOpacity(.50), letterSpacing: 1.5),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      content,
                      style: MyTheme.contentTextWhite,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
