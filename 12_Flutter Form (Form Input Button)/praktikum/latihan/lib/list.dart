import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latihan/list.dart';

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
                              print('edit');
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
}
