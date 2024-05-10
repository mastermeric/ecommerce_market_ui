import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class CustomAnimatedBottomNavigationBarForGoRouter extends StatefulWidget {
  final Widget child; // go_router icin ref
  const CustomAnimatedBottomNavigationBarForGoRouter({super.key , required this.child });

  @override
  State<CustomAnimatedBottomNavigationBarForGoRouter> createState() => _CustomAnimatedBottomNavigationBarForGoRouterState();
}

class _CustomAnimatedBottomNavigationBarForGoRouterState extends State<CustomAnimatedBottomNavigationBarForGoRouter> {

  var _bottomNavIndex = 0; //default index of a first screen

  final iconList = <IconData>[
    Icons.brightness_3,
    Icons.brightness_5,
    // Icons.brightness_4,
    // Icons.brightness_6,
    //Icons.brightness_7,
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(height: MediaQuery.of(context).size.height,child: widget.child , ), //myPages(_bottomNavIndex),

      //============================  Ortadaki buyuk Button ============================
      floatingActionButton: FloatingActionButton(        
        shape: const CircleBorder(),
        
        onPressed: () {           
          setState(() =>_bottomNavIndex = 1);
          _onTap(_bottomNavIndex);
          debugPrint("Floting button Hit  :::: $_bottomNavIndex");
          
         },        
        child: const Icon(Icons.add),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //================================================================================


      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        onTap: (index)  {

          // Floating button ortada : 0-1-3-4  şeklinde.. ( Orta noktayi 1 atlat )
          if(index >0) {
            index++;
          }
          setState(() =>_bottomNavIndex = index);        
          _onTap(_bottomNavIndex);          
        }      
      )
      
      
      );
  }

  void _onTap(int index) {
    
    debugPrint("Index :::: $index");

    switch (index) {      
      case 0:
        context.goNamed("Anasayfa");
        break;
      case 1:
        context.goNamed("DiscountPage");
        break;
      case 2:
        context.goNamed("ContactPage");
        break;
      default:
    }
  }
}