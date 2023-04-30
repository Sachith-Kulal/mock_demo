import 'dart:convert';

import 'package:get/get.dart';
import 'package:test_demo/models/card_info.dart';

import '../api_providers/mock_provider.dart';
import '../models/data_state.dart';

class DetailController extends GetxController{
  Rx<DataState<CardInfo>> cardInfo = DataState<CardInfo>.idle().obs;
  MockProvider mockProvider = MockProvider();


  fetchCardInfo() async {

    cardInfo.value = DataState.loading();
    Response response = await mockProvider.getCardInfo(1);
    if (response.statusCode == 200) {
      cardInfo.value = DataState.data(
          data: CardInfo.fromJson(json.decode(response.body))
      );
    } else {
      cardInfo.value = DataState.error(
          massage: 'An Error occured while getting data'
      );
    }
  }
}