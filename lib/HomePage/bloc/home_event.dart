// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeEvent {}

class EHomegetOrder extends HomeEvent {
  int idShop;
  EHomegetOrder({
    required this.idShop,
  });
}
