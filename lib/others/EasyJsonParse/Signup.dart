import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Services.dart';
import 'User.dart';

class Signup extends StatefulWidget {
  Signup({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Signup createState() => _Signup();
}

class _Signup extends State<Signup> {
  User _user;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController documentController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
            ),
            TextField(
              controller: lastnameController,
            ),
            TextField(
              controller: documentController,
            ),
            TextField(
              controller: emailController,
            ),
            TextField(
              controller: passwordController,
            ),
            SizedBox(
              height: 32,
            ),
            _user == null
                ? Container()
                : Text(
                    "The user ${_user.email}, ${_user.id} is created successfully"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String name = nameController.text;
          final String lastname = lastnameController.text;
          final String document = documentController.text;
          final String email = emailController.text;
          final String password = passwordController.text;

          final User user = await Services.createUser(
              name, lastname, document, email, password);

          setState(() {
            _user = user;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
