import 'dart:convert';

import 'package:ecommerce_market_ui/models/product_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

// ProductResponseModel türünden liste döndüren async method.
Future<List<ProductResponseModel>> getList() async {
  var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

  if(response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body); 

    debugPrint(data.toString());

    return data.map((tempJsonRes) => ProductResponseModel.fromJson(tempJsonRes)).toList();
  } else {
    throw Exception("HATA oluştu...");
  }
}

final datalar = [];

class _SecondPageState extends State<SecondPage> {

  // Fonksiyonlar ve algoritmik işlemler bu alana yazacağız... -----------------
  
  //----------------------------------------------------------------------------

  @override
  void initState() {    
    super.initState();

    getList().then((value) { 
      setState(() {
        datalar.addAll(value);
      }); 
    });    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dinamik veri Sayfası"),),
      body: Center(
        child: ListView.builder(itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 20,
                    color: Colors.grey[200],
                    child: Text("${datalar[index].id} : ${datalar[index].title}")),
                )
              ],
            ),
          );
        },),
      ),
    );
  }
}