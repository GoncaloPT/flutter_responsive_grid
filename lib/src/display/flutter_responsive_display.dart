import 'package:flutter/widgets.dart';
import 'package:flutter_responsive_grid/flutter_responsive_grid.dart';

/// Utility widget class to be used by concrete visibility implementations
/// Constructor is transitive for null values, inheriting from lower to higher
/// viewport sizes
abstract class _VisibilityWidget extends StatelessWidget {
  final Widget child;
  final bool xs;
  final bool sm;
  final bool md;
  final bool lg;
  final bool xl;

  final sizes = <bool>[];

  _VisibilityWidget(this.child,
      {this.xs = true, this.sm, this.md, this.lg, this.xl})
      : assert(child != null) {
    this.sizes.addAll([xs, sm, md, lg, xl]);
    for (var i = 1; i < sizes.length; i++) {
      sizes[i] ??= sizes[i - 1];
    }
  }
}

class Display extends _VisibilityWidget {
  /// Constructor.
  /// Display in transitive from lower to higher viewport
  /// This means that if no value is passed to a specific viewport size, it
  /// will inherit from the previous(smaller) viewport size
  Display(Widget child, {bool xs, bool sm, bool md, bool lg, bool xl})
      : super(child, xs: xs, sm: sm, md: md, lg: lg, xl: xl);

  @override
  Widget build(BuildContext context) {
    ScreenSize size = GridSystemUtils.findCurrentScreenSize(context);
    if (sizes[size.index]) {
      return child;
    }
    return Container();
  }

  /// Child is displayed in all viewport sizes
  Display.all(Widget child) : super(child, xs: true);

  /// Child is displayed in all viewport sizes, alias for all
  Display.block(Widget child) : super(child, xs: true);
}

/// Based on https://getbootstrap.com/docs/4.0/utilities/display/
/// Hidden is transitive from lower to higher viewport
/// This means that if no value is passed to a specific viewport size, it
/// will inherit from the previous(smaller) viewport size
class Hidden extends _VisibilityWidget {
  /// Constructor.
  Hidden(Widget child, {bool xs, bool sm, bool md, bool lg, bool xl})
      : super(child, xs: xs, sm: sm, md: md, lg: lg, xl: xl);

  @override
  Widget build(BuildContext context) {
    ScreenSize size = GridSystemUtils.findCurrentScreenSize(context);
    if (!sizes[size.index]) {
      return child;
    }
    return Container();
  }

  /// Child is displayed in xs and sm only
  Hidden.inMdAndBigger(Widget child)
      : super(child, xs: false, sm: false, md: true);

  /// Child is displayed in all viewport sizes except xs
  Hidden.inXs(Widget child) : super(child, xs: true, sm: false);

  /// Child is displayed in all viewport sizes except xs and sm
  Hidden.inXsAndSm(Widget child) : super(child, xs: true, sm: true ,md: false);

  /// Child is hidden in all viewport sizes
  Hidden.all(Widget child) : super(child, xs: true);

  /// alias for [Hidden.all]
  Hidden.block(Widget child)  : super(child, xs: true);
}
