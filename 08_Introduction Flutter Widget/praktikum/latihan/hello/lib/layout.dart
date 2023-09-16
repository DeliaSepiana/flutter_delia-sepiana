// ignore: unused_import
import 'package:flutter/material.dart';

List dataKontak = [
    {"title": "kepala sekolah", "jenis_kelamin": "laki-laki"},
    {"title": "kepala sekolah", "jenis_kelamin": "perempuan"},
    {"title": "kepala sekolah", "jenis_kelamin": "laki-laki"},
    {"title": "kepala sekolah", "jenis_kelamin": "perempuan"}
  ];
  
void main() {
  runApp(const HelloWorld());

}

class HelloWorld extends StatefulWidget {
  const HelloWorld({super.key});

  @override
  State<HelloWorld> createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  var dropDownValue = 0;
  var checkValue = false;
  var inputControllers = TextEditingController();
  var radioValue = '';
  List<String> checkboxValue = [];
  var isCheckbox1 = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any((interactiveStates.contains))) {
        return Colors.green;
      }
      return Colors.grey;
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Delia App'),
        ),
        body: Container(
          color: Colors.grey,
          margin: EdgeInsets.only(left: 30, right: 30),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text('Delia'),
                    // Text('Sepiana'),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Text('List Kelas D'),
                TextField(
                  controller: inputControllers,
                  onChanged: (inputControllers) {
                    print('$inputControllers');
                  },
                ),
                Row(children: [
                  Radio(
                    value:'Laki-laki',
                  groupValue: radioValue,
                  onChanged: (String? value) {
                    setState(() {
                      radioValue = value ?? '';
                      print('Nilai dari radio value = $radioValue');
                    });
                  }),
                  Text('Perempuan'),
                ],),
                Divider(),
                Row(children: [
                  Checkbox(value: isCheckbox1, 
                  checkColor: Colors.green,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  onChanged: (bool? value) {
                    setState(() {
                      isCheckbox1 = !isCheckbox1;
                      checkboxValue.add('C++');
                      print('$checkboxValue');
                    });
                  }),
                  Text('C++'),
                  ],
                  ),
                // Text('List Anak Didik'),
                // Expanded(child: ListView(
                //   padding: const EdgeInsets.all(10),
                //   children: [
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //   ],
                // ),),
                SizedBox(
                  height: 30,
                ),
                // Expanded(child: GridView.count(
                //   crossAxisCount: 2,
                //   children: [
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //     Text('Delia'),
                //     Text('Sepiana'),
                //   ],
                // ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: co,
//     );
//   }
// }