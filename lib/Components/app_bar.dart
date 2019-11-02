import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('News app'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {Navigator.of(context).pushNamed('/search');},
        ),
        IconButton(
          icon: Icon(Icons.tune),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56);
}
