import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tak_blog/colors.dart';
import 'package:tak_blog/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AllColors.colorStatusBar,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: AllColors.colorSystemNaivgationBar,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var textTeme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'Localizations Sample App',

// for right to left
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''), // farsi
      ],

//! theme date
      theme: ThemeData(
        //!  input decoration
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 2),
            ),
            filled: true,
            fillColor: Color.fromARGB(255, 255, 255, 255)),

        // ! botton style
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return textTeme.headline1;
            }
            return textTeme.headline6;
          }), backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return AllColors.colorTitle;
            }
            return AllColors.colorPrimery;
          })),
        ),
        // fontFamily: 'Vazer',
        //!  text style
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontFamily: 'Vazer',
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: AllColors.colorPosterTitle),
          bodyText1: TextStyle(
            fontFamily: 'dana',
            fontSize: 13,
            fontWeight: FontWeight.w300,
          ),
          subtitle1: TextStyle(
              fontFamily: 'Vazer',
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: AllColors.colorPosterTitle),
          headline2: TextStyle(
              fontFamily: 'Vazer',
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Colors.white),
          headline3: TextStyle(
              fontFamily: 'Vazer',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AllColors.colorTitle),
          headline4: TextStyle(
              fontFamily: 'Vazer',
              fontSize: 14,
              color: Colors.green,
              fontWeight: FontWeight.w700),
          headline5: TextStyle(
              fontFamily: 'Vazer',
              fontSize: 14,
              color: Colors.red,
              fontWeight: FontWeight.w700),
          headline6: TextStyle(
              fontFamily: 'Vazer',
              fontSize: 11,
              color: Color.fromARGB(255, 49, 49, 49),
              fontWeight: FontWeight.w700),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplachScreen(),
    );
  }
}
