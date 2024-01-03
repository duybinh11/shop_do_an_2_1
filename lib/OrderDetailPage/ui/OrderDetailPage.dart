import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_do_an_2_1/Model/ItemOrderModel.dart';
import 'package:shop_do_an_2_1/Model/StatusTransport.dart';
import 'package:shop_do_an_2_1/OrderDetailPage/bloc/order_detail_bloc.dart';
import 'package:shop_do_an_2_1/OrderDetailPage/ui/ItemOrderStateCustom.dart';

import 'OrderDetailBottom.dart';
import 'StateAddressCustom.dart';
import 'UserCustom.dart';

class OrderDetailPage extends StatefulWidget {
  static const String routeName = '/OrderDetailPage';
  const OrderDetailPage({super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  late ItemOrderModel itemOrderModel;
  @override
  void didChangeDependencies() {
    Map<String, dynamic> mapData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    itemOrderModel = mapData['order'];
    context
        .read<OrderDetailBloc>()
        .add(EOrderDetailGetData(idOrder: itemOrderModel.id));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chi tiet don hang')),
      body: BlocConsumer<OrderDetailBloc, OrderDetailState>(
        listener: (context, state) {},
        buildWhen: (previous, current) {
          if (current is SOrderDetailLoading) {
            return true;
          }
          if (current is SOrderDetailErorr) {
            return true;
          }
          if (current is SOrderDetailData) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is SOrderDetailErorr) {
            return const Text('erorr');
          }
          if (state is SOrderDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is SOrderDetailData) {
            return Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemOrderStateCustom(
                      itemOrder: itemOrderModel, statePayment: state.isPayment),
                  const SizedBox(
                    height: 10,
                  ),
                  UserCustom(
                      address: state.address, userModel: state.userModel),
                  const SizedBox(
                    height: 5,
                  ),
                  StateAddressCustom(itemOrderModel: itemOrderModel)
                ],
              ),
              bottomNavigationBar:
                  OrderDetailBottom(orderModel: itemOrderModel),
            );
          }
          return const Text('null');
        },
      ),
    );
  }
}
