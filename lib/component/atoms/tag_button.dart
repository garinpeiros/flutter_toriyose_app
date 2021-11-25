import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toriyose_app/provider/item_view_model.dart';

class TagButton extends StatelessWidget {
  final String tag;
  final int genreId;

  const TagButton({
    Key? key,
    required this.tag,
    required this.genreId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      return OutlineButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Text("#" + tag, style: const TextStyle(color: Colors.blue)),
        borderSide: const BorderSide(color: Colors.blue),
        onPressed: () {
          context.read(itemProvider(genreId)).setKeyword(tag);
          Navigator.of(context).pop();
        },
      );
    });
  }
}
