import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_color_note/models/NotesOperation.dart';
import 'package:ui_color_note/page/note_control.dart';
import '../models/NoteModel.dart';
import '../models/add_edit_note_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00f1f1f1),
        title: Text(
          'NotesKu',
          style: TextStyle(
            color: Colors.amber,
            fontStyle: FontStyle.italic,
            fontSize: 25,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(236, 243, 171, 5),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const AddEditNoteWidget(title: "Tambah Note");
              });

          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => addPage()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: Consumer<NotesOperation>(
        builder: (context, NotesOperation data, child) {
          return ListView(
              padding: const EdgeInsets.all(20.0),
              children: data.listNotes.isNotEmpty
                  ? data.listNotes.map((data) {
                      return Dismissible(
                        key: Key(data.id),
                        background: Container(
                          color: Colors.red.shade300,
                          child: const Center(
                            child: Text("Hapus?",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        onDismissed: (direction) {
                          Provider.of<NotesOperation>(
                            context,
                            listen: false,
                          ).removeNote(data);
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(data.judul),
                            subtitle: Text(data.deskripsi),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AddEditNoteWidget(
                                      title: "Edit Note",
                                      judul: data,
                                      deskripsi: data,
                                    );
                                  });
                            },
                          ),
                        ),
                      );
                    }).toList()
                  : [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Tidak ada Notes",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center),
                            ]),
                      )
                    ]);
        },
      ),
    );
  }
}

// class NotesCard extends StatelessWidget {
//   final NoteModel note;

//   NotesCard(this.note);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(15),
//       padding: EdgeInsets.all(15),
//       height: 150,
//       decoration: BoxDecoration(
//           color: Colors.amber, borderRadius: BorderRadius.circular(15)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             note.judul,
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Text(note.deskripsi, style: TextStyle(fontSize: 15))
//         ],
//       ),
//     );
//   }
// }
