import 'package:flutter/material.dart';


class NiteItem extends StatelessWidget {
  const NiteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return 
      Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(color: Colors.black, fontSize: 26),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 16),
                child: Text(
                  note.subTitle,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 138, 130, 130), fontSize: 16),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 28,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Text(
                note.date,
                style:
                    const TextStyle(color: Color.fromARGB(255, 138, 130, 130)),
              ),
            ),
          ],
        ),
    );
  }
}


class NoteModel {
  final String title;
  final String subTitle;
  final int color;
  final String date;
  const NoteModel({
    required this.title,
    required this.subTitle,
    required this.color,
    required this.date,
  });
}
