import 'package:flutter/material.dart';

import 'myColors.dart';

class Mybutton extends StatefulWidget {
  final String title;
  final bgcolor;
  final fgcolor;
  final icon;
  final isOutline;
  final onPress;
  const Mybutton({
    super.key,
    required this.title,
    this.bgcolor = MyColors.primaryGreen,
    this.fgcolor = MyColors.primaryGreen,
    this.icon,
    this.isOutline = false,
    required this.onPress,
  });

  @override
  State<Mybutton> createState() => _MybuttonState();
}

class _MybuttonState extends State<Mybutton> {
  @override
  Widget build(BuildContext context) {
    if (widget.icon != null && !widget.isOutline && widget.title != '') {
      return SizedBox(
        height: 45,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.bgcolor,
            padding: EdgeInsets.symmetric(horizontal: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: widget.onPress,
          icon: Icon(widget.icon),
          label: Text(
            '${widget.title}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    if (widget.icon == null && !widget.isOutline) {
      return SizedBox(
        height: 45,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.bgcolor,
            padding: EdgeInsets.symmetric(horizontal: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: widget.onPress,
          child: Text(
            '${widget.title}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    if (widget.icon == null && widget.isOutline) {
      return SizedBox(
        height: 45,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: widget.bgcolor,
            side: BorderSide(color: widget.bgcolor),
            padding: EdgeInsets.symmetric(horizontal: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: widget.onPress,
          child: Text(
            '${widget.title}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: widget.fgcolor,
            ),
          ),
        ),
      );
    }
    if (widget.icon != null && widget.isOutline) {
      return SizedBox(
        height: 45,
        child: OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            foregroundColor: widget.fgcolor,
            side: BorderSide(color: widget.bgcolor),
            padding: EdgeInsets.symmetric(horizontal: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: widget.onPress,
          icon: Icon(widget.icon),
          label: Text(
            '${widget.title}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    if (widget.title == '' && widget.icon != null) {
      return SizedBox(
        height: 45,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.bgcolor,
            padding: EdgeInsets.symmetric(horizontal: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: widget.onPress,
          child: Icon(widget.icon),
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
