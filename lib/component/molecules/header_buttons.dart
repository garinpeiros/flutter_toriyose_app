import 'package:flutter/material.dart';
import 'package:toriyose_app/component/atoms/sort_button.dart';

class HeaderButtons extends StatelessWidget {
  final int genreId;
  const HeaderButtons({
    Key? key,
    required this.genreId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Spacer(flex: 1),
        SortButton(
          genreId: genreId,
          sortType: '-reviewCount',
          sortText: 'レビュー順',
        ),
        const Spacer(flex: 1),
        SortButton(
          genreId: genreId,
          sortType: '-itemPrice',
          sortText: 'オススメ順',
        ),
        const Spacer(flex: 1),
        SortButton(
          genreId: genreId,
          sortType: '-updateTimestamp',
          sortText: '新着順',
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}
