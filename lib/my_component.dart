import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tak_blog/colors.dart';

class tehcDivider extends StatelessWidget {
  const tehcDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AllColors.colorDivider,
      indent: size.width / 5,
      thickness: 1.5,
      endIndent: size.width / 6,
    );
  }
}
