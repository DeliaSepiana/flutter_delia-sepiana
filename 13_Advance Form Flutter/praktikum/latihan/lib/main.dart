import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'contact.dart';

void main() {
  runApp(const ContactApp());
}

class ContactApp extends StatelessWidget {
  const ContactApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ContactPage(),
    );
  }
}

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  DateTime _dueDate = DateTime.now();
  Color _currentColor = Colors.orange;
  String _selectedFilePath = '';
  String _submittedName = '';
  String _submittedPhone = '';
  DateTime _submittedDate = DateTime.now();
  Color _submittedColor = Colors.orange;
  String _submittedFilePath = '';

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  void _handleSubmit() async {
    final name = nameController;
    final phone = phoneController;
    final currentDate = DateTime.now();
    final currentColor = _currentColor;

    // List<String> selectedFiles = [];
    // if (_selectedFilePath.isNotEmpty) {
    //   selectedFiles.addAll(_selectedFilePath);
    // }
  }

  void deleteContact(int index) {
    setState(() {
      contactList.removeAt(index);
    });
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    setState(() {
      _selectedFilePath = file.path!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
        backgroundColor: const Color(0xFF6200EE),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.phone_android,
              size: 25,
            ),
            const SizedBox(height: 18),
            const Text(
              'Create New Contact',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 18),
            // Form Name
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Insert your name',
                filled: true,
                fillColor: Color.fromARGB(255, 186, 185, 185),
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 12),
            // Form Nomor HP
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                hintText: '08...',
                filled: true,
                fillColor: Color.fromARGB(255, 186, 185, 185),
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 12),
            // Date Picker
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Date'),
                TextButton(
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1991),
                      lastDate: DateTime(DateTime.now().year + 5),
                    );

                    if (selectedDate != null) {
                      setState(() {
                        _dueDate = selectedDate;
                      });
                    }
                  },
                  child: const Text('Select'),
                ),
              ],
            ),
            Text(
              DateFormat('dd-MM-yyyy').format(_dueDate),
            ),
            const SizedBox(height: 12),
            // Color Picker
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Color'),
                const SizedBox(height: 10),
                Container(
                  height: 100,
                  width: double.infinity,
                  color: _currentColor,
                ),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(_currentColor),
                    ),
                    child: const Text('Pick Color'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Pick Your Color'),
                            content: BlockPicker(
                              pickerColor: _currentColor,
                              onColorChanged: (color) {
                                setState(() {
                                  _currentColor = color;
                                });
                              },
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Save'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            // File Picker
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     const Text('File'),
            //     const SizedBox(height: 10),
            //     ElevatedButton(
            //       onPressed: _pickFile,
            //       child: const Text('Pick and Open File'),
            //     ),
            //     Text(_selectedFilePath),
            //   ],
            // ),
            // const SizedBox(height: 12),
            // Submit Button
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final phoneNumber = phoneController.text;

                final contact = Contact(
                  name: name,
                  phone: phoneNumber,
                  date: _dueDate,
                  color: _currentColor,
                );

                setState(() {
                  contactList.add(contact);
                  print(contact);
                });

                nameController.clear();
                phoneController.clear();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Contact submitted successfully'),
                  ),
                );
              },
              child: const Text('Submit'),
            ),

            const SizedBox(height: 12),
            // List View Contact

            Expanded(
              child: ListView.builder(
                itemCount: contactList.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'List Contact',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  } else {
                    final contact = contactList[index - 1];
                    final avatarText = contact.name[0].toUpperCase();

                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(avatarText),
                      ),
                      title: Text(contact.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Phone: ${contact.phone}'),
                          Text(
                              'Date: ${DateFormat('dd-MM-yyyy').format(contact.date)}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              //  edit
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              deleteContact(index - 1);
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
