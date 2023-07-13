import 'package:get/get.dart';
import 'package:tak_blog/models/article_model.dart';

import '../components/api_constant.dart';

import '../services/dio_services.dart';

class ListArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();

  RxBool loading = false.obs;
  @override
  onInit() {
    super.onInit();
    getListItems();
  }

  getListItems() async {
    var response = await DioService().getMethod(ApiConstant.getHomeItems);
    loading.value = true;
    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
    }
  }
}
