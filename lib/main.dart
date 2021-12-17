import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Login Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final TextEditingController _usernametext = TextEditingController();
    final TextEditingController _userpasswordtext = TextEditingController();
    final TextEditingController _usermobiletext = TextEditingController();
    final TextEditingController _useraddresstext = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        // Here we take the valuhttps://github.com/carrentalps/APILogin.gite from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: _usernametext,
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'User Name',
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: _userpasswordtext,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: _usermobiletext,
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Mobile No.',
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: _useraddresstext,
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Address',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            child: TextButton(
                child: const Text('Register', style: TextStyle(fontSize: 38)),
                onPressed: () {
                  registeruser(_usernametext.text, _userpasswordtext.text,
                      _usermobiletext.text, _useraddresstext.text);
                }),
          )
        ],
      )
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.

      , // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Users {
  final int userId;
  final int id;
  final String title;

  Users({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

Future login() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    Users user = Users.fromJson(jsonDecode(response.body));

//LogitCode Here

    print(user.title);

    ////
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}

Future registeruser(String userName, String userPassword, String userMobile,
    String userAddress) async {
  final response = await http
      .get(Uri.parse('https://crp-stg.khaledez.net/users'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    Users user = Users.fromJson(jsonDecode(response.body));

//LogitCode Here

    print(user.title);
    print(userName);
    print(userPassword);
    print(userMobile);
    print(userAddress);
    ////
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
