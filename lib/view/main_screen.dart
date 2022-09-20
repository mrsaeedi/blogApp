import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tak_blog/Strings.dart';
import 'package:tak_blog/gen/assets.gen.dart';
import 'package:tak_blog/gen/fonts.gen.dart';
import 'package:tak_blog/models/fake_data.dart';
import 'package:tak_blog/view/homeScreen.dart';
import 'package:tak_blog/view/profileScreen.dart';
import '../colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedEndex = 0;
  @override
  Widget build(BuildContext context) {
    var textTeme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 12;

    List<Widget> techMainScreenPages = [
      homeScreen(size: size, textTeme: textTeme, bodyMargin: bodyMargin),
      profileScreen(size: size, textTeme: textTeme, bodyMargin: bodyMargin)
    ];
    // contants
    return SafeArea(
        child: Scaffold(
// ! app bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AllColors.colorScaffold,
        elevation: 0,
        shadowColor: Color.fromARGB(127, 197, 197, 197),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            Image(
                image: Assets.images.logo,
                fit: BoxFit.cover,
                height: size.height / 13.6),
            const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ],
        ),
      ),
// ! body
      body: Stack(
        children: [
          Center(
            child: Positioned.fill(child: techMainScreenPages[selectedEndex]),
          ),
          // profileScreen(size: size, textTeme: textTeme, bodyMargin: bodyMargin),
//!  botton navigation bar
          bottonNav(
            size: size,
            bodyMargin: bodyMargin,
            changeScreen: (int value) {
              setState(() {
                selectedEndex = value;
              });
            },
          )
        ],
      ),
    ));
  }
}

// ! botton vav widget
class bottonNav extends StatelessWidget {
  const bottonNav({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  }) : super(key: key);

  final Function(int) changeScreen;

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: 0,
      right: 0,
      child: Container(
          height: size.height / 10,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: GradiantColors.bottonNavBackground,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
          child: Padding(
            padding: EdgeInsets.fromLTRB(bodyMargin, 5, bodyMargin, 5),
            child: Container(
              height: size.height / 10,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(
                  colors: GradiantColors.bottonNav,
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        changeScreen(0);
                      },
                      icon: ImageIcon(
                        Assets.icons.home,
                        color: AllColors.colorSystemNaivgationBar,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        changeScreen(1);
                      },
                      icon: ImageIcon(
                        Assets.icons.write,
                        color: AllColors.colorSystemNaivgationBar,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        changeScreen(2);
                      },
                      icon: ImageIcon(
                        Assets.icons.user,
                        color: AllColors.colorSystemNaivgationBar,
                      ),
                    ),
                  ]),
            ),
          )),
    );
  }
}
