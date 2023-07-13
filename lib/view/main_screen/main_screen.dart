import 'package:get/get.dart';
import 'package:tak_blog/components/Strings.dart';
import 'package:tak_blog/components/colors.dart';
import 'package:tak_blog/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:tak_blog/view/main_screen/articel_list_screen.dart';
// import 'package:tak_blog/view/homeScreen.dart';
import 'package:tak_blog/view/main_screen/profileScreen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tak_blog/view/main_screen/single.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/home_screen_controller.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatelessWidget {
  RxInt selectedEndex = 0.obs;
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    // DioService().getMethod(ApiConstanst.getHomeItems);
    var textTeme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 12;
    homeScreenController.getHomeItems();
    List<Widget> techMainScreenPages = [
      // HomeScreen(size: size, textTeme: textTeme, bodyMargin: bodyMargin),
      ProfileScreen(size: size, textTeme: textTeme, bodyMargin: bodyMargin)
    ];
    // contants
    return SafeArea(
        child: Scaffold(
      key: _key,
//  drawer
      drawer: Drawer(
          backgroundColor: AllColors.colorScaffold,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    Assets.images.logo.path,
                    scale: 4,
                  ),
                ),
                ListTile(
                  title: Text('پروف کاربری', style: textTeme.bodyMedium),
                  onTap: () {},
                ),
                const Divider(
                  color: AllColors.colorDivider,
                ),
                ListTile(
                  title: Text('درباره تک بلاگ', style: textTeme.bodyMedium),
                  onTap: () {},
                ),
                const Divider(
                  color: AllColors.colorDivider,
                ),
                ListTile(
                  title:
                      Text('اشتراک گذاری تک بلاگ', style: textTeme.bodyMedium),
                  onTap: () async {
                    await Share.share(Strings.shareText);
                  },
                ),
                const Divider(
                  color: AllColors.colorDivider,
                ),
                ListTile(
                  title: Text('تک بلاگ در گیت هاب', style: textTeme.bodyMedium),
                  onTap: () {
                    MyLaunchUrl(Strings.techBogUrl);
                  },
                ),
              ],
            ),
          )),
// ! app bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AllColors.colorScaffold,
        elevation: 0,
        shadowColor: const Color.fromARGB(127, 197, 197, 197),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                onTap: (() {
                  _key.currentState!.openDrawer();
                }),
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                )),
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
          Positioned.fill(
              child: Obx(
            () => IndexedStack(
              index: selectedEndex.value,
              children: [
                ArticelListScreen(),

                // MainScreen(),
                // HomeScreen(
                //     size: size, textTeme: textTeme, bodyMargin: bodyMargin),
                ProfileScreen(
                    size: size, textTeme: textTeme, bodyMargin: bodyMargin),
              ],
            ),
          )),
          // profileScreen(size: size, textTeme: textTeme, bodyMargin: bodyMargin),
//!  botton navigation bar
          BottonNav(
            size: size,
            bodyMargin: bodyMargin,
            changeScreen: (int value) {
              selectedEndex.value = value;
            },
          )
        ],
      ),
    ));
  }
}

// ! botton vav widget
class BottonNav extends StatelessWidget {
  const BottonNav({
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

MyLaunchUrl(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    print('con not $uri');
  }
}
