
import 'dart:convert';

import 'package:get/get.dart';

class MockProvider extends GetConnect{

  MockProvider() {
    baseUrl = 'https://8b648f3c-b624-4ceb-9e7b-8028b7df0ad0.mock.pstmn.io/dishes';
  }

  getListCard() async {
    String url = '/v1';
    Response response = await get(url);
    return response;
  }

  getCardInfo(id) async {
    String url = '/v1/$id';
    Response response = await get(url);
    return response;
  }
}