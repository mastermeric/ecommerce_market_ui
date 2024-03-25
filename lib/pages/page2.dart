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
  var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

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

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dinamik veri Sayfası"),),
      body: FutureBuilder<List<ProductResponseModel>>(
        future: getList(), 
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } 
          if(snapshot.hasError) { 
            return Center(child: Text("ERROR : ${snapshot.error}"));
          } 
          else {

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
              ProductResponseModel post = snapshot.data![index] ;              

              return ListTile(
                title: Text(post.title!),
                subtitle: Text(post.body!),
              );
            },);
          }
        },),
    );
  }
}