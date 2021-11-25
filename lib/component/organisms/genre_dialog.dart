import 'package:flutter/material.dart';
import 'package:toriyose_app/component/atoms/tag_button.dart';
import 'package:toriyose_app/config/constant.dart';

class GenreDialog extends StatelessWidget {
  final int genreId;

  const GenreDialog({
    Key? key,
    required this.genreId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: SizedBox(
        height: 300.0,
        width: 400.0,
        child: Column(
          children: _listMyWidgets(
            genreId,
          ),
        ),
      ),
    );
  }

  List<Widget> _listMyWidgets(int genreId) {
    List<Widget> row = [];
    List<Widget> list = [];
    List<String>? tags = tagList[genreId];
    int cnt = 0;
    if (tags != null) {
      for (String tag in tags) {
        list.add(TagButton(
          tag: tag,
          genreId: this.genreId,
        ));
        cnt++;
        if (cnt % 2 == 0) {
          row.add(Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: list,
          ));
          list = [];
        }
      }
    }
    return row;
  }
}
