import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String title1;
  final String title2;
  final EdgeInsets padding;
  const CustomButton(
      {this.title1, this.title2, this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
/* Style of button */
    ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 18),
      primary: Colors.white,
      onPrimary: Colors.black,
      side: BorderSide(color: Colors.black, width: 1),
      padding: padding,
    );
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            style: style,
            child: Text(title1
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: style,
            child: Text(
              title2
            ),
          ),
        ],
      ),
    );
  }
}