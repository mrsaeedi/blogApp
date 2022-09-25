// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:tak_blog/Strings.dart';
import 'package:tak_blog/colors.dart';
import 'package:tak_blog/gen/assets.gen.dart';
import 'package:tak_blog/my_component.dart';
// import 'package:tak_blog/models/fake_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.size,
    required this.textTeme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTeme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Image(
              image: Assets.images.avatar,
              height: 100,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  Assets.icons.blupen,
                  color: AllColors.colorTitle,
                ),
                const SizedBox(
                  height: 22,
                ),
                Text(
                  Strings.imageProfileEdit,
                  style: textTeme.headline3,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'حسین سعیدی',
              style: textTeme.bodyText2,
            ),
            Text(
              'iran98hossein@gmail.com',
              style: textTeme.bodyText2,
            ),
            const SizedBox(
              height: 20,
            ),
            TehcDivider(size: size),
            InkWell(
              splashColor: AllColors.colorPrimery,
              onTap: () {},
              child: const SizedBox(
                  height: 40, child: Center(child: Text(Strings.myFavBlog))),
            ),
            TehcDivider(size: size),
            InkWell(
              splashColor: AllColors.colorPrimery,
              onTap: () {},
              child: const SizedBox(
                  height: 40, child: Center(child: Text(Strings.myFavPodcast))),
            ),
            TehcDivider(size: size),
            InkWell(
              splashColor: AllColors.colorPrimery,
              onTap: () {},
              child: const SizedBox(
                  height: 40, child: Center(child: Text(Strings.myFavTexs))),
            ),
            SizedBox(
              height: 60,
            )
          ],
        ));
  }
}
