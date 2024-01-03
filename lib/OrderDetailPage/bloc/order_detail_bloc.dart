import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_do_an_2_1/Api/ApiItem.dart';
import 'package:shop_do_an_2_1/Model/AddressHistory.dart';
import 'package:shop_do_an_2_1/Model/StatusTransport.dart';
import 'package:shop_do_an_2_1/Model/UserModel.dart';

part 'order_detail_event.dart';
part 'order_detail_state.dart';

class OrderDetailBloc extends Bloc<OrderDetailEvent, OrderDetailState> {
  ApiItem apiItem = ApiItem();
  OrderDetailBloc() : super(OrderDetailInitial()) {
    on<EOrderDetailGetData>(getStatePayment);
    on<EOrderDetailConfirmShop>(confirmOrder);
    on<EOrderDetailUpdateAddress>(updateAddress);
  }

  FutureOr<void> getStatePayment(
      EOrderDetailGetData event, Emitter<OrderDetailState> emit) async {
    emit(SOrderDetailLoading());
    Map<String, dynamic> mapData = await apiItem.getDataOrder(event.idOrder);
    print(mapData);
    UserModel userModel = UserModel.fromMap(mapData['user_model']);
    AddressHistory addressReceive =
        AddressHistory.fromMap(mapData['address_receive']);
    bool statePayment = mapData['state_payment'] == 0 ? false : true;
    emit(SOrderDetailData(
        isPayment: statePayment,
        address: addressReceive,
        userModel: userModel));
  }

  FutureOr<void> confirmOrder(
      EOrderDetailConfirmShop event, Emitter<OrderDetailState> emit) async {
    emit(SOrderDetailConfirmLoading());
    bool check = await apiItem.confirmOrder(event.idOrder);
    check ? emit(SOrderDetailConfirmSuccess()) : null;
  }

  FutureOr<void> updateAddress(
      EOrderDetailUpdateAddress event, Emitter<OrderDetailState> emit) async {
    StatusTransport? address =
        await apiItem.updateAddress(event.idOrder, event.place);
    address != null
        ? emit(SOrderDetailUpdateAddressSuccess(address: address))
        : null;
  }
}
