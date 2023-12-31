import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late FocusNode fname;
  late FocusNode lname;
  late FocusNode age;
  late FocusNode email;
  late FocusNode submit;

  @override
  void initState() {
    super.initState();
    fname = FocusNode();
    lname = FocusNode();
    age = FocusNode();
    email = FocusNode();
    submit = FocusNode();
  }

  @override
  void dispose() {
    fname.dispose();
    lname.dispose();
    age.dispose();
    email.dispose();
    submit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Focus Node',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Focus Bro!'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Personal',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.indigoAccent,
                    ),
                  ),
                  TextFormField(
                    autofocus: true,
                    focusNode: fname,
                    keyboardType: TextInputType.text,
                    enabled: true,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      hintText: 'Enter your first name',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                    ),
                    onFieldSubmitted: (term) {
                      fname.unfocus();
                      FocusScope.of(context).requestFocus(lname);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    focusNode: lname,
                    enabled: true,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      hintText: 'Enter your last name',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                    ),
                    onFieldSubmitted: (term) {
                      lname.unfocus();
                      FocusScope.of(context).requestFocus(email);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    focusNode: email,
                    enabled: true,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                    ),
                    onFieldSubmitted: (term) {
                      email.unfocus();
                      FocusScope.of(context).requestFocus(age);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    focusNode: age,
                    enabled: true,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      labelText: 'Age',
                      hintText: 'Enter your age',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                    ),
                    onFieldSubmitted: (term) {
                      age.unfocus();
                      FocusScope.of(context).requestFocus(submit);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    focusNode: submit,
                    onPressed: () {},
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.resolveWith<Color?>((states) =>
                              states.contains(MaterialState.focused)
                                  ? Colors.red
                                  : null),
                    ),
                    child: const Text('Submit'),

                    // style: TextButton.styleFrom(
                    //     foregroundColor: Colors.lightBlueAccent),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
