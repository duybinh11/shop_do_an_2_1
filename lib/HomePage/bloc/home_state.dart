// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class SHomeGetOrderLoading extends HomeState {}

// ignore: must_be_immutable
class SHomeGetOrderGetOrder extends HomeState {
  List<ItemOrderModel> listOrder;
  SHomeGetOrderGetOrder({
    required this.listOrder,
  });
}
