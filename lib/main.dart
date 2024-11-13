import 'package:flutter/material.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesScreen(),
    );
  }
}

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f6f6),
      appBar: AppBar(
        backgroundColor: const Color(0xff803C94),
        foregroundColor: Colors.white,
        title: const Text('Notes'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 2 / 2.5,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return const NoteCard(
              title: 'Note Title',
              content:
                  'Curabitur lobortis id lorem id bibendum. Ut id consectetur magna.',
              color: Color(0xff803C94),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNoteScreen(),
            ),
          );
        },
        backgroundColor: const Color(0xff803C94),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  final String title;
  final String content;
  final Color color;

  const NoteCard({
    super.key,
    required this.title,
    required this.content,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.circle, color: color, size: 8),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              content,
            ),
          ],
        ),
      ),
    );
  }
}

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f6f6),
      appBar: AppBar(
        backgroundColor: const Color(0xff803C94),
        foregroundColor: Colors.white,
        title: const Text('New Notes'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
         padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: 'Type your title',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  border: InputBorder.none,),
            ),
            SizedBox(height: 16),
            TextField(
              maxLines: 10,
              decoration: InputDecoration(
                hintText:
                    'Curabitur lobortis id lorem id bibendum. Ut id consectetur magna.',
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
