import 'package:flutter/material.dart';

import 'color_item.dart';

class DialogBackGroundColors extends StatelessWidget {
  DialogBackGroundColors({Key? key, required this.activeColorCode})
      : super(key: key);
  final int activeColorCode;
  final List<int> _colorCode = [
    0XFFEF6C00,
    0XFFF8BBD0,
    0XFFF06292,
    0XFF009688,
    0XFFBC6FF1,
    0XFFD50000,
    0XFF03A9F4,
    0XFF8FBC8F,
    0XFFFA8072,
    0XFF9CCC65,
    0XFFFFAB00,
    0XFF48c9b0,
    0XFFBDBDBD,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:MediaQuery.sizeOf(context).height*0.05,
      child: ListView.separated(
        physics:const BouncingScrollPhysics(),
        scrollDirection:Axis.horizontal,
          itemBuilder: (context,index)=>ColorItem(
            index:index,
            colorCode:_colorCode,
            activeColorCode:activeColorCode,
          ),
          separatorBuilder:(context,index)=>SizedBox(width:MediaQuery.sizeOf(context).width*0.015),
          itemCount: _colorCode.length,
      ),
    );
  }
}
