import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:latihan/models/contact.dart';

import 'galery.dart';
import 'package:provider/provider.dart';
import 'package:latihan/view_model/contact_provider.dart' as contact_store;

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => contact_store.Contact(),
      )
    ], child: const ContactApp()),
  );
}

class ContactApp extends StatelessWidget {
  const ContactApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactPage(),
    );
  }
}

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = Colors.orange;
  String name = '';
  String phoneNumber = '';

  List<GetContact> contactList = [];

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<contact_store.Contact>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
        backgroundColor: const Color(0xFF6200EE),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Delia Sepiana'),
            ),
            ListTile(
              title: const Text('Galery'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      // Gantilah dengan halaman baru yang ingin Anda tampilkan
                      return const GaleryPage(); // NewPage adalah contoh halaman baru
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Contact'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      // Gantilah dengan halaman baru yang ingin Anda tampilkan
                      return const ContactPage(); // NewPage adalah contoh halaman baru
                    },
                  ),
                );
              },
            ),
          ],
        ),
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
            const Text(
              'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const Divider(),
            const SizedBox(height: 8),
            // Form Name
            TextFormField(
              controller: nameController,
              onChanged: (String value) {
                name = value;
              },
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
              onChanged: (String value) {
                phoneNumber = value;
              },
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
            ElevatedButton(
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  type: FileType
                      .custom, // Specify the file types you want to allow
                  allowedExtensions: [
                    'pdf',
                    'doc',
                    'docx'
                  ], // Replace with your desired file extensions
                );

                if (result != null) {
                  // Handle the picked file here
                  print('File picked: ${result.files.first.name}');
                } else {
                  // User canceled the file picker
                  print('File picking canceled');
                }
              },
              child: const Text('Pick a File'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final phoneNumber = phoneController.text;
                final currentDate = DateTime.now();
                final currentColor = _currentColor;

                final contact = GetContact(
                    name: '',
                    phoneNumber: '',
                    date: currentDate,
                    color: currentColor);

                setState(() {
                  contactList.add(contact);
                  print(
                      'Contact Name: ${contact.name}, Phone Number: ${contact.phoneNumber}, Date: ${DateFormat('dd-MM-yyyy').format(contact.date)}, Color: ${contact.color}');
                  ;
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
                          Text('Phone: ${contact.phoneNumber}'),
                          Text(
                              'Date: ${DateFormat('dd-MM-yyyy').format(contact.date)}'),
                          Row(
                            children: [
                              const Text('Color : '),
                              Container(
                                width: 20,
                                height: 20,
                                color: contact.color,
                              )
                            ],
                          )
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () async {
                              final selectDate = await showDatePicker(
                                context: context,
                                initialDate: currentDate,
                                firstDate: DateTime(1991),
                                lastDate: DateTime(currentDate.year + 5),
                              );

                              setState(() {
                                if (selectDate != null) {
                                  _dueDate = selectDate;
                                }
                              });
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

  void deleteContact(int index) {
    setState(() {
      contactList.removeAt(index);
    });
  }
}
