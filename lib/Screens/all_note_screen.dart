import 'package:flutter/material.dart';
import 'package:noteapp/Db/note_functions.dart';
import 'package:noteapp/Theme/my_theme.dart';
import 'package:noteapp/Widgets/home_header.dart';
import 'package:noteapp/Widgets/note_grid.dart';
import 'package:provider/provider.dart';

class AllNotesScreen extends StatefulWidget {
  const AllNotesScreen({super.key});

  @override
  State<AllNotesScreen> createState() => _AllNotesScreenState();
}

class _AllNotesScreenState extends State<AllNotesScreen> {
  @override
  Widget build(BuildContext context) {
    // final isLandscap =
    //     MediaQuery.of(context).orientation == Orientation.landscape;
    Provider.of<NoteFunctions>(context).getAllNotes();

    return const Scaffold(
      backgroundColor: MyTheme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            HomeHeader(),
            Expanded(child: NoteGrid()),
          ],
        ),
      ),

      /*
      floatingActionButtonLocation: isLandscap
          ? FloatingActionButtonLocation.centerFloat
          : FloatingActionButtonLocation.endFloat,
      floatingActionButton: isLandscap
          ? FloatingActionButton.extended(
              backgroundColor: Colors.grey.shade300,
              onPressed: () {},
              label: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: MyTheme.backgroundColor,
                  ),
                  label: Text(
                    'Add Note',
                    style: GoogleFonts.lato(color: MyTheme.backgroundColor),
                  )))
          : FloatingActionButton(
              tooltip: 'add note',
              splashColor: MyTheme.backgroundColor,
              backgroundColor: Colors.grey,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddAndEditScreen(),
                ));
              },
              child: const Icon(
                Icons.add,
                color: MyTheme.backgroundColor,
                size: 45,
              ),
            ),

            */
    );
  }
}
