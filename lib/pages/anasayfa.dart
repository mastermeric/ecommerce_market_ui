import 'dart:convert';

import 'package:ecommerce_market_ui/models/product_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

// ProductResponseModel türünden liste döndüren async method.
Future<List<ProductResponseModel>> getList() async {
  //var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  var response = await http.get(Uri.parse("http://localhost:5157/ECommerce/GetAllProducts"));  


  if(response.statusCode == 200) {

    // Internetten gelen JSON (string) veriler dinamik bir Listeye çevrilir (Tip belli değil)
    List<dynamic> dinamikListe  = json.decode(response.body); 

    // Dinamik liste ProductResponseModel tipindeki listeye çevrilir
    List<ProductResponseModel> productListesi = dinamikListe.map((item) => ProductResponseModel.fromJson(item)).toList();
    
    return productListesi;
  } else {
    throw Exception("HATA oluştu...");
  }
}

final datalar = [];

class _AnaSayfaState extends State<AnaSayfa> {

  // Fonksiyonlar ve algoritmik işlemler bu alana yazacağız... -----------------
  
  //----------------------------------------------------------------------------

  @override
  void initState() {    
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    debugPrint("App Width ::: $deviceWidth Heigt : $deviceHeight");

    Color deviceColor = Colors.grey;
    String AppMode = "defaut";
    int gridColumnCount = 3; // default 3

    // Mobil Görünüm için renkleri Kırmızı yap.. WEB görünüm için renk Gri olsun..
    if(deviceWidth < 750 ) {
      setState(() {
        gridColumnCount = 2;
        deviceColor = Colors.red;  
        AppMode = "Mobil App";
      });      
    }

    if(deviceWidth >= 750 ) {
      setState(() {
        gridColumnCount = 4;
        deviceColor = Colors.amber;  
        AppMode = "Desktop App";
      });      
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Ana Sayfa - Tüm ürünler"),),
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
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: gridColumnCount), 
              itemBuilder: (context, index) {
              ProductResponseModel post = snapshot.data![index] ;              
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      Text(post.prname! , style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
                      const SizedBox(width: 10,),
                      Text("\" ${post.prdesc!} \""),
                      const SizedBox(width: 10,),
                      Text("Ekleme Tarihi :${DateFormat('yyyy-MM-dd hh:mm').format(post.prupdatedate!)}"),                      
                      const SizedBox(width: 10,),
                      Text("Fiyat :${post.prprice!}" ,style: const TextStyle( color: Colors.red, fontWeight: FontWeight.bold )),
                      const SizedBox(width: 10,),
                      post.imageData!.isNotEmpty ? 
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.memory(base64Decode(post.imageData!)),
                      ) : const Text("No-Image")
                    ],
                  ),              
                ),
              );
            }
              
              );

          /*
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
              ProductResponseModel post = snapshot.data![index] ;              
              return Container(
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Text(post.prname!),
                      const SizedBox(width: 10,),
                      Text(post.prdesc!),
                      const SizedBox(width: 10,),
                      Text(DateFormat('yyyy-MM-dd hh:mm').format(post.prupdatedate!)),                      
                      const SizedBox(width: 10,),
                      post.imageData!.isNotEmpty ? 
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.memory(base64Decode(post.imageData!)),
                      ) : const Text("No-Image")
                    ],
                                    
                  ),
                ),
              );
            }
            ,);
            */
          }
        },),
    );
  }
}