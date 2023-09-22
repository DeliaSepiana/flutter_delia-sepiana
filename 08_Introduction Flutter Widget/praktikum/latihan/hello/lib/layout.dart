import 'package:flutter/material.dart';

 List dataKontak = [
    {"title": "Kepala SUku", "jenis_kelamin": "Laki-laki"},
    {"title": "Guru Bahasa Cinta", "jenis_kelamin": "perempuan"},
    {"title": "Bendahara Sekolah", "jenis_kelamin": "Laki-laki"},
    {"title": "Guru Matematika", "jenis_kelamin": "Perempuan"},
    {"title": "Guru Biologi", "jenis_kelamin": "Laki-laki"}
  ]; // data  akan  kita dapatkan dari API temen2 back end

void main() {
  runApp(const HelloWord());
}

class HelloWord extends StatefulWidget {
  const HelloWord({super.key});

  @override
  State<HelloWord> createState() => _HelloWordState();
}

class _HelloWordState extends State<HelloWord> {
  var dropDownValue = 0;
  var checkValue = false;
  var inputControllers = TextEditingController();
  var radioValue = '';
  List<String> checkboxValue = [];
  var isCheckbox1= false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.green;
      }
      return Colors.grey;
    }

    return MaterialApp(
    
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Delia App'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey,
          margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Center(
              child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: []
                 
              ),
              const SizedBox(
                height: 60,
              ),
              const Text('List Kelas D'),
              TextField(
                controller: inputControllers,
                onChanged: (inputControllers) {
                  print('$inputControllers');
                },
              ),
              Row(
                children: [
                  Radio(
                      value: 'Laki-laki',
                      groupValue: radioValue,
                      onChanged: (String? value) {
                        setState(() {
                          //logic dari radio button itu  dimasukkan
                          radioValue = value ?? '';
                          print('Nilai  dari radio value =  $radioValue');
                        });
                      }),
                  const Text('Laki - laki'),
                ],
              ),

              Row(
                children: [
                  Radio(
                      value: 'Perempuan',
                      groupValue: radioValue,
                      onChanged: (String? value) {
                        setState(() {
                          //logic dari radio button itu  dimasukkan
                          radioValue = value ?? '';
                          print('Nilai  dari radio value =  $radioValue');
                        });
                      }),
                  const Text('Perempuan'),
                ],
              ),
              //checkbox simple
              const Divider(),
              Row(
                children: [
                  Checkbox(
                      value: isCheckbox1,
                      checkColor: Colors.green,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      onChanged: (bool? value) {
                        setState(() {
                          isCheckbox1 = !isCheckbox1;
                          checkboxValue.add('C++');
                          print('$checkboxValue');
                        });
                      }),
                  const Text('C++'),
                ],
              ),
              
              const Divider(),
              // CheckboxExample(),
              DropdownButton(
                  value: dropDownValue,
                  items: const [
                    DropdownMenuItem(
                      value: 0,
                      child: Text('pilihan 1'),
                    ),
                    DropdownMenuItem(value: 1, child: Text('pilihan 2')),
                    DropdownMenuItem(value: 2, child: Text('pilihan 3'))
                  ],
                  onChanged: (int? value) {
                    setState(() {
                      dropDownValue = value ?? 0;
                      print('$dropDownValue');
                    });
                  }),
              ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  setState(() {
                    dataKontak.add({
                      "title": "${inputControllers.text}",
                      "jenis_kelamin": "$radioValue",
                      "skill": "$checkboxValue"
                    });
                  });

                  print('data_kontak : $dataKontak',);
                },
              ),
              SizedBox(
                  height: 200,
                  child: ListView.builder(
                      itemCount: dataKontak.length, //3
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: const FlutterLogo(),
                          title: Text('${dataKontak[index]["title"]}'),
                          subtitle:
                              Text('${dataKontak[index]["jenis_kelamin"]}-Skill: ${checkboxValue.join(", ")}'),
                        );
                      })
                  ),
              const SizedBox(
                height: 20,
              ),

            ],
          )),
        ),
      ),
    ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Text('ini merupakan menu home page')],
      ),
    );
  }
}