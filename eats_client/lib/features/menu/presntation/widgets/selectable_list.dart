import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_client/features/meal/domain/meal/meal.dart';
import 'package:eats_client/features/menu/domain/menu.dart';
import 'package:eats_client/features/menu/presntation/widgets/food_category.dart';
import 'package:eats_client/features/menu/presntation/widgets/meals_list.dart';
import 'package:eats_client/features/menu/providers/menu_providers.dart';
import 'package:eats_core/widgets/bottom_sheet/utils/sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectableAnimatedList extends ConsumerStatefulWidget {
  const SelectableAnimatedList({
    Key? key,
    required this.children,
    required this.menu,
  }) : super(key: key);
  final Menu menu;
  final List<FoodCategory> children;

  @override
  ConsumerState<SelectableAnimatedList> createState() =>
      _SelectableAnimatedListState();
}

class _SelectableAnimatedListState extends ConsumerState<SelectableAnimatedList>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late final List<Meal> meals;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(
        50.ms,
        () => ref
            .watch(MenuProviders.menuScreenControllerProvider)
            .onCategoryClick(widget.children[_selectedIndex].title));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: widget.children.map((e) {
              int index = widget.children.indexOf(e);
              return Padding(
                padding: EdgeInsets.only(
                    top: SpacingConst.spacing6.toDouble(),
                    left: SpacingConst.spacing8.toDouble(),
                    right: SpacingConst.spacing8.toDouble(),
                    bottom: SpacingConst.spacing16.toDouble()),
                child: GestureDetector(
                  onTap: () {
                    if (_selectedIndex != index) {
                      setState(() {
                        _animationController.forward(from: 0);
                        _selectedIndex = index;
                      });
                      ref
                          .read(MenuProviders.menuScreenControllerProvider)
                          .onCategoryClick(
                              widget.children[_selectedIndex].title);
                    }
                  },
                  child: FoodCategory(
                    title: e.title,
                    isSelected: index == _selectedIndex,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: SlideTransition(
            position: _slideAnimation,
            child: MealsList(
              category: widget.children[_selectedIndex].title,
            ),
          ),
        ),
      ],
    );
  }
}
