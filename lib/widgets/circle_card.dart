import 'package:flutter/material.dart';
import '../constants/color_constant.dart';

class CricleCard extends StatelessWidget {
  const CricleCard({Key? key,required this.index,required this.text, required this.image}) : super(key: key);
  final int index;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 63,
      height: 63,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(63),
        color: Colors.white,
        border: Border.all(
          color: index == 0
              ? Colors.white
              : ColorConstant.orange,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizedBox(
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Stack(
              children: [
                Image.network(
                  image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.fill,
                ),
                Container(
                  color:
                  Colors.black.withOpacity(0.3),
                  child: Center(
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
