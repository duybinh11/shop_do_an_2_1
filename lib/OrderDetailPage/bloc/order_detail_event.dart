// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_detail_bloc.dart';

abstract class OrderDetailEvent {}

class EOrderDetailGetData extends OrderDetailEvent {
  int idOrder;
  EOrderDetailGetData({
    required this.idOrder,
  });
}

class EOrderDetailConfirmShop extends OrderDetailEvent {
  int idOrder;
  EOrderDetailConfirmShop({
    required this.idOrder,
  });
}

class EOrderDetailUpdateAddress extends OrderDetailEvent {
  int idOrder;
  String place;
  EOrderDetailUpdateAddress({required this.idOrder, required this.place});
}
