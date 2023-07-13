import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tak_blog/components/Strings.dart';
import 'package:tak_blog/components/my_component.dart';

import 'package:tak_blog/gen/assets.gen.dart';

import 'package:tak_blog/models/fake_data.dart';

class MyCats extends StatefulWidget {
  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var textTeme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 12;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: [
            SizedBox(
              height: 20,
            ),
            SvgPicture.asset(
              Assets.images.robo.path,
              height: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
              child:
                  Text(Strings.successRegistration, style: textTeme.bodyMedium),
            ),
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
              child: TextField(
                style: textTeme.bodyMedium,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintText: 'نام نام خانوادگی',
                  hintStyle: textTeme.bodyText2,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
              child: Text(Strings.chooseCats, style: textTeme.bodyMedium),
            ),
            const SizedBox(
              height: 20,
            ),

// ! grid view bilder
            Padding(
              padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemCount: tagList.getRange(0, 6).length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // تعداد سطر
                      childAspectRatio: .4, //طول هر المان
                      crossAxisSpacing: 2, //فاصله افقی
                      mainAxisSpacing: 2), //فاصله عمودی
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            if (!selectedCats.contains(tagList[index])) {
                              selectedCats.add(tagList[index]);
                            } else {
                              print('hello world');
                            }
                            // selectedCats.contains(tagList[index])
                            //      selectedCats.add(tagList[index])
                            //     : print('cont');
                          });
                        },
                        child: MainTags(textTeme: textTeme, index: index));
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              Assets.images.flesh.path,
              scale: 2,
            ),
            const SizedBox(
              height: 20,
            ),

//! selected cats
            Padding(
              padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemCount: selectedCats.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // تعداد سطر
                      childAspectRatio: .4, //طول هر المان
                      crossAxisSpacing: 2, //فاصله افقی
                      mainAxisSpacing: 2), //فاصله عمودی
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedCats.removeAt(index);
                        });
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color.fromARGB(255, 223, 223, 223)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.highlight_remove_sharp,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                selectedCats[index].title,
                                style: textTeme.headline6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
