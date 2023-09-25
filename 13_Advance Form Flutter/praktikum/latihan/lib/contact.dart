import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;
  final DateTime date;
  final Color color;

  Contact({
    required this.name,
    required this.phone,
    required this.date,
    required this.color,
  });
}

List<Contact> contactList = [];
