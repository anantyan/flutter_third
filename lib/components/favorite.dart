import 'package:flutter/material.dart';

class FavoriteButtonWidget extends StatefulWidget {
  const FavoriteButtonWidget({Key? key}) : super(key: key);

  @override
  State<FavoriteButtonWidget> createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
        color: Colors.red,
      )
    );
  }
}
