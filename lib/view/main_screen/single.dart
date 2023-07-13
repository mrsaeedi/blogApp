import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tak_blog/components/loading.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../components/colors.dart';
import '../../controller/single_article_controller.dart';
import '../../gen/assets.gen.dart';

class Single extends StatelessWidget {
  Single({super.key});
  SingelArticleController singelArticleController =
      Get.put(SingelArticleController());
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://techblog.sasansafari.com/Techblog/assets/upload/images/article/20220707214415.jpg',
                height: Get.height / 3,
                imageBuilder: (context, imageProvider) {
                  return Image(image: imageProvider);
                },
                placeholder: (context, url) {
                  return Loading();
                },
                errorWidget: (context, url, error) {
                  return Image.asset(
                    'assets/images/images.jpeg',
                    color: Color.fromARGB(255, 87, 86, 86),
                  );
                },
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 60,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            end: Alignment.topCenter,
                            begin: Alignment.bottomCenter,
                            colors: GradiantColors.homePostCoverGradiant)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 24,
                        ),
                        Expanded(child: SizedBox()),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.bookmark_border_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'djfjlsfjlfjsldfj;sj',
              maxLines: 2,
              style: textTheme.titleLarge,
            ),
          ),
          Row(
            children: [
              Image(
                image: Image.asset(
                  Assets.images.avatar.path,
                ).image,
                height: 50,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                '        singelArticleController.articleInfoMode.value.author!,',
                style: textTheme.headline4,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                '       singelArticleController.articleInfoMode.value.createdAt!',
                style: textTheme.caption,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HtmlWidget(
              singelArticleController.articleInfoMode.value.content!,
              textStyle: textTheme.caption,
              enableCaching: true,
              onLoadingBuilder: (context, element, loadingProgress) =>
                  Loading(),
            ),
          )
        ],
      ),
    ));
  }
}
