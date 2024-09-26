import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class User_Details_Feedbackform extends StatefulWidget {
  const User_Details_Feedbackform({super.key});

  @override
  State<User_Details_Feedbackform> createState() =>
      _User_Details_FeedbackformState();
}

class _User_Details_FeedbackformState extends State<User_Details_Feedbackform> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedopt;
  bool _loading = false;
  bool? value1 = false;
  bool? value2 = false;
  bool? value3 = false;
  String dropdownvalue = '';
  var items = [
    'Borivali',
    'Thane',
    'Malad',
    'Mumbai',
    'Pune',
    'Belapur CBD',
    'Satara',
    'Bhivandi',
  ];
  var _genderlist = ["Female", "Male"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading;
    dropdownvalue = items.last;
    _selectedopt = _genderlist.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Feedback Form"),
        backgroundColor: Colors.blue.shade500,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                const Color.fromARGB(255, 8, 128, 226),
                Colors.white,
                Colors.blue.shade200
              ])),
          child: _loading
              ? Center(child: LinearProgressIndicator())
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
                        // ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter Your Name",
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value!)) {
                            Fluttertoast.showToast(
                                msg: "We accept Alphabets Only",
                                webShowClose: true,
                                backgroundColor: Colors.blue.shade300);
                          }
                        },
                        // onChanged: (value) {
                        //   Fluttertoast.showToast(
                        //       msg: "Enter Alphabets Only",
                        //       backgroundColor: Colors.blue.shade300);
                        // },
                      ),
                    ),
                    Container(
                      width: 500,
                      margin: const EdgeInsets.only(right: 240),
                      child: const Text("Select The Gender",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    RadioListTile(
                        title: const Text("Female"),
                        value: _genderlist[0],
                        groupValue: _selectedopt,
                        onChanged: (value) {
                          setState(() {
                            _selectedopt = value;
                          });
                        }),
                    RadioListTile(
                        title: const Text("Male"),
                        value: _genderlist[1],
                        groupValue: _selectedopt,
                        onChanged: (value) {
                          setState(() {
                            _selectedopt = value;
                          });
                        }),
                    Container(
                        width: 500,
                        margin: EdgeInsets.only(right: 240),
                        child: Text(
                          "Select Hobbies/Task you liked to do Most:",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                    Row(
                      children: [
                        Text("Writing"),
                        Checkbox(
                            value: value1,
                            tristate: true,
                            onChanged: (bool? newValue) {
                              setState(() {
                                value1 = newValue;
                              });
                            }),
                        SizedBox(width: 30),
                        Text("Exploring"),
                        Checkbox(
                            value: value2,
                            tristate: true,
                            onChanged: (bool? newValue) {
                              setState(() {
                                value2 = newValue;
                              });
                            }),
                        SizedBox(width: 30),
                        Text("Other"),
                        Checkbox(
                            value: value3,
                            tristate: true,
                            onChanged: (bool? newValue) {
                              setState(() {
                                value3 = newValue;
                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Select your location",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(width: 10),
                        DropdownButton(
                            value: dropdownvalue,
                            icon: Icon(Icons.location_on_outlined),
                            items: items.map((String item) {
                              return DropdownMenuItem<String>(
                                  value: item, child: Text(item));
                            }).toList(),
                            onChanged: (String? newValue1) {
                              setState(() {
                                dropdownvalue = newValue1!;
                              });
                            })
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _loading = true;
                            });
                            await Future.delayed(Duration(seconds: 3));
                            setState(() {
                              _loading = false;
                            });
                            //_formKey.currentState!.save();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Form Submitted:Name, Gender, Hobbies, Location")));
                          }
                        },
                        child: Text("Submit"))
                  ],
                ),
        ),
      ),
    );
  }
}
