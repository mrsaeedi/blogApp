import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tak_blog/gen/assets.gen.dart';
import 'package:tak_blog/gen/fonts.gen.dart';
import 'package:tak_blog/view/main_screen.dart';
import '../colors.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: Assets.images.logo),
            const SizedBox(
              height: 30,
            ),
            const SpinKitThreeBounce(
              color: AllColors.colorPrimery,
              size: 50.0,
            ),
          ],
        ),
      ),
    ));
  }
}
