import 'package:ecommerce_market_ui/Globals/MyGlobalVals.dart';
import 'package:ecommerce_market_ui/widgets/go_router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void>  main() async {

  // URL kullanmak icin ideal.. # leri kaldırıyor :)
  setPathUrlStrategy();
  
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}
class _MyAppState extends ConsumerState<MyApp> {
  
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


      MyDeviceHeight = MediaQuery.of(context).size.height;
    MyDeviceWidth = MediaQuery.of(context).size.width;

    if (0 < MyDeviceWidth && MyDeviceWidth <= 400) {
      MyResponsiveDeviceWidth = MyDeviceWidth * 0.98;
      MyResponsiveDeviceWidthForPopup = MyDeviceWidth * 0.95;
    }
    if (400 < MyDeviceWidth && MyDeviceWidth <= 900) {
      MyResponsiveDeviceWidth = MyDeviceWidth * 0.95;
      MyResponsiveDeviceWidthForPopup = MyDeviceWidth * 0.90;
    }
    if (900 < MyDeviceWidth && MyDeviceWidth <= 1200) {
      MyResponsiveDeviceWidth = MyDeviceWidth * 0.80;
      MyResponsiveDeviceWidthForPopup = MyDeviceWidth * 0.40;
    }
    if (1200 < MyDeviceWidth && MyDeviceWidth <= 1900) {
      MyResponsiveDeviceWidth = MyDeviceWidth * 0.70;
      MyResponsiveDeviceWidthForPopup = MyDeviceWidth * 0.35;
    }
    if (1900 < MyDeviceWidth) {
      MyResponsiveDeviceWidth = MyDeviceWidth * 0.60;
      MyResponsiveDeviceWidthForPopup = MyDeviceWidth * 0.25;
    }


    // Bilgi amaçlı ..
    print("Main -> MyDeviceWidth : $MyDeviceWidth");
    print("Main -> MyResponsiveDeviceWidth : $MyResponsiveDeviceWidth");
    print("Main -> MyResponsiveDeviceWidthForPopup : $MyResponsiveDeviceWidthForPopup");


     @override
    void initState() {
      print("Main -> InitState() stage -1 ");
      super.initState();    
    }

    final goRouter2 = ref.watch(goRouterProvider);

    return MaterialApp.router(
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      theme: ThemeData(        

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // go_router : Provider ile ---------------------
      routeInformationParser: goRouter2.routeInformationParser,
      routeInformationProvider: goRouter2.routeInformationProvider,
      routerDelegate: goRouter2.routerDelegate,
      //-----------------------------------------------
      //      
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
