import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eats_client/features/cart/presntation/widgets/cart_item.dart';
import 'package:eats_client/features/meal/domain/quantity_meal/quantity_meal.dart';
import 'package:eats_client/features/menu/providers/menu_providers.dart';

class AnimatedCartList extends ConsumerStatefulWidget {
  const AnimatedCartList({super.key, required this.meals});
  final List<QuantityMeal> meals;
  @override
  ConsumerState<AnimatedCartList> createState() => _AnimatedCartListState();
}

class _AnimatedCartListState extends ConsumerState<AnimatedCartList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void _removeItem(int index) {
    QuantityMeal removedMeal = widget.meals[index];
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => _buildItem(removedMeal, animation),
    );
  }

  Widget _buildItem(QuantityMeal meal, Animation<double> animation) {
    return SizeTransition(
        sizeFactor: animation,
        child: CartItem(
          meal: meal,
          onPress: () {
            ref
                .read(MenuProviders.menuScreenControllerProvider)
                .removeMealFromCart(meal.id);
            _removeItem(widget.meals.indexOf(meal));
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: widget.meals.length,
      itemBuilder: (context, index, animation) {
        return _buildItem(widget.meals[index], animation);
      },
    );
  }
}
