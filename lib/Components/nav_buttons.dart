import 'package:flutter/material.dart';



class NavigationButtons extends StatefulWidget {
  VoidCallback leftButtonPressed;
  int currentPage;
  VoidCallback rightButtonPressed;

  NavigationButtons({Key key,@required this.leftButtonPressed,@required this.currentPage,
      @required this.rightButtonPressed});

  @override
  _NavigationButtonsState createState() => _NavigationButtonsState();
}

class _NavigationButtonsState extends State<NavigationButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 20,
          color: Colors.grey.shade700,
          onPressed: () {
            widget.leftButtonPressed();
          },
        ),
        Text("${widget.currentPage}"),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          iconSize: 20,
          color: Colors.grey.shade700,
          onPressed: () {
            widget.rightButtonPressed();
          },
        ),
      ],
    );;
  }
}
