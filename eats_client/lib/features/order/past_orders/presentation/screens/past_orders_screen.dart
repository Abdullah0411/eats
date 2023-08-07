import 'package:eats_client/features/order/past_orders/presentation/widgets/loading_widget.dart';
import 'package:eats_client/features/order/past_orders/presentation/widgets/no_orders_found_alert_widget.dart';
import 'package:eats_client/features/order/past_orders/presentation/widgets/orders_page_widget.dart';
import 'package:eats_client/features/order/past_orders/providers/past_orders_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PastOrdersScreen extends ConsumerStatefulWidget {
  const PastOrdersScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PastOrdersScreenState();
}

class _PastOrdersScreenState extends ConsumerState<PastOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Past Orders", style: Theme.of(context).textTheme.titleMedium),
      ),
      body: ref.watch(PastOrdersProviders.ordersListProvider).maybeWhen(
            skipLoadingOnRefresh: true,
            skipLoadingOnReload: true,
            data: (ordersList) => OrdersPageWidget(ordersList: ordersList),
            orElse: () => const NoOrdersFoundAlertWidget(),
            loading: () => const LoadingWidget(),
          ),
    );
  }
}
