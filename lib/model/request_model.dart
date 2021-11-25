class BaseRequestModel {
  //?format=json&applicationId=$APP_ID&affiliateId=$AFFILIATE_ID
  String format;
  String applicationId;
  String affiliateId;
  BaseRequestModel({
    required this.format,
    required this.applicationId,
    required this.affiliateId,
  });

  Map<String, dynamic> toMap() => {
        'format': format,
        'applicationId': applicationId,
        'affiliateId': affiliateId,
      };
}

class OptionRequestModel {
  int startIndex;
  int genreId;
  String keyword;
  String sortType;
  OptionRequestModel({
    required this.startIndex,
    required this.genreId,
    required this.keyword,
    required this.sortType,
  });

  Map<String, dynamic> toMap() => {
        'genreId': genreId,
        'keyword': keyword,
        'sortType': sortType,
      };
}
