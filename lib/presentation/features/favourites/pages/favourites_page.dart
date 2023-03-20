import 'package:flutter/material.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  static const String navigationPath = '/favourites';

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.favourites.title),
      ),
      body: Center(child: Text(context.locale.favourites.title)),
    );
  }
}
