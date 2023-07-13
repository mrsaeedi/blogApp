import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tak_blog/components/loading.dart';
import 'package:tak_blog/view/main_screen/single.dart';
import '../../components/my_component.dart';
import '../../controller/article_controler.dart';
import '../../controller/list_article_controler.dart';
import '../../controller/single_article_controller.dart';

class ArticelListScreen extends StatelessWidget {
  ArticelListScreen({super.key});
  final ListArticleController listArticleController =
      Get.put(ListArticleController());
  final SingelArticleController singelArticleController =
      Get.put(SingelArticleController());
  @override
  Widget build(BuildContext context) {
    var textTeme = Theme.of(context).textTheme;

    return SafeArea(
        child: Scaffold(
            appBar: appBar('مقالات جدید'),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Obx(
                  () => ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: listArticleController.articleList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          singelArticleController.id.value = int.parse(
                              listArticleController.articleList[index].id
                                  .toString());
                          Get.to(
                            Single(),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width / 3,
                                height: Get.height / 6.5,
                                child: CachedNetworkImage(
                                  imageUrl: listArticleController
                                      .articleList[index].image!,
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(16))),
                                    );
                                  },
                                  placeholder: (context, url) {
                                    return Loading();
                                  },
                                  errorWidget: (context, url, error) {
                                    return const Icon(
                                      Icons.image_not_supported,
                                      size: 80,
                                      color: Color.fromARGB(255, 87, 86, 86),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: Get.width / 2,
                                    child: Text(
                                      listArticleController
                                          .articleList[index].title!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        listArticleController
                                            .articleList[index].author!,
                                        style: textTeme.caption,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        listArticleController
                                            .articleList[index].view!,
                                        style: textTeme.caption,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )));
  }
}
