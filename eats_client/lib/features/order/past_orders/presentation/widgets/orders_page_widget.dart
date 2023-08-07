import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:eats_client/features/order/domain/order.dart';
import 'package:eats_client/features/order/past_orders/presentation/widgets/builtin_transformers.dart';
import 'package:eats_client/features/order/past_orders/presentation/widgets/order_card.dart';
import 'package:eats_client/features/order/past_orders/providers/past_orders_providers.dart';
import 'package:eats_client/widgets/selected_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersPageWidget extends ConsumerWidget {
  const OrdersPageWidget({
    super.key,
    required this.ordersList,
  });

  final List<Order> ordersList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          top: -150.h,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: TransformerPageView(
              itemCount: ordersList.length,
              pageController: TransformerPageController(itemCount: ordersList.length),
              loop: true,
              curve: Curves.elasticIn,
              transformer: ScaleAndFadeTransformer(fade: 0.0, scale: 2),
              onPageChanged: (value) =>
                  ref.read(PastOrdersProviders.currentPageIndexProvider.notifier).state = value ?? 0,
              itemBuilder: (context, index) {
                return OrderCard(order: ordersList[index]);
              },
            ),
          ),
        ),
        Positioned(
          bottom: 140.h,
          child: Consumer(builder: (context, ref, _) {
            return SelectedIndicator(
                selected: ref.watch(PastOrdersProviders.currentPageIndexProvider), count: ordersList.length);
          }),
        ),
      ],
    );
  }
}
