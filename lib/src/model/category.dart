/// A service category.
class UsercentricsCategory {
  const UsercentricsCategory({
    required this.categorySlug,
    required this.label,
    required this.description,
    required this.isEssential,
  });

  /// The category slug identifier.
  final String categorySlug;

  /// The label of the category if any.
  final String label;

  /// The description of the category if any.
  final String description;

  /// True, if it is an essential category. False, if not.
  final bool isEssential;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsCategory &&
          runtimeType == other.runtimeType &&
          categorySlug == other.categorySlug &&
          label == other.label &&
          description == other.description &&
          isEssential == other.isEssential;

  @override
  int get hashCode =>
      categorySlug.hashCode +
      label.hashCode +
      description.hashCode +
      isEssential.hashCode;

  @override
  String toString() =>
      "$UsercentricsCategory(categorySlug: $categorySlug, label: $label, description: $description, isEssential: $isEssential)";
}
