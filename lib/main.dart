import 'package:flutter/material.dart';
import 'package:gridview_jump_example/page/gridview_image_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'GridView Jump Example';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.red),
        home: GridViewImagePage(),
      );
}
