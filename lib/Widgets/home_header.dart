import 'package:flutter/material.dart';
import 'package:noteapp/Db/note_functions.dart';
import 'package:noteapp/Screens/add_and_edite_screen.dart';

import 'package:noteapp/Theme/my_theme.dart';
import 'package:provider/provider.dart';

import 'my_icon_button.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  bool isSearching = false;

  final searchController = TextEditingController();

  String searchText = '';
  @override
  Widget build(BuildContext context) {
    final isLandscap =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notes',
            style: MyTheme.headerTitle,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isSearching = true;
                  });
                },
                splashColor: MyTheme.backgroundColor.withOpacity(.10),
                child: Container(
                  width: isSearching
                      ? MediaQuery.of(context).size.width * .55
                      : 50,
                  margin:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: MyTheme.iconColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: isSearching
                      ? TextFormField(
                          controller: searchController,
                          onChanged: (value) {
                            setState(() {
                              searchText = value;

                              Provider.of<NoteFunctions>(context, listen: false)
                                  .searchNotes(searchText);
                            });
                          },
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            letterSpacing: 1.5,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    searchText = '';
                                    searchController.clear();
                                    isSearching = false;
                                  });
                                }),
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                ),
              ),
              if (isSearching == false)
                MyIconButton(
                    icon: Icons.add,
                    lable: isLandscap ? 'Add Note' : "",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddAndEditScreen(),
                      ));
                    }),
            ],
          )
        ],
      ),
    );
  }
}
