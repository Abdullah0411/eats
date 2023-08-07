import 'package:flutter/material.dart';
export 'package:flutter_animate/flutter_animate.dart';
export 'package:sprung/sprung.dart';

/// A widget that can be used a wrapper to the Scaffold to handle Cupertino bottom sheets
class Sheet extends StatelessWidget {
  const Sheet(
      {Key? key,
      this.child,
      this.children,
      this.footer,
      this.appBar,
      this.scroll = true,
      this.isFullScreen = false,
      this.title,
      this.bottomSheet,
      this.floatingActionButton,
      this.backgroundColor})
      : assert(child == null || children == null, "child/children must not be null"),
        super(key: key);

  /// A widget that will be displayed in the top of the sheet (If you passed an [appBar] the [title] will be ignored)
  final AppBar? appBar;

  /// Sheet title, will be displayed in the top of the sheet
  final String? title;

  /// The  Widget body of the sheet (You can pass a one Widget using [child] or List of Widgets using [children])
  final Widget? child;

  /// The lit of Widgets body of the sheet
  final List<Widget>? children;

  /// A footer is a list of widgets that will be displayed in the bottom of the sheet, usually action buttons such as [Save] or [Delete]
  final List<Widget>? footer;

  final Widget? bottomSheet;

  /// Is this sheet scrollable or not?
  final bool scroll;

  final bool isFullScreen;

  final Color? backgroundColor;

  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    final Widget body = children != null ? Column(children: children!) : child!;

    return Scaffold(
      appBar: appBar ??
          (title != null
              ? AppBar(
                  title: Text(
                    '$title',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                )
              : null),
      body: SingleChildScrollView(
        physics: scroll ? null : const NeverScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: body,
          ),
        ),
      ),
      floatingActionButton: floatingActionButton,
      bottomSheet: bottomSheet,
      backgroundColor: backgroundColor,
      persistentFooterButtons: footer != null
          ? [
              Center(
                  child: Column(
                children: footer!,
              ))
            ]
          : null,
    );
  }
}
