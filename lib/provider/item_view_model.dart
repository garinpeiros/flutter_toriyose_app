import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toriyose_app/config/constant.dart';
import 'package:toriyose_app/model/item_model.dart';
import 'package:toriyose_app/model/request_model.dart';
import 'package:toriyose_app/service/item_api.dart';

final itemProvider = ChangeNotifierProvider.family(
  (ref, genreId) => ItemViewModel(genreId: int.parse(genreId.toString())),
);

class ItemViewModel extends ChangeNotifier {
  List<ItemSectionModel>? _itemList;
  List<ItemSectionModel>? get itemList => _itemList;

  String _keyword = defaultKeyWord;
  String get keyword => _keyword;

  String _sortType = defaultSortType;
  String get sortType => _sortType;

  int _startIndex = 1;
  int get startIndex => _startIndex;

  int genreId;

  ItemViewModel({required this.genreId}) {
    load(genreId);
  }

  Future load(int genreId) async {
    OptionRequestModel params = OptionRequestModel(
      startIndex: _startIndex,
      genreId: genreId,
      keyword: _keyword,
      sortType: _sortType,
    );
    final response = await ItemApi.getData(params);
    _itemList = ItemListModel.fromJson(response).items;
    _startIndex = _startIndex + _itemList!.length;
    notifyListeners();
  }

  Future loadMore() async {
    List<ItemSectionModel> addList = [];

    OptionRequestModel params = OptionRequestModel(
      startIndex: _startIndex,
      genreId: genreId,
      keyword: _keyword,
      sortType: _sortType,
    );
    final response = await ItemApi.getData(params);
    addList = ItemListModel.fromJson(response).items;
    if (_itemList != null) {
      _itemList!.addAll(addList);
    }
    _startIndex = _startIndex + _itemList!.length ?? 0;
    notifyListeners();
  }

  Future setKeyword(String keyword) async {
    _itemList = [];
    _keyword = keyword;
    OptionRequestModel params = OptionRequestModel(
      startIndex: _startIndex,
      genreId: genreId,
      keyword: _keyword,
      sortType: _sortType,
    );
    final response = await ItemApi.getData(params);
    _itemList = ItemListModel.fromJson(response).items;
    notifyListeners();
  }

  Future setSortType(String sortType) async {
    _itemList = [];
    _sortType = sortType;
    OptionRequestModel params = OptionRequestModel(
      startIndex: _startIndex,
      genreId: genreId,
      keyword: _keyword,
      sortType: _sortType,
    );
    final response = await ItemApi.getData(params);
    _itemList = ItemListModel.fromJson(response).items;
    notifyListeners();
  }
}
