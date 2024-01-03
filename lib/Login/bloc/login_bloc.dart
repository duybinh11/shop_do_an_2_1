import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:shop_do_an_2_1/Api/ApiAuth.dart';
import 'package:shop_do_an_2_1/Model/ShopModel.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  ApiAuth apiAuth = ApiAuth();
  ShopModel? shopModel;
  LoginBloc() : super(LoginInitial()) {
    on<ELoginLogin>(login);
  }

  FutureOr<void> login(ELoginLogin event, Emitter<LoginState> emit) async {
    emit(SLoginLoading());
    ShopModel? shop = await apiAuth.login(event.email, event.password);
    if (shop != null) {
      shopModel = shop;
      emit(SLoginSuccess());
    } else {
      emit(SLoginFail());
    }
  }
}
