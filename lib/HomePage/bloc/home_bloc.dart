import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_do_an_2_1/Api/ApiItem.dart';
import 'package:shop_do_an_2_1/Model/ItemOrderModel.dart';

import '../../OrderDetailPage/bloc/order_detail_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  ApiItem apiItem = ApiItem();
  HomeBloc() : super(HomeInitial()) {
    on<EHomegetOrder>(getOrder);
  }

  FutureOr<void> getOrder(EHomegetOrder event, Emitter<HomeState> emit) async {
    emit(SHomeGetOrderLoading());
    List<ItemOrderModel> listOrder = await apiItem.getOrder(event.idShop);
    emit(SHomeGetOrderGetOrder(listOrder: listOrder));
  }
}
