
import 'dart:convert';

import 'package:get/get.dart';

import '../api_providers/mock_provider.dart';
import '../models/data_state.dart';
import '../models/list_card.dart';

class HomeController extends GetxController{

    Rx<DataState<ListCard>> listCard = DataState<ListCard>.idle().obs;
    MockProvider mockProvider = MockProvider();


    fetchListCard() async {

        listCard.value = DataState.loading();
        Response response = await mockProvider.getListCard();
        if (response.statusCode == 200) {
            listCard.value = DataState.data(
                data: ListCard.fromJson(json.decode(response.body))
            );
        } else {
            listCard.value = DataState.error(
                massage: 'An Error occured while getting data'
            );
        }
    }


}