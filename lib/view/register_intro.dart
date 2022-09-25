// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tak_blog/Strings.dart';
import 'package:tak_blog/colors.dart';
import 'package:tak_blog/gen/assets.gen.dart';

class RegisterIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTeme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.robo.path,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: Strings.welcomText, style: textTeme.bodyText2)),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                _showEmailBottomSheet(context, size, textTeme);
              },
              child: const Text("بزن بوریم"),
              // style: textTeme.headline1,
            )
          ],
        ),
      )),
    );
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTeme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 3,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(Strings.insertYourEmail),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextField(
                    onChanged: (value) {
                      print(value);
                    },
                    style: textTeme.bodyMedium,
                    cursorColor: const Color.fromARGB(255, 141, 141, 141),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: 'example@gmail.com',
                    ),
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: const Text('بورو'))
              ],
            )),
          ),
        );
      },
    );
  }
}
