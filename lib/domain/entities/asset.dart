class Asset {
  final String name;
  final String tag;
  final double price;
  final String iconUrl;
  bool isFavorite;

  Asset({
    required this.name,
    required this.tag,
    required this.price,
    required this.iconUrl,
    this.isFavorite = false,
  });
}
