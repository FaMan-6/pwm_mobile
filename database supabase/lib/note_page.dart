import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_note/auth_service.dart';
import 'package:supabase_note/note_service.dart';

class NotePage extends StatefulWidget {
  final String email;
  const NotePage({super.key, required this.email});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> data = [];

  Future<void> fetchInstruments() async {
    try {
      final response = await supabase.from('teacher').select();
      setState(() {
        data = response;
      });
      print(data);
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteInstrument(int id) async {
    try {
      await supabase.from('teacher').delete().eq('id', id);
      fetchInstruments();
      ScaffoldMessenger(child: SnackBar(content: Text('Delete Success')));
    } catch (e) {
      print(e);
    }
  }

  Future<void> addInstrument(String name) async {
    try {
      await supabase.from('teacher').insert({
        'nama': name,
        'mata_pelajaran': 'Siswa',
      });
      fetchInstruments();
      print('Insert Success');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Berhasil ditambahkan')));
      namaController.clear();
    } catch (e) {
      print(e);
    }
  }

  TextEditingController namaController = TextEditingController();

  void showAddDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Tambah Nama'),

            content: TextField(
              controller: namaController,
              decoration: InputDecoration(
                label: Text('Nama'),
                hintText: 'Masukan Nama',
              ),
            ),

            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (namaController.text.isNotEmpty) {
                    addInstrument(namaController.text);
                    Navigator.pop(context);
                  }
                },
                child: Text('Add'),
              ),
            ],
          ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchInstruments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.email),
        actions: [
          IconButton(
            onPressed: () {
              AuthService().signOut(context);
            },
            icon: Icon(Icons.logout, color: Colors.red),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => fetchInstruments(),
        child:
            data.isNotEmpty
                ? ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var singleData = data[index];

                    return ListTile(
                      title: Text('${index + 1}. ${singleData['nama']}'),
                      subtitle: Text(singleData['mata_pelajaran']),
                      trailing: IconButton(
                        onPressed: () {
                          deleteInstrument(singleData['id']);
                        },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    );
                  },
                )
                : Center(child: Text('Data masih kosong')),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
