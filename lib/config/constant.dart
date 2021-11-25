import 'package:flutter/material.dart';

const serverApiUrl = 'https://app.rakuten.co.jp/';
const appId = "";
const affiliateId = "";

const String defaultKeyWord = 'お取り寄せ';

const String defaultSortType = "-updateTimestamp";

const int defaultLimit = 20;

const List<Tab> genreTabs = <Tab>[
  Tab(text: 'お肉'),
  Tab(text: 'スイーツ'),
  Tab(text: 'お海鮮'),
  Tab(text: 'ドリンク'),
];

const List<int> genreIds = <int>[100228, 100283, 100236, 100316];

const Map<int, List<String>> tagList = <int, List<String>>{
  100228: [
    "お取り寄せ",
    "牛肉",
    "ホルモン",
    "馬肉",
    "ソーセージ",
    "もつ鍋",
    "ラム肉",
    "A5",
    "肉まん",
    "母の日",
    "父の日",
  ],
  100283: [
    "お取り寄せ",
    "チョコ",
    "プリン",
    "ワッフル",
    "チーズ",
    "和菓子",
    "アイス",
    "父の日",
    "母の日",
  ],
  100236: [
    "お取り寄せ",
    "うなぎ",
    "明太子",
    "タラバガニ",
    "イクラ",
    "カツオ",
    "マグロ",
    "母の日",
    "父の日",
  ],
  100316: [
    "お取り寄せ",
    "抹茶",
    "ほうじ茶",
    "コーヒー",
    "果汁",
    "紅茶",
    "天然水",
    "母の日",
    "父の日",
  ],
};
