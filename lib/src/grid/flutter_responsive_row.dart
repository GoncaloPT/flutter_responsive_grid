import 'package:flutter/material.dart';
import 'package:flutter_responsive_grid/src/grid/grid_system.dart';
import 'package:logging/logging.dart';

class FlutterResponsiveRow extends StatelessWidget {
  final List<FlutterResponsiveCol> children;
  final GridSystemUtils utils;
  final Logger _logger = Logger('FlutterResponsiveRow');

  FlutterResponsiveRow(this.utils, {this.children});
  @override
  Widget build(BuildContext context) {
    var rows = <Widget>[];
    var columns = <Widget>[];
    int availableRowColumns = utils.configuration.numberOfColumns;

    for (FlutterResponsiveCol responsiveCol in children) {
      _logger.warning("=============================================");
      int requiredColumns = utils.getRequiredColumnsOf(responsiveCol, context);

      _logger.warning("availableRowColumns $availableRowColumns ");
      _logger.warning("requiredColumns $requiredColumns ");
      // if a column doesn't have a specified size, it will take all the available row
      if(requiredColumns < 0){
        requiredColumns = availableRowColumns<1?utils.configuration.numberOfColumns:availableRowColumns;
      }
      responsiveCol.requiredColumns = requiredColumns;
      _logger.warning("requiredColumns 2 $requiredColumns ");
      // The element doesn't fit in the current row
      if (availableRowColumns - requiredColumns < 0) {
        if (availableRowColumns > 0) {
          // We need to 'fill' the missing columns, otherwise the last column will expand and fill the entire width
          columns.add(Spacer(
            flex: availableRowColumns,
          ));
        }
        rows.add(Row(

          children: columns,
        ));
        columns = <Widget>[];
        availableRowColumns = utils.configuration.numberOfColumns;
      }
      _logger.warning("Adding responsivecol");
      columns.add(responsiveCol);
      availableRowColumns -= requiredColumns;
    }
    // we have to include the last row also
    if (columns.isNotEmpty) {
      if (availableRowColumns > 0) {
        // We need to 'fill' the missing columns, otherwise the last column will expand and fill the entire width
        columns.add(Spacer(
          flex: availableRowColumns,
        ));
      }
      rows.add(Row(
        children: columns,
      ));
    }
    _logger.warning("we have #${rows.length} rows");

    return Column(children: rows,crossAxisAlignment: CrossAxisAlignment.stretch,);
  }
}

/// Represents a Column that can exist inside of a row [FlutterResponsiveRow]
/// This is the class where the actual size of the element is defined according
/// to xs,s,m,l,xl predefined viewport sizes.
/// For more information visit https://getbootstrap.com/docs/4.0/layout/grid/
/// @implNotes
/// If no value is provided in one of the sizes ( xs,s,m,l,xl ) the space
/// available on the row will be evenly taken by all the cols
class FlutterResponsiveCol extends StatelessWidget {
  final Widget child;
  final GridSystemConfiguration configuration;
  final sizes = <int>[];

  int requiredColumns;

  FlutterResponsiveCol(
    this.child, {
    this.configuration = defaultGridSystemConfiguration,
    int xs,
    int sm,
    int md,
    int lg,
    int xl,

  }) : assert(child != null) {
    if(xs == null){
      xs = -1;
    }
    this.sizes.addAll([xs, sm, md, lg, xl]);
    // if not provided the size will be inherited from the smallest to largest
    for (var i = 1; i < sizes.length; i++) {
      sizes[i] ??= sizes[i - 1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: requiredColumns??1,
      child: child,
    );
  }
}
