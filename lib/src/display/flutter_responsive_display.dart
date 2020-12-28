import 'package:flutter/widgets.dart';
import 'package:flutter_responsive_grid/flutter_responsive_grid.dart';

class Display extends StatelessWidget {
  final Widget child;
  final bool xs;
  final bool sm;
  final bool md;
  final bool lg;
  final bool xl;

  final display = <bool>[];

  /// Constructor.
  /// Display in transitive from lower to higher viewport
  /// This means that if no value is passed to a specific viewport size, it
  /// will inherit from the previous(smaller) viewport size
  Display(this.child, {this.xs=true, this.sm, this.md, this.lg, this.xl})
      : assert(child != null) {
    this.display.addAll([xs, sm, md, lg, xl]);
    for (var i = 1; i < display.length; i++) {
      display[i] ??= display[i - 1];
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize size = GridSystemUtils.findCurrentScreenSize(context);
    if(display[size.index]){
      return child;
    }
    return Container();
  }
}

class Hidden extends StatelessWidget {
  final bool xs;
  final bool sm;
  final bool md;
  final bool lg;
  final bool xl;

  Hidden(this.xs, this.sm, this.md, this.lg, this.xl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
