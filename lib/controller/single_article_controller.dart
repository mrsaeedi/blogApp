import 'package:get/get.dart';
import 'package:tak_blog/models/article_model.dart';

import '../components/api_constant.dart';

import '../models/article_info_model.dart';
import '../services/dio_services.dart';

class SingelArticleController extends GetxController {
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoMode = ArticleInfoModel().obs;
  RxBool loading = false.obs;
  @override
  onInit() {
    super.onInit();
    getArticleInfo();
  }

//https://techblog.sasansafari.com/Techblog/api/article/get.php?command=info&id=1&user_id=1
  getArticleInfo() async {
    var userId = '';

    var response = await DioService().getMethod(ApiConstant.baseUrl +
        'article/get.php?command=info&id=$id&user_id=$userId');
    loading.value = true;
    if (response.statusCode == 200) {
      articleInfoMode.value = ArticleInfoModel.fromeJson(response.data);
      loading.value = false;
    }
  }
}
