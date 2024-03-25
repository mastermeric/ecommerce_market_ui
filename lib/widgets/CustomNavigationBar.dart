import 'package:ecommerce_market_ui/pages/page1.dart';
import 'package:ecommerce_market_ui/pages/page2.dart';
import 'package:ecommerce_market_ui/pages/page3.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _currentIndex = 0;
  Color? bottomColor = const Color.fromARGB(255, 55, 71, 79);

  // Burası Navigate edilecek sayfalarımız oluyor...
  List myPages = [
    const FirstPage(),
    const SecondPage(),
    const ThirdPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: myPages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            currentIndex: _currentIndex,
            items: [
              //Sembolik olarak rasgele icon verdik.. tiklama ile sayfalara gidiş için..
              BottomNavigationBarItem(icon: const Icon(Icons.settings), label: "TEST", backgroundColor: bottomColor,),
              BottomNavigationBarItem(icon: const Icon(Icons.home), label: "Home", backgroundColor: bottomColor,),
              BottomNavigationBarItem(icon: const Icon(Icons.search), label: "Dashboard", backgroundColor: bottomColor),
              ]));
  }
}
