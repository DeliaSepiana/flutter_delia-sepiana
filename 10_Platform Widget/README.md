<h1>Resume “Platform Widget”</h1>

- MaterialApp widget yang digunakan pada sistem android dan merupakan widget dasar yang mengemas seluruh widget dalam aplikasi. import ‘package:flutter/material.dart’.
  scaffold sebuah widget untuk membangun halaman pada MaterialApp. Dalam scaffold terdapat appBar, body, bottomNavBar dan drawer.
- CupertinoApp samaa seperti MaterialApp tapi digunakan pada sistem IOS. import ‘package:flutter/cupertino.dart’.
  CupertinoPageScaffold untuk membangun halaman pada cupertino. Membentuk tata letak dasar sebuah halaman yang ditulis melalui properti-properti. Dalam CupertinoPageScaffold terdapat navigationBar dan child.
  Membuat variabel \_themeDark untuk menyimpan tema karena pada cupertino tidak menyediakan ThemeDark.dark().
