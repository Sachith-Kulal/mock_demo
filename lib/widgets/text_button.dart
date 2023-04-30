import 'package:flutter/material.dart';

import '../constants/color_constant.dart';

class TextButtonCustom extends StatelessWidget {
  const TextButtonCustom({Key? key,required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorConstant.whiteRed,
            boxShadow: const [
              BoxShadow(
                color: ColorConstant.whiteRed,
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
            border: Border.all(
              color: ColorConstant.orange,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(text),
          ),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}
