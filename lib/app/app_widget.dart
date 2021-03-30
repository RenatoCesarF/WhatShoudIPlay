import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          accentColor: Color(0xffF21B3F),
          primaryColor: Color(0xff322A5C),
          hintColor: Color(0xffF21B3F)),
      color: Color(0xff1F1A38),
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'What Should I Play',
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      builder: BotToastInit(),
      themeMode: ThemeMode.dark,
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: ThemeData(fontFamily: "Poppins"),
    );
  }
}
