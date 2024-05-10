import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {

 double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    debugPrint("App Width ::: $deviceWidth Heigt : $deviceHeight");

    Color deviceColor = Colors.grey;
    String AppMode = "defaut";

    // Mobil Görünüm için renkleri Kırmızı yap.. WEB görünüm için renk Gri olsun..
    if(deviceWidth < 750 ) {
      setState(() {
        deviceColor = Colors.red;  
        AppMode = "Mobil App";
      });      
    }

    if(deviceWidth >= 750 ) {
      setState(() {
        deviceColor = Colors.amber;  
        AppMode = "Desktop App";
      });      
    }

    return Center(        
        child: SingleChildScrollView(
          child: Column(          
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Container( 
                color: deviceColor,
                width: 200,
                height: 200,
                child: Text("FANTA  .. $AppMode")),
          
               const SizedBox(height: 20,),
          
              Container( 
                color: deviceColor,
                width: 200,
                height: 200,
                child: Text("SPRITE  .. $AppMode")),
          
              const SizedBox(height: 20,),
          
                Container( 
                color: deviceColor,
                width: 200,
                height: 200,
                child: Text("ÜRÜN-3  .. $AppMode")),
          
            ],
          ),
        ),
      );
  }
}