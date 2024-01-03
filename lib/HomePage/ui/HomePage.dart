import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_do_an_2_1/HomePage/bloc/home_bloc.dart';
import 'package:shop_do_an_2_1/HomePage/ui/ItemOrderCustom.dart';
import 'package:shop_do_an_2_1/Login/bloc/login_bloc.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/HomePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    int idShop = context.read<LoginBloc>().shopModel!.id;
    context.read<HomeBloc>().add(EHomegetOrder(idShop: idShop));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SHomeGetOrderLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is SHomeGetOrderGetOrder) {
            return RefreshIndicator(
              onRefresh: () => Future.sync(() {
                int idShop = context.read<LoginBloc>().shopModel!.id;
                context.read<HomeBloc>().add(EHomegetOrder(idShop: idShop));
              }),
              child: ListView.builder(
                itemCount: state.listOrder.length,
                itemBuilder: (context, index) =>
                    ItemOrderCustom(itemOrder: state.listOrder[index]),
              ),
            );
          }
          return const Text('null');
        },
      ),
    );
  }
}
