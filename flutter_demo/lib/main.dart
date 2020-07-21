import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo/provider_setup.dart';
import 'package:flutter_demo/ui/app.dart';
import 'package:flutter_demo/ui/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.from(
          colorScheme: const ColorScheme.dark(),
        ).copyWith(
          primaryColor: Color(0xFF6200EE),
          primaryColorDark: Color(0xFF3700B3),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: App(),
        onGenerateRoute: Router.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}