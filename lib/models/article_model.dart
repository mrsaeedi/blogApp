// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tak_blog/components/api_constant.dart';

class ArticleModel {
  String? id;
  String? title;
  String? name;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  // String? isFavorite;
  String? status;
  String? createdAt;
  ArticleModel({
    required this.id,
    required this.title,
    required this.name,
    required this.image,
    required this.catId,
    required this.catName,
    required this.author,
    required this.view,
    // this.isFavorite,
    required this.status,
    required this.createdAt,
  });

  ArticleModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    name = element["name"];
    image = ApiConstant.hostDlUrl + element["image"];
    catId = element["cat_id"];
    catName = element["cat_name"];
    author = element["author"];
    view = element["view"];
    status = element["status"];
    createdAt = element["created_at"];
  }
}
