import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {  

  const ErrorPage({super.key, required this.ErrMsg});
  final String ErrMsg;
  

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ERROR-PAGE" , style: TextStyle(fontSize: 30 , color: Colors.red))),
      body: Center(
        child: Column(
          children: [
            Text("Error Details :" , style: TextStyle(fontSize: 30),),
            Text(widget.ErrMsg)
        ],
        ),
      )
    );
  }
}