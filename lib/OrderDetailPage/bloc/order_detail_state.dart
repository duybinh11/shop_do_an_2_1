// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_detail_bloc.dart';

@immutable
sealed class OrderDetailState {}

final class OrderDetailInitial extends OrderDetailState {}

final class SOrderDetailLoading extends OrderDetailState {}

final class SOrderDetailConfirmLoading extends OrderDetailState {}

final class SOrderDetailConfirmSuccess extends OrderDetailState {}

final class SOrderDetailErorr extends OrderDetailState {}

// ignore: must_be_immutable
class SOrderDetailData extends OrderDetailState {
  bool isPayment;
  AddressHistory address;
  UserModel userModel;
  SOrderDetailData(
      {required this.isPayment,
      required this.address,
      required this.userModel});
}

// ignore: must_be_immutable
class SOrderDetailUpdateAddressSuccess extends OrderDetailState {
  StatusTransport address;
  SOrderDetailUpdateAddressSuccess({
    required this.address,
  });
}
