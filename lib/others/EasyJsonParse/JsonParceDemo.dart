import 'package:flutter/material.dart';
import 'Services.dart';
import 'User.dart';

class JsonParseDemo extends StatefulWidget {
  //
  JsonParseDemo() : super();

  final String title = "Family";

  @override
  _JsonParseDemoState createState() => _JsonParseDemoState();
}

class _JsonParseDemoState extends State<JsonParseDemo> {
  //
  List<User> _users;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getUsers().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'User Data',
            textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        color: Colors.white70,
        child: ListView.builder(
          itemCount: null == _users ? 0 : _users.length,
          itemBuilder: (context, int index) {
            User user = _users[index];
            return Card(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "$index",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  CircleAvatar(
                      backgroundImage: NetworkImage("${user.person.photo}")),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("${user.person.name} ${user.person.lastname}",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w700)),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
