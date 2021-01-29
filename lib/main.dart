import 'package:artisan/screens/base/base_screen.dart';
import 'package:artisan/stores/page_store.dart';
import 'package:artisan/stores/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'components/radialmenu/radialmenu.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());

}

void setupLocators(){
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserManagerStore());

}

Future<void> initializeParse() async { // Função que inicializa o Parse para fazer futuras gravações
  await Parse().initialize(
    'FjyHz3dX1adJNnLNzoK9ys5u87FSOi0NCxnxWV6e',
    'https://parseapi.back4app.com/',
    clientKey: 'b4ScTCr5YB7DOKjuF21HmQtWCY3QW9DZjmlrFZED',
    autoSendSessionId: true,
    debug: true,
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Artisan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          elevation: 0,
        )
      ),
      home: BaseScreen(),
    );
  }
}
