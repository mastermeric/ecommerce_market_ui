import 'package:ecommerce_market_ui/Globals/Providers.dart';
import 'package:ecommerce_market_ui/pages/Errror.dart';
import 'package:ecommerce_market_ui/pages/admin.dart';
import 'package:ecommerce_market_ui/pages/anasayfa.dart';
import 'package:ecommerce_market_ui/pages/indirimSayfasi.dart';
import 'package:ecommerce_market_ui/pages/iletisim.dart';
import 'package:ecommerce_market_ui/widgets/CustomAnimatedBottomNavigationBarForGoRouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';



final rootNavKey = GlobalKey<NavigatorState>();

 List<GoRoute> getRoutes() {
    return 
    [
        GoRoute(
            path: '/Anasayfa',
            name: "Anasayfa",
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const Anasayfa(),
              ),
          ),
          GoRoute(
            path: '/DiscountPage',
            name: "DiscountPage",
             pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const DiscountPage(),
              ),
          ),
          GoRoute(
            path: '/ContactPage',
            name: "ContactPage",
             pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const ContactPage(),
              ),            
          ),
                  GoRoute(
            path: '/AdminPanel',
            name: "AdminPanel",
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const AdminPanel(),
              ),
          ),
        ];    
  }

final _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  
  final authState = ref.watch(authProvider);

  return GoRouter(

    debugLogDiagnostics: true, // MericY : PROD da ?  //Forwards diagnostic messages to the dart:developer log() API
    initialLocation: "/Anasayfa",
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

