import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Contact {
  String name;
  String phone;

  Contact({required this.name, required this.phone});
  @override
  String toString() {
    return 'Name: $name, Phone: $phone';
  }
}

void main() {
  runApp(const ListPage());
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  var formKey = GlobalKey<FormState>();
  List<Contact> contact = [];
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  void deleteContact(int index) {
    setState(() {
      contact.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Contacts'),
          ),
          backgroundColor: const Color(0xFF6200EE),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Icon(
                  Icons.phone_android,
                  size: 25,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Create New Contacts',
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
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        final trimmedValue = value!.trim();
                        final words = trimmedValue.split(' ');
                        if (words.length < 2) {
                          return 'Nama harus terdiri dari minimal 2 kata';
                        }
                        for (final word in words) {
                          if (!word.isEmpty &&
                              !word
                                  .substring(0, 1)
                                  .toUpperCase()
                                  .contains(RegExp(r'[A-Z]'))) {
                            return 'Setiap kata harus dimulai dengan huruf kapital.';
                          }
                        }
                        //validasi kosong
                        if (trimmedValue.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        if (trimmedValue
                            .contains(RegExp(r'[0-9!@#%^&*(),.?":{}|<>]'))) {
                          return 'Nama tidak boleh mengandung angka atau karakter khusus';
                        }
                        return null;
                      },
                      onChanged: (String? value) {
                        print(value);
                      },
                      decoration: const InputDecoration(
                        labelText: 'Nama',
                        hintText: 'Insert your name',
                        filled: true,
                        fillColor: Color.fromARGB(255, 186, 185, 185),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: phoneController,
                      validator: (value) {
                        final nomorTelepon = value!.trim();
                        if (nomorTelepon.isEmpty) {
                          return 'Nomor telepon harus diisi';
                        }
                        if (!nomorTelepon.startsWith('0')) {
                          return 'Nomor telepon harus dimulai dengan angka 0.';
                        }
                        if (!RegExp(r'^0[0-9]{7,10}$').hasMatch(nomorTelepon)) {
                          return 'Nomor telepon tidak valid. Harus dimulai dengan 0 dan terdiri dari 8 hingga 10 angka.';
                        }
                        return null;
                      },
                      onChanged: (String? value) {
                        print(value);
                      },
                      decoration: const InputDecoration(
                        labelText: 'Nomor',
                        hintText: '+62...',
                        filled: true,
                        fillColor: Color.fromARGB(255, 186, 185, 185),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            textStyle: const TextStyle(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                contact.add(Contact(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                ));
                              });
                              print(contact);
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'List Contacts',
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: contact.length,
                  itemBuilder: (context, index) {
                    String avatarText = contact[index].name[0].toUpperCase();
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(avatarText),
                      ),
                      title: Text(contact[index].name),
                      subtitle: Text(contact[index].phone),
                      trailing: Wrap(children: [
                        IconButton(
                            onPressed: () {
                              deleteContact(index);
                            },
                            icon: const Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {
                              editContact(index);
                            },
                            icon: const Icon(Icons.edit))
                      ]),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void editContact(int index) {
    TextEditingController nameBefore =
        TextEditingController(text: contact[index].name);
    TextEditingController phoneBefore =
        TextEditingController(text: contact[index].phone);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Builder(
          builder: (BuildContext context) {
            // Use the Builder widget to get a MaterialLocalizations context
            return AlertDialog(
              title: const Text('Edit Contact'),
              content: Column(
                children: [
                  TextField(
                    controller: nameBefore,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan nama',
                    ),
                  ),
                  TextField(
                    controller: phoneBefore,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan nomor telpon',
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'Batal');
                  },
                  child: const Text('Batal'),
                ),
                TextButton(
                  onPressed: () {
                    final newName = nameBefore.text;
                    final newPhone = phoneBefore.text;
                    setState(() {
                      contact[index].name = newName;
                      contact[index].phone = newPhone;
                    });
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
