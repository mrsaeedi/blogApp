import 'package:flutter/material.dart';
import 'package:tak_blog/components/Strings.dart';
import 'package:tak_blog/components/colors.dart';
import 'package:tak_blog/components/my_component.dart';
import 'package:tak_blog/controller/home_screen_controller.dart';
import 'package:get/get.dart';
import 'package:tak_blog/gen/assets.gen.dart';
import 'package:tak_blog/models/fake_data.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../components/loading.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.size,
    required this.textTeme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTeme;
  final double bodyMargin;
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    Widget TopVisited() {
      return SizedBox(
        height: size.height / 3.2,
        child: Obx(
          () => ListView.builder(
            itemCount: homeScreenController.topVIsitedList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    right: index == 0 ? bodyMargin : 15,
                    left: index == 4 ? 15 : 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height / 4.8,
                      width: size.width / 2.5,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(
                                    image: NetworkImage(homeScreenController
                                        .topVIsitedList[index].image!),
                                    fit: BoxFit.cover)),
                            foregroundDecoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                gradient: LinearGradient(
                                    colors: GradiantColors.postGradiant,
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                          ),
                          Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 8,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      homeScreenController
                                          .topVIsitedList[index].author!,
                                      style: textTeme.headline2,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Icon(
                                          Icons.remove_red_eye_sharp,
                                          size: 16,
                                          color: Color.fromARGB(
                                              255, 211, 211, 211),
                                        ),
                                        Text(
                                          homeScreenController
                                              .topVIsitedList[index].view!,
                                          style: textTeme.headline2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                        width: size.width / 2.6,
                        child: Text(
                          homeScreenController.topVIsitedList[index].title!,
                          style: textTeme.headline6,
                        ))
                  ],
                ),
              );
            },
          ),
        ),
      );
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(() => Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: homeScreenController.loading.value == false
                ? Column(
                    children: [
                      // ! banner
                      poster(),
                      const SizedBox(
                        height: 12,
                      ),
                      //!  hashTag listView
                      tags(),
                      const SizedBox(
                        height: 18,
                      ),

                      //! see more

                      SeeMore(bodyMargin: bodyMargin, textTeme: textTeme),
                      const SizedBox(
                        height: 12,
                      ),
                      //! post list view

                      TopVisited(),

                      SeeMoreP(bodyMargin: bodyMargin, textTeme: textTeme),
                      const SizedBox(
                        height: 12,
                      ),
                      //! podcast list view
                      topPodcas(),
                      SizedBox(
                        height: size.height / 30,
                      ),
                    ],
                  )
                : Loading(),
          )),
    );
  }

//!  tag list
  Widget tags() {
    return SizedBox(
        height: 50,
        child: ListView.builder(
          itemCount: tagList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(index == 5 ? bodyMargin : 0, 8,
                  index == 0 ? bodyMargin : 15, 8),
              child: MainTags(
                textTeme: textTeme,
                index: index,
              ),
            );
          },
        ));
  }

// ! see more podcasts
  Widget topPodcas() {
    return SizedBox(
      height: size.height / 3.2,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topPodcasts.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: index == 0 ? bodyMargin : 10, left: 10),
              child: Column(
                children: [
                  SizedBox(
                      height: size.height / 5.5,
                      width: size.width / 2.9,
                      child:
                          //

                          CachedNetworkImage(
                        imageUrl: homeScreenController.poster.value.image!,
                        // homeScreenController.topPodcasts[index].poster!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover)),
                        ),
                        placeholder: (context, url) => Loading(),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.image_not_supported_outlined,
                          size: 50,
                          color: Colors.grey,
                        ),
                      )
                      //
                      ),
                  SizedBox(
                      width: size.width / 2.9,
                      child: Text(
                        homeScreenController.topPodcasts[index].title!,
                        style: textTeme.headline6,
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget poster() {
    return Stack(
      children: [
        // main card
        Container(
          width: size.width / 1.20,
          height: size.height / 4.2,
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                  colors: GradiantColors.homePostCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: CachedNetworkImage(
            imageUrl:
                'https://techblog.sasansafari.com/Techblog/assets/upload/images/article/20220904181457.jpg', // homeScreenController.topPodcasts[index].poster!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            ),
            placeholder: (context, url) => Loading(),
            errorWidget: (context, url, error) => const Icon(
              Icons.image_not_supported_outlined,
              size: 50,
              color: Colors.grey,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 20,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  homePagePosterMap['writer'] +
                      '  ' +
                      homePagePosterMap['date'],
                  style: textTeme.headline1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.remove_red_eye_sharp,
                      color: Color.fromARGB(255, 211, 211, 211),
                    ),
                    Text(
                      homePagePosterMap['view'],
                      style: textTeme.headline1,
                    ),
                  ],
                ),
              ],
            ),
            Text(
              'اطلاعات جدیدی از بازی Assassis Creed Mirage فاش شد',
              style: textTeme.headline1,
            )
          ]),
        )
      ],
    );
  }
}

class SeeMoreP extends StatelessWidget {
  const SeeMoreP({
    Key? key,
    required this.bodyMargin,
    required this.textTeme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTeme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 5),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.blupen,
            size: 18,
            color: AllColors.colorTitle,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            Strings.viewHotPodcasts,
            style: textTeme.headline3,
          ),
        ],
      ),
    );
  }
}

// ! see more posts
class SeeMore extends StatelessWidget {
  const SeeMore({
    Key? key,
    required this.bodyMargin,
    required this.textTeme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTeme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 5),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.blupen,
            size: 18,
            color: AllColors.colorTitle,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            Strings.viewHotBlog,
            style: textTeme.headline3,
          ),
        ],
      ),
    );
  }
}
