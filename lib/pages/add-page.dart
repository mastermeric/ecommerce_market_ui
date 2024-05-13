import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ekle"),),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children:  [
           TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: "Title"),
          ),
          const SizedBox(height: 20.0),
          TextField(
            controller: descController,
            decoration: const InputDecoration(hintText: "Description"),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLength: 8,
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {}, 
            child: const Text("Submit"))
        ],
      ),
    );
  }

  void submitDate() {
    // step-1 : Get data from form
    final title = titleController.text;
    final desc = descController.text;
    final body = { 
          "prname": "string",
          "prdesc": "string",
          "prprice": "555",
          "prdiscount": "5",
          "prupdatedate": "2024-05-12T04:18:47.200Z"
        };
    // step-2 : Submit data to Server
    // step-3 : show result success/fail
  }
}