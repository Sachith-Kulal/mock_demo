import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:test_demo/constants/color_constant.dart';
import 'package:test_demo/controllers/detail_controller.dart';
import 'package:test_demo/widgets/rating_view.dart';

import '../constants/custom_enums.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailController detailController = Get.find<DetailController>();
    detailController.fetchCardInfo();
    return Scaffold(
      body: Obx(() {
        switch (detailController.cardInfo.value.type!) {
          case DataStateType.data:
            String vegetablesCount = detailController
                        .cardInfo.value.data!.ingredients.vegetables.length >
                    10
                ? detailController
                    .cardInfo.value.data!.ingredients.vegetables.length
                    .toString()
                : '0${detailController.cardInfo.value.data!.ingredients.vegetables.length}';
            String spicesCount = detailController
                        .cardInfo.value.data!.ingredients.vegetables.length >
                    10
                ? detailController
                    .cardInfo.value.data!.ingredients.spices.length
                    .toString()
                : '0${detailController.cardInfo.value.data!.ingredients.spices.length}';
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: IconButton(
                    icon: SvgPicture.asset(
                      'assets/svg/arrow_back_icon.svg',
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                SliverStack(children: [
                  const SliverPositioned(
                    bottom: 35,
                    //top: 100.0,
                    left: 0.0,
                    right: 0.0,
                    child: SizedBox(
                      height: 3,
                      //color: ColorConstant.gray,
                      child: Divider(
                        thickness: 3,
                        color: ColorConstant.gray,
                      ),
                    ),
                  ),
                  SliverPositioned(
                    right: 0,
                    top: 10,
                    child: SizedBox(
                      height: 220,
                      width: 250,
                      child: Image.asset(
                        'assets/png/vegetables.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SliverPositioned(
                    bottom: -30,
                    left: 0,
                    child: Container(
                      margin: const EdgeInsets.only(left: 23,right: 23),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Ingredients',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: 0.16,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            child: const Text(
                              "For 2 people",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.normal,
                                height: 1.7,
                                color: Color(0xff8a8a8a),
                                fontFamily: "Open Sans",
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.only(left: 23, right: 23, top: 23),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      detailController
                                          .cardInfo.value.data!.name,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 0,
                                        color: Color(0xFF242424),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12.5,
                                    ),
                                    const Rating(text: 4.3),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 100, top: 4),
                                  child: const Text(
                                    'Mughlai Masala is a style of cookery developed in the Indian Subcontinent by the imperial kitchens of the Mughal Empire.',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.normal,
                                      height: 1.57,
                                      letterSpacing: 0.16,
                                      color: Color(0xFFA3A3A3),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 26),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/hr_icon.svg',
                                        width: 12,
                                        height: 12,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 7.71),
                                        child: Text(
                                          detailController.cardInfo.value.data!
                                              .timeToPrepare,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10,
                                            height: 1.4,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(left: 23,right: 23,top: 40),
                    child: Column(
                      children: [
                        const Divider(
                          thickness: 2,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 14,bottom: 10),
                          child: Row(
                            children: [
                              Text(
                                'Vegetables ($vegetablesCount)',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  height: 1.0,
                                  letterSpacing: 0.0,
                                  color: Color(0xff242424),
                                ),
                              ),
                              const SizedBox(
                                width: 16.2,
                              ),
                              SvgPicture.asset(
                                'assets/svg/drop_dwon_ icon.svg',
                                width: 7,
                                height: 7,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8, left: 23, right: 23),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            addText(detailController.cardInfo.value.data!
                                .ingredients.vegetables[index].name),
                            addText(detailController.cardInfo.value.data!
                                .ingredients.vegetables[index].quantity),
                          ],
                        ),
                      );
                    },
                    childCount: detailController
                        .cardInfo.value.data!.ingredients.vegetables.length,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 23, right: 23, top: 14,bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          'Spices ($spicesCount)',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            height: 1.0,
                            letterSpacing: 0.0,
                            color: Color(0xff242424),
                          ),
                        ),
                        const SizedBox(
                          width: 16.2,
                        ),
                        SvgPicture.asset(
                          'assets/svg/drop_dwon_ icon.svg',
                          width: 7,
                          height: 7,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(left: 23, right: 23,bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            addText(detailController.cardInfo.value.data!
                                .ingredients.spices[index].name),
                            addText(detailController.cardInfo.value.data!
                                .ingredients.spices[index].quantity),
                          ],
                        ),
                      );
                    },
                    childCount: detailController
                        .cardInfo.value.data!.ingredients.spices.length,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 14, left: 23, right: 23, bottom: 16),
                    child: const Text(
                      'Appliances',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 23),
                    height: 95.0,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: detailController
                          .cardInfo.value.data!.ingredients.appliances.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            width: 72.0,
                            height: 95.0,
                            decoration: BoxDecoration(
                              color: ColorConstant.white200,
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 21, left: 21, top: 14),
                                  child: detailController
                                          .cardInfo
                                          .value
                                          .data!
                                          .ingredients
                                          .appliances[index]
                                          .image
                                          .isEmpty
                                      ? Image.asset(
                                          'assets/png/refrigerator_large.png',
                                          fit: BoxFit.fill,
                                          width: 30,
                                          height: 55,
                                        )
                                      : Image.network(
                                          'https://img.freepik.com/free-photo/top-view-delicious-corn-dog_23-2149387975.jpg',
                                          width: 30,
                                          height: 55,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                const Text(
                                  'Refrigerator',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.normal,
                                    height: 11.0 / 8.0,
                                    // Set line height using font size and line height ratio
                                    letterSpacing: 0.0,
                                    color: ColorConstant.blackColor100,
                                  ),
                                ),
                              ],
                            ));
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          Container(
                        width: 21,
                      ),
                    ),
                  ),
                ),
              ],
            );
          case DataStateType.error:
            return Center(
              child: Text(detailController.cardInfo.value.massage!),
            );
          case DataStateType.loading:
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                strokeWidth: 5,
              ),
            );
          case DataStateType.idle:
            return const SizedBox();
        }
      }),
    );
  }

  addText(text) => Text(
        text,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 10.0,
          fontWeight: FontWeight.normal,
          height: 1.4,
          letterSpacing: 0.0,
        ),
      );
}
