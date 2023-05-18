import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noteapp/Db/note_model.dart';

class NoteFunctions extends ChangeNotifier {
  List<NoteModel> notelist = [
    // NoteModel(
    //     content: 'this is test 1', date: DateTime.now(), title: 'test 12211'),
    // NoteModel(
    //     content:
    //         'this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1this issn.mnsbc,nbcmbxmcvmbmxvcm dbdmbcdc\nndbdsbcbccbn\nbmnsvcvscvcvxcvvcnxcxcvc vcxcc\nbhcvccvbkhbhdvcchhvjdc\nxcmn c zxcvbcvcvcxzmzc bc test 1',
    //     date: DateTime.now(),
    //     title: 'test 1'),
    // NoteModel(
    //     content: 'this is test 1', date: DateTime.now(), title: 'test 1221'),
    // NoteModel(
    //     content: 'this is cx.mncnbcxmnzcmcmvcxbzvcbmvcxzbvcbczjgcbtest 1',
    //     date: DateTime.now(),
    //     title: 'test 1'),
    // NoteModel(content: 'this is test 1', date: DateTime.now(), title: 'test 1'),
    // NoteModel(
    //     content: 'thisscs,ancbkacncmncbnxzc is test 1',
    //     date: DateTime.now(),
    //     title: 'test 1'),
    // NoteModel(
    //     content: 'this is test 1', date: DateTime.now(), title: 'test00 1'),
    // NoteModel(content: 'this is', date: DateTime.now(), title: 'test 1'),
    // NoteModel(
    //     content: 'this icnxbcmnxzcxbcxcmxzvzcnxbcvbcn cxzs test 1',
    //     date: DateTime.now(),
    //     title: 'test 1'),
    // NoteModel(content: 'this is test 1', date: DateTime.now(), title: 'test 1'),
    // NoteModel(
    //     content: 'this is test 1',
    //     date: DateTime.now(),
    //     title: 'test 12112331smn,sabc,nxzbc'),
    // NoteModel(content: 'this is test 1', date: DateTime.now(), title: 'test 1'),
    // NoteModel(content: 'this is test 1', date: DateTime.now(), title: 'test 1'),
    // NoteModel(content: 'this is test 1', date: DateTime.now(), title: 'test 1'),
    // NoteModel(content: 'this is test 1', date: DateTime.now(), title: 'test 1'),
    // NoteModel(content: 'this is test 1', date: DateTime.now(), title: 'test 1'),
    // NoteModel(content: 'this is test 1', date: DateTime.now(), title: 'test 1'),
  ];

  List<NoteModel> searchList = [];

  addNote(NoteModel note) async {
    final noteDB = await Hive.openBox<NoteModel>("Note_db");
    final _key = await noteDB.add(note);

    note.noteKey = _key;

    await noteDB.put(note.noteKey, note);
    getAllNotes();

    notifyListeners();
    print('Note added Succesfully');
  }

  editeNote(NoteModel note) async {
    final noteDB = await Hive.openBox<NoteModel>("Note_db");
    await noteDB.put(note.noteKey, note);

    notifyListeners();
    getAllNotes();
  }

  Future<void> getAllNotes() async {
    final noteDB = await Hive.openBox<NoteModel>("Note_db");
    notelist.clear();

    notelist.addAll(noteDB.values);

    notifyListeners();
  }

  searchNotes(String searchText) {
    final inputText = searchText.toLowerCase();

    final searchResult = notelist.where((note) {
      return note.title!.toLowerCase().contains(inputText) ||
          note.content!.toLowerCase().contains(inputText);
    }).toList();

    searchList = searchResult;

    notifyListeners();
  }

  NoteModel findNoteById(int id) {
    final note = notelist.firstWhere((note) => note.noteKey == id);

    return note;
  }

  deleteNote(int key) async {
    // notelist.remove(note);
    final noteDB = await Hive.openBox<NoteModel>("Note_db");
    await noteDB.delete(key);
    getAllNotes();

    notifyListeners();
  }
}
