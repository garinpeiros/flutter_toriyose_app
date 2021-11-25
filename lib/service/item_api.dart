import 'package:toriyose_app/model/request_model.dart';
import 'package:toriyose_app/util/request_util.dart';

class ItemApi {
  static Future getData(OptionRequestModel params) async {
    var response = await RequestUtil().get(
      'services/api/IchibaItem/Search/20140222',
      params: params.toMap(),
    );
    return response;
  }
}
