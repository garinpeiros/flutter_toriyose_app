import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:toriyose_app/component/molecules/star_rate.dart';
import 'package:toriyose_app/model/item_model.dart';
import 'package:transparent_image/transparent_image.dart';

class ItemCard extends StatelessWidget {
  final ItemModel item;
  const ItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        openBrowserTab(item.url);
      },
      child: itemColumn(item),
    );
  }

  Widget itemColumn(ItemModel item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 18.0 / 12.0,
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: item.thumbnailUrl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Color(0xFFD73C29),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 0.0),
              StarRate(
                reviewCount: item.reviewCount,
              ),
              const SizedBox(height: 1.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 4.0),
                    child: Column(
                      children: const <Widget>[],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "お値段　：￥" + item.price.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 9.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void openBrowserTab(String url) async {
  await FlutterWebBrowser.openWebPage(
    url: url,
    customTabsOptions: const CustomTabsOptions(
      toolbarColor: Color.fromARGB(255, 247, 85, 25),
      secondaryToolbarColor: Color.fromARGB(255, 247, 85, 25),
      navigationBarColor: Color.fromARGB(255, 247, 85, 25),
      addDefaultShareMenuItem: true,
      instantAppsEnabled: true,
      showTitle: true,
      urlBarHidingEnabled: true,
    ),
  );
}
