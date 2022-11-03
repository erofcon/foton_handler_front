import 'package:flutter/material.dart';

class IconButtonHoverWithEffect extends StatefulWidget {
  const IconButtonHoverWithEffect(
      {Key? key,
      required this.icon,
      required this.size,
      required this.backgroundColor,
      required this.hoverColor})
      : super(key: key);
  final IconData icon;
  final double size;
  final Color backgroundColor;
  final Color hoverColor;

  @override
  State<IconButtonHoverWithEffect> createState() =>
      _IconButtonHoverWithEffectState();
}

class _IconButtonHoverWithEffectState extends State<IconButtonHoverWithEffect> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (val) {
        setState(() {
          isHover = val;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isHover ? widget.hoverColor : widget.backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        width: widget.size * 1.2,
        height: widget.size * 1.2,
        child: Icon(
          widget.icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
