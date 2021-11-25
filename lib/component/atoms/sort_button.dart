import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toriyose_app/provider/item_view_model.dart';

class SortButton extends StatelessWidget {
  final String sortType;
  final String sortText;
  final int genreId;

  const SortButton({
    Key? key,
    required this.sortType,
    required this.sortText,
    required this.genreId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String nowSortType = '';

    return Consumer(
      builder: (context, watch, child) {
        ItemViewModel provider = watch(itemProvider(genreId));
        return RaisedButton(
          color: sortType == provider.sortType
              ? const Color.fromARGB(255, 247, 85, 25)
              : Colors.white,
          onPressed: () {
            context.read(itemProvider(genreId)).setSortType(sortType);
          },
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Text(
            sortText,
            style: TextStyle(
                color: sortType == provider.sortType
                    ? Colors.white
                    : Colors.black),
          ),
        );
      },
    );
  }
}
