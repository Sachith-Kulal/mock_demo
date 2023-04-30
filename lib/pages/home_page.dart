import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_demo/constants/color_constant.dart';
import 'package:test_demo/constants/custom_enums.dart';
import 'package:test_demo/pages/detail_page.dart';

import '../controllers/home_controller.dart';
import '../widgets/bottom_button.dart';
import '../widgets/circle_card.dart';
import '../widgets/rating_view.dart';
import '../widgets/text_button.dart';

class HOME extends StatelessWidget {
  const HOME({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    homeController.fetchListCard();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: SvgPicture.asset(
                'assets/svg/arrow_back_icon.svg',
                width: 24,
                height: 24,
              ),
              onPressed: null),
          title: const Text('Select Dishes'),
        ),
        body: Obx(() {
          switch (homeController.listCard.value.type!) {
            case DataStateType.data:
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 42,
                        decoration: BoxDecoration(
                          color: ColorConstant.blackColor,
                          boxShadow: [
                            BoxShadow(
                              color: ColorConstant.white.withOpacity(0.28),
                              offset: const Offset(0, 4),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 21, left: 23, right: 23),
                        height: 63,
                        decoration: BoxDecoration(
                          color: ColorConstant.white,
                          boxShadow: const [
                            BoxShadow(
                              color: ColorConstant.whiteRed100,
                              offset: Offset(0, 1),
                              blurRadius: 4,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/date_icon.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text('21 May 2021')
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/time_icon.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text('21 May 2021')
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(23),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const [
                              TextButtonCustom(text: 'Italian'),
                              TextButtonCustom(text: 'Italian'),
                              TextButtonCustom(text: 'Indian'),
                              TextButtonCustom(text: 'Indian'),
                              TextButtonCustom(text: 'Indian'),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 21, bottom: 5),
                          child: const Text(
                            'Popular Dishes',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: 'Open Sans',
                              letterSpacing: 0.14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 63,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: homeController
                                .listCard.value.data!.popularDishes.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CricleCard(
                                  index: index,
                                  image: homeController.listCard.value.data!
                                      .popularDishes[index].image,
                                  text: homeController.listCard.value.data!
                                      .popularDishes[index].name);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 23, right: 23),
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return index == 0
                              ? const SizedBox()
                              : const Divider();
                        },
                        itemCount:
                            homeController.listCard.value.data!.dishes.length +
                                1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return SizedBox(
                              height: 22,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Recommended",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          height: 22 / 16,
                                          fontFamily: "Open Sans",
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SvgPicture.asset(
                                        'assets/svg/drop_dwon_ icon.svg',
                                        width: 7,
                                        height: 7,
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorConstant.blackColor,
                                      shadowColor: const Color(0x29000000),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                    child: const Text(
                                      'Menu',
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 8,
                                        letterSpacing: 0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          index--;
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 23),
                            width: 156,
                            height: 73,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            homeController.listCard.value.data!
                                                .dishes[index].name,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 10, left: 6),
                                            width: 8,
                                            height: 8,
                                            child: SvgPicture.asset(
                                              'assets/svg/vege_icon.svg',
                                            ),
                                          ),
                                          Rating(
                                              text: homeController
                                                  .listCard
                                                  .value
                                                  .data!
                                                  .dishes[index]
                                                  .rating)
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 9),
                                        child: Row(
                                          children: [
                                            ...homeController.listCard.value
                                                .data!.dishes[index].equipments
                                                .map((e) => Row(
                                                      children: [
                                                        SizedBox(
                                                          height: 23,
                                                          width: 23,
                                                          child: Column(
                                                            children: [
                                                              SvgPicture.asset(
                                                                'assets/svg/refrigerator_icon.svg',
                                                                height: 12,
                                                                width: 7,
                                                              ),
                                                              Text(
                                                                e,
                                                                textAlign: TextAlign.left,
                                                                style: const TextStyle(
                                                                  fontSize: 4,
                                                                  fontFamily: "Open Sans",
                                                                  letterSpacing: 0.08,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 8.5,
                                                        ),
                                                      ],
                                                    ))
                                                .toList(),
                                             Container(
                                              height: 10,
                                              width: 1,
                                               margin: const EdgeInsets.only(top: 6),
                                              child: const Divider(
                                                thickness: 24,
                                                color: ColorConstant.gray,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 15.5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Ingredients',
                                                    style: TextStyle(
                                                      fontSize: 6,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 0.12,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 2,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.to(const Detail());
                                                    },
                                                    child: Row(
                                                      children: const [
                                                        Text(
                                                          'View list',
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Open Sans',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 5,
                                                            height: 1.2,
                                                            letterSpacing: 0.1,
                                                            color: ColorConstant
                                                                .orange100,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          size: 3,
                                                          color:
                                                              Color(0xFFFF8800),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Flexible(child: Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          homeController.listCard.value.data!
                                              .dishes[index].description,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.normal,
                                              letterSpacing: 0.16,
                                              color: ColorConstant.gray100),
                                        ),
                                      ),)

                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                                Stack(
                                  children: [
                                    SizedBox(
                                      height: 60,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          'https://img.freepik.com/free-photo/top-view-delicious-corn-dog_23-2149387975.jpg',
                                          width: 92,
                                          height: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 50),
                                      //width: 314,
                                      height: 21,
                                      width: 92,
                                      child: Center(
                                        child: Stack(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                // Add your onPressed function here
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                shadowColor: Colors.black
                                                    .withOpacity(0.3),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  side: const BorderSide(
                                                    color: Colors.orange,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: const Text(
                                                'Add',
                                                style: TextStyle(
                                                  color: Colors.orange,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const Positioned(
                                              right: 3,
                                              child: Text(
                                                "+",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 10.0,
                                                  color: Color(0xFFFF8800),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              );
            case DataStateType.error:
              return Center(
                child: Text(homeController.listCard.value.massage!),
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
        bottomNavigationBar: const BottomButton());
  }

}
