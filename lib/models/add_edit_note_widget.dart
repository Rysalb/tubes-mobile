import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_color_note/models/NotesOperation.dart';
import 'package:uuid/uuid.dart';
import 'NoteModel.dart';
import 'info_widget.dart';

class AddEditNoteWidget extends StatelessWidget {
  final String title;
  final NoteModel? judul;
  final NoteModel? deskripsi;
  const AddEditNoteWidget({
    Key? key,
    required this.title,
    this.judul,
    this.deskripsi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _judul = TextEditingController();
    TextEditingController _deskripsi = TextEditingController();
    if (judul != null && deskripsi != null) {
      _judul.text = judul!.judul;
      _deskripsi.text = deskripsi!.deskripsi;
    }
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _judul,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                isDense: true,
                //fillColor: Colors.grey.shade100,
                labelText: "Judul",
                hintText: "Masukkan Judul",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _deskripsi,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                isDense: true,
                //fillColor: Colors.grey.shade100,
                labelText: "Deskripsi",
                hintText: "Masukkan Deskripsi",
              ),
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Batal"),
        ),
        TextButton(
          onPressed: () {
            if (_judul.text.isEmpty) {
              showDialog(
                context: context,
                builder: (context) {
                  return const InfoWidget(
                      title: "Error !",
                      content: "Error! Judul tidak boleh kosong !");
                },
              );
            } else {
              if (judul != null) {
                Provider.of<NotesOperation>(context, listen: false)
                    .updateNote(NoteModel(
                  id: judul!.id,
                  judul: _judul.text,
                  deskripsi: _deskripsi.text,
                ));
              } else {
                const uuid = Uuid();

                Provider.of<NotesOperation>(context, listen: false).addNote(
                  NoteModel(
                      id: uuid.v4(),
                      judul: _judul.text,
                      deskripsi: _deskripsi.text),
                );
              }
              Navigator.pop(context);
            }
          },
          child: const Text("Simpan"),
        ),
      ],
    );
  }
}
