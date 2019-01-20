import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  Widget _textField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "write here",
          labelText: "Search"
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github Search"),
      ),
      body: ListView(
        children: <Widget>[
          _textField(),
        ],
      ),
    );
  }
}