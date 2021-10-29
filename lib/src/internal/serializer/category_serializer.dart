import 'package:usercentrics_sdk/src/model/category.dart';

class CategorySerializer {
  static UsercentricsCategory deserialize(dynamic value) {
    return UsercentricsCategory(
      categorySlug: value['categorySlug'] ?? "",
      label: value['label'] ?? "",
      description: value['description'] ?? "",
      isEssential: value['isEssential'],
    );
  }
}
