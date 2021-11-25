class ItemModel {
  final String title;
  final String url;
  final String thumbnailUrl;
  final int price;
  final int reviewCount;

  const ItemModel({
    required this.title,
    required this.url,
    required this.thumbnailUrl,
    required this.price,
    required this.reviewCount,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    MediumImageUrlsModel images = MediumImageUrlsModel.fromJson(json);

    return ItemModel(
      title: json['itemName'],
      url: json['itemUrl'],
      thumbnailUrl: _getImageUrl(images),
      price: json['itemPrice'],
      reviewCount: (json['reviewAverage']).round(),
    );
  }

  static String _getImageUrl(MediumImageUrlsModel images) {
    if (images.mediumImageUrls.contains(2)) {
      return images.mediumImageUrls[2].imageUrl;
    } else if (images.mediumImageUrls.contains(1)) {
      return images.mediumImageUrls[1].imageUrl;
    } else {
      return images.mediumImageUrls[0].imageUrl;
    }
  }
}

class MediumImageUrlsModel {
  List<UrlModel> mediumImageUrls;
  MediumImageUrlsModel({required this.mediumImageUrls});

  factory MediumImageUrlsModel.fromJson(Map<String, dynamic> json) =>
      MediumImageUrlsModel(
        mediumImageUrls: json['mediumImageUrls'] != null
            ? List<UrlModel>.from(
                json['mediumImageUrls'].map(
                  (x) => UrlModel.fromJson(x),
                ),
              )
            : [],
      );
}

class UrlModel {
  String imageUrl;
  UrlModel({required this.imageUrl});

  factory UrlModel.fromJson(Map<String, dynamic> json) => UrlModel(
        imageUrl: json['imageUrl'],
      );
}

class ItemSectionModel {
  ItemModel item;
  ItemSectionModel({required this.item});

  factory ItemSectionModel.fromJson(Map<String, dynamic> json) =>
      ItemSectionModel(
        item: ItemModel.fromJson(json['Item']),
      );
}

class ItemListModel {
  List<ItemSectionModel> items;
  int pageCount;
  int hits;
  int last;
  int count;
  int page;

  ItemListModel({
    required this.items,
    required this.pageCount,
    required this.hits,
    required this.last,
    required this.count,
    required this.page,
  });

  factory ItemListModel.fromJson(Map<String, dynamic> json) => ItemListModel(
        items: json['Items'] != null
            ? List<ItemSectionModel>.from(
                json['Items'].map(
                  (x) => ItemSectionModel.fromJson(x),
                ),
              )
            : [],
        pageCount: json['pageCount'],
        hits: json['hits'],
        last: json['last'],
        count: json['count'],
        page: json['page'],
      );
}
