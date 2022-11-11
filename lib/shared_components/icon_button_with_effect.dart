import 'package:flutter/material.dart';

class IconButtonHoverWithEffect extends StatefulWidget {
  const IconButtonHoverWithEffect({
    Key? key,
    required this.icon,
    required this.size,
    required this.backgroundColor,
    required this.hoverColor,
    required this.onTap,
    this.iconColor = Colors.white,
  }) : super(key: key);
  final IconData icon;
  final double size;
  final Color backgroundColor;
  final Color hoverColor;
  final Color iconColor;
  final Function() onTap;

  @override
  State<IconButtonHoverWithEffect> createState() =>
      _IconButtonHoverWithEffectState();
}

class _IconButtonHoverWithEffectState extends State<IconButtonHoverWithEffect> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      onTap: widget.onTap,
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
          color: widget.iconColor,
          size: 20,
        ),
      ),
    );
  }
}
