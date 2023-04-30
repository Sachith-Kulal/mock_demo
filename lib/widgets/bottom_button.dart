import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/color_constant.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 40,
      margin: const EdgeInsets.only(bottom: 25, left: 60, right: 60),
      decoration: BoxDecoration(
        color: ColorConstant.blackColor,
        boxShadow: const [
          BoxShadow(
            color: ColorConstant.blackColor900,
            offset: Offset(0, 3),
            blurRadius: 9,
          ),
        ],
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/svg/cart_icon.svg',
                width: 20,
                height: 20,
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                '3 food items selected',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  letterSpacing: 0.12,
                  color: ColorConstant.white,
                ),
              )
            ],
          ),
          const Icon(
            Icons.arrow_forward,
            size: 25,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
