import 'package:currencyapp/model/currency_model.dart';

abstract class HomeState {
  HomeState();
}

class HomeInitial extends HomeState {
  HomeInitial();
}

class HomeLoading extends HomeState {
  HomeLoading();
}

class HomeLoaded extends HomeState {
  List<CurrencyModel> currencyModel;
  HomeLoaded(this.currencyModel);
}

class HomeError extends HomeState {
  String error;
  HomeError(this.error);
}
