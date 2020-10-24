import 'package:flutter/material.dart';

import '../main.dart';

class GridViewImagePage extends StatefulWidget {
  @override
  _GridViewImagePageState createState() => _GridViewImagePageState();
}

class _GridViewImagePageState extends State<GridViewImagePage> {
  final images = [
    'https://images.unsplash.com/photo-1440589473619-3cde28941638?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1487222477894-8943e31ef7b2?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1499229694635-fc626e0d9c01?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1525186402429-b4ff38bedec6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80',
    'https://images.unsplash.com/photo-1506277886164-e25aa3f4ef7f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=375&q=80',
    'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
    'https://images.unsplash.com/photo-1497551060073-4c5ab6435f12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80',
    'https://images.unsplash.com/photo-1482849297070-f4fae2173efe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80',
    'https://images.unsplash.com/photo-1527203561188-dae1bc1a417f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80',
    'https://images.unsplash.com/photo-1488820098099-8d4a4723a490?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
    'https://images.unsplash.com/photo-1497551060073-4c5ab6435f12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80',
    'https://images.unsplash.com/photo-1482849297070-f4fae2173efe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80',
    'https://images.unsplash.com/photo-1527203561188-dae1bc1a417f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80',
    'https://images.unsplash.com/photo-1488820098099-8d4a4723a490?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60',
  ];

  final controller = ScrollController();
  static const double padding = 16;
  static const double spacing = 8;
  static const int crossAxisCount = 2;
  int item = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(MyApp.title),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                item = item - 1 < 0 ? item : item - 1;
                jumpToItem(item);
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                item = item + 1 >= newItemCount ? item : item + 1;
                jumpToItem(item);
              },
            ),
          ],
        ),
        body: buildGridView(),
      );

  get newItemCount => (images.length / crossAxisCount).round();

  void jumpToItem(int item) {
    final width = controller.position.maxScrollExtent +
        context.size.width -
        padding * 2 +
        spacing;
    final value = item / newItemCount * width;
    final valueSpace = padding + value;
    final newValue = valueSpace > controller.position.maxScrollExtent
        ? controller.position.maxScrollExtent
        : valueSpace;
    controller.jumpTo(newValue);
  }

  Widget buildGridView() => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: 2 / 1,
          mainAxisSpacing: spacing,
          crossAxisSpacing: spacing,
        ),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(padding),
        itemCount: images.length,
        controller: controller,
        itemBuilder: (context, index) {
          final item = images[index];

          return buildImage(item);
        },
      );

  Widget buildImage(String url) => ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Container(
          padding: EdgeInsets.all(2),
          color: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.network(url, fit: BoxFit.cover),
          ),
        ),
      );
}
