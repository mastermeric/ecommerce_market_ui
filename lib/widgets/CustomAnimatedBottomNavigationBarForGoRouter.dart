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
    Icons.brightness_4,
    Icons.brightness_6,
    //Icons.brightness_7,
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: widget.child , height: MediaQuery.of(context).size.height, ), //myPages(_bottomNavIndex),
      floatingActionButton: FloatingActionButton(        
        child: Icon(Icons.add),
        shape: CircleBorder(),
        
        onPressed: () {           
          setState(() =>_bottomNavIndex = 2);
          _onTap(_bottomNavIndex);
          debugPrint("Floting button Hit  :::: " + _bottomNavIndex.toString());
          
         },
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
    
    debugPrint("Index :::: " + index.toString());

    switch (index) {      
      case 0:
        context.goNamed("FirstPage");
        break;
      case 1:
        context.goNamed("SecondPage");
        break;
      case 2:
        context.goNamed("ThirdPage");
        break;
      default:
    }
  }
}