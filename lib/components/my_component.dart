import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tak_blog/components/colors.dart';
import 'package:tak_blog/components/text_style.dart';
import 'package:tak_blog/controller/home_screen_controller.dart';
import 'package:tak_blog/gen/assets.gen.dart';

class TehcDivider extends StatelessWidget {
  const TehcDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AllColors.colorDivider,
      indent: size.width / 5,
      thickness: 1.5,
      endIndent: size.width / 6,
    );
  }
}

// !  mainTags
class MainTags extends StatelessWidget {
  MainTags({
    Key? key,
    required this.textTeme,
    required this.index,
  }) : super(key: key);
  var index;
  final TextTheme textTeme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: GradiantColors.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          )),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            ImageIcon(
              Assets.icons.hashtag,
              size: 16,
              color: AllColors.colorSubtext,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              Get.find<HomeScreenController>().tagList[index].title!,
              style: textTeme.headline2,
            ),
          ],
        ),
      ),
    );
  }
}

//!‌ app bar
PreferredSize appBar(String title) {
  return PreferredSize(
    preferredSize: Size.fromHeight(55),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0, left: 0.10),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: Center(
                child: Text(
                  title,
                  style: appBarTextStyle,
                ),
              ),
            )
          ],
          leading: Padding(
            padding: const EdgeInsets.only(right: 6.0, top: 10),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: AllColors.colorPrimery.withBlue(100),
                  shape: BoxShape.circle),
              child: const Icon(Icons.keyboard_arrow_right),
            ),
          ),
        ),
      ),
    ),
  );
}
