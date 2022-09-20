import 'package:flutter/material.dart';
import 'package:tak_blog/Strings.dart';
import 'package:tak_blog/colors.dart';
import 'package:tak_blog/gen/assets.gen.dart';
import 'package:tak_blog/models/fake_data.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            // ! banner
            homePagePoster(size: size, textTeme: textTeme),
            const SizedBox(
              height: 12,
            ),
            //!  hashTag listView

            homePageTagList(bodyMargin: bodyMargin, textTeme: textTeme),

            const SizedBox(
              height: 18,
            ),

            //! see more

            seeMore(bodyMargin: bodyMargin, textTeme: textTeme),
            const SizedBox(
              height: 12,
            ),
            //! post list view

            homePageBlogList(
                bodyMargin: bodyMargin, size: size, textTeme: textTeme),

            seeMoreP(bodyMargin: bodyMargin, textTeme: textTeme),
            const SizedBox(
              height: 12,
            ),
            //! podcast list view

            homePagePodcastList(
                bodyMargin: bodyMargin, size: size, textTeme: textTeme),

            SizedBox(
              height: size.height / 30,
            ),
          ],
        ),
      ),
    );
  }
// ! see more podcasts

}

class seeMoreP extends StatelessWidget {
  const seeMoreP({
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

// ! podcast list
class homePagePodcastList extends StatelessWidget {
  const homePagePodcastList({
    Key? key,
    required this.bodyMargin,
    required this.size,
    required this.textTeme,
  }) : super(key: key);

  final double bodyMargin;
  final Size size;
  final TextTheme textTeme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.2,
      child: ListView.builder(
        itemCount: blogList.getRange(0, 5).length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                EdgeInsets.only(right: index == 0 ? bodyMargin : 10, left: 10),
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 5.5,
                  width: size.width / 2.9,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            image: DecorationImage(
                                image: NetworkImage(blogList[index].imageUrl),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    width: size.width / 2.9,
                    child: Text(
                      blogList[index].writer,
                      style: textTeme.headline6,
                      textAlign: TextAlign.center,
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}

// ! blog list
class homePageBlogList extends StatelessWidget {
  const homePageBlogList({
    Key? key,
    required this.bodyMargin,
    required this.size,
    required this.textTeme,
  }) : super(key: key);

  final double bodyMargin;
  final Size size;
  final TextTheme textTeme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.2,
      child: ListView.builder(
        itemCount: blogList.getRange(0, 5).length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: index == 0 ? bodyMargin : 15, left: index == 4 ? 15 : 0),
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
                                image: NetworkImage(blogList[index].imageUrl),
                                fit: BoxFit.cover)),
                        foregroundDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  blogList[index].writer,
                                  style: textTeme.headline2,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Icon(
                                      Icons.remove_red_eye_sharp,
                                      size: 16,
                                      color: Color.fromARGB(255, 211, 211, 211),
                                    ),
                                    Text(
                                      blogList[index].views,
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
                      blogList[index].title,
                      style: textTeme.headline6,
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}

// ! see more posts
class seeMore extends StatelessWidget {
  const seeMore({
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

// ! tag list
class homePageTagList extends StatelessWidget {
  const homePageTagList({
    Key? key,
    required this.bodyMargin,
    required this.textTeme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTeme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: ListView.builder(
          itemCount: tagList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(index == 5 ? bodyMargin : 0, 8,
                  index == 0 ? bodyMargin : 15, 8),
              child: Container(
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
                        tagList[index].title,
                        style: textTeme.headline2,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}

// ! banner
class homePagePoster extends StatelessWidget {
  const homePagePoster({
    Key? key,
    required this.size,
    required this.textTeme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTeme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // main card
        Container(
          width: size.width / 1.20,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
              image: AssetImage(homePagePosterMap['imageAsset']),
              fit: BoxFit.cover,
            ),
          ),
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                  colors: GradiantColors.homePostCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
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
              homePagePosterMap['title'],
              style: textTeme.headline1,
            )
          ]),
        )
      ],
    );
  }
}
