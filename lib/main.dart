import 'package:ecommerce_market_ui/widgets/CustomNavigationBar.dart';
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
 
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _counter = 0;


  @override
  Widget build(BuildContext context) {    

   

    return Scaffold(
      bottomNavigationBar: const CustomNavigationBar(), // Burada bizim NavBar olacak..,
      appBar: AppBar(        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      // Boş bir body ..
      body: const Center(
        child: Column(),
      ),
    );
  }
}
