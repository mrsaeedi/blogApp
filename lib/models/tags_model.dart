// ignore_for_file: public_member_api_docs, sort_constructors_first
class TagsModel {
  String? id;
  String? title;

  TagsModel({
    required this.id,
    required this.title,
  });

  TagsModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
  }
}
