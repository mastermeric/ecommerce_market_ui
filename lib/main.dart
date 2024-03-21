import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
 
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  @override
  Widget build(BuildContext context) {    

    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    print("App Width ::: " + deviceWidth.toString() + " Heigt : " + deviceHeight.toString());

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

    return Scaffold(
      appBar: AppBar(        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(        
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
      ),
    );
  }
}
