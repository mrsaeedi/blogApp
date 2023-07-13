import 'package:tak_blog/models/poster_model.dart';
import 'package:get/get.dart';
import 'package:tak_blog/models/tags_model.dart';
import 'package:tak_blog/services/dio_services.dart';
import '../components/api_constant.dart';
import '../models/article_model.dart';
import '../models/podcast_model.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> topVIsitedList = RxList();
  RxList<PodcastModel> topPodcasts = RxList();
  RxBool loading = false.obs;
  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    var response = await DioService().getMethod(ApiConstant.getHomeItems);
    loading.value = true;
    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVIsitedList.add(ArticleModel.fromJson(element));
      });

      response.data['top_podcasts'].forEach((element) {
        tagList.add(TagsModel.fromJson(element));
      });

      response.data['tags'].forEach((element) {
        tagList.add(TagsModel.fromJson(element));
      });

      poster.value = PosterModel.fromJson(response.data['poster']);

      loading.value = false;
    }
  }
}
