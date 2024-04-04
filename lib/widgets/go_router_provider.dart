import 'package:ecommerce_market_ui/Globals/Providers.dart';
import 'package:ecommerce_market_ui/pages/Errror.dart';
import 'package:ecommerce_market_ui/pages/page1.dart';
import 'package:ecommerce_market_ui/pages/page2.dart';
import 'package:ecommerce_market_ui/pages/page3.dart';
import 'package:ecommerce_market_ui/widgets/CustomAnimatedBottomNavigationBarForGoRouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';



final rootNavKey = GlobalKey<NavigatorState>();

 List<GoRoute> getRoutes() {
    return 
    [
        GoRoute(
            path: '/FirstPage',
            name: "FirstPage",
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const FirstPage(),
              ),
          ),
          GoRoute(
            path: '/SecondPage',
            name: "SecondPage",
             pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const SecondPage(),
              ),
          ),
          GoRoute(
            path: '/ThirdPage',
            name: "ThirdPage",
             pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const ThirdPage(),
              ),            
          ),
        ];    
  }

final _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  
  final authState = ref.watch(authProvider);

  return GoRouter(
    debugLogDiagnostics: true, // MericY : PROD da ?  //Forwards diagnostic messages to the dart:developer log() API
    initialLocation: "/FirstPage",
    navigatorKey: rootNavKey,
    
    // Provider dinlemede..
    refreshListenable: authState,  

    routes :[ 
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        routes: getRoutes(),        
        builder: (context, state, child) => CustomAnimatedBottomNavigationBarForGoRouter(child: child)
        //builder: (context, state, child) => PersistentNavbarForGoRouter(child: child)
        //builder: (context, state, child) => BottomNavBarSimple(child: child)
        //builder: (context, state, child) => CustomNavigationBarForGoRouter(child: child)
        )],          

      errorBuilder: (context, state) => ErrorPage(
        ErrMsg: state.error.toString(),
        key: state.pageKey,
      ),
      redirect: (context, state) {
        //return isLoggedIn ? "pages/MyDashBoard" : "pages/LoginPage";
        final isAuthenticated = authState.isLoggedIn ;
        return null;
    },
  );
});

