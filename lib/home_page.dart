import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  final String user_name;
  
  const HomePage({
    super.key, required this.user_name,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello, " + widget.user_name),
      ),
    );
  }
}