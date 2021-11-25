import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toriyose_app/component/atoms/tag_area.dart';
import 'package:toriyose_app/component/molecules/header_buttons.dart';
import 'package:toriyose_app/component/molecules/item_card.dart';
import 'package:toriyose_app/component/organisms/genre_dialog.dart';
import 'package:toriyose_app/model/item_model.dart';
import 'package:toriyose_app/provider/item_view_model.dart';

class FeedPage extends StatelessWidget {
  final int genreId;
  const FeedPage({
    Key? key,
    required this.genreId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePage(genreId: genreId);
  }
}

class HomePage extends StatefulWidget {
  final int genreId;
  const HomePage({Key? key, required this.genreId}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        ItemViewModel provider = watch(itemProvider(widget.genreId));

        if (provider.itemList != null) {
          return Scaffold(
            body: Column(
              children: <Widget>[
                HeaderButtons(genreId: widget.genreId),
                if (provider.keyword != null)
                  TagArea(tagName: provider.keyword),
                Expanded(
                  child: gridItemView(provider.itemList),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => GenreDialog(
                    genreId: widget.genreId,
                  ),
                );
              },
              child: const Icon(Icons.search),
              backgroundColor: Colors.pink,
            ),
          );
        } else {
          return Container(
            alignment: Alignment.center,
            child: const Text('商品がありません'),
          );
        }
      },
    );
  }

  ///
  /// GridView
  ///
  Widget gridItemView(List<ItemSectionModel>? list) {
    if (list == null) return Container();
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemCard(
          item: list[index].item,
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      context.read(itemProvider(widget.genreId)).loadMore();
      //_postBloc.add(Fetch(genreId: widget.genreId, keyword: ''));
    }
  }
}
