import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_demo/constants/color_constant.dart';

class Rating extends StatelessWidget {
  const Rating({Key? key, required this.text}) : super(key: key);

  final double text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 27),
      width: 25.0,
      height: 10.0,
      decoration: BoxDecoration(
        color: ColorConstant.green,
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '$text',
              style: const TextStyle(
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600,
                fontSize: 6,
                height: 1.33,
                letterSpacing: 0.12,
                color: ColorConstant.white,
              ),
            ),
            SvgPicture.asset(
              'assets/svg/star.svg',
            ),
          ],
        ),
      ),
    );
  }
}
