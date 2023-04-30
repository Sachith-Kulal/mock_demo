import '../constants/custom_enums.dart';

class DataState<T>{

  T? data;
  DataStateType ? type;
  String? massage;

  DataState.data({this.data}) : type = DataStateType.data;

  DataState.error({this.massage}) : type = DataStateType.error;

  DataState.loading() : type = DataStateType.loading;

  DataState.idle() : type = DataStateType.idle;

}