import 'package:flutter/cupertino.dart';
import 'package:flutter_responsive_grid/flutter_responsive_grid.dart';

enum ScreenSize { xs, sm, md, lg, xl }

class GridSystemUtils {
  final GridSystemConfiguration configuration;

  GridSystemUtils({this.configuration = defaultGridSystemConfiguration});

  double getColumnWidth(BuildContext context){
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double viewportWidth = mediaQueryData.size.width;
    return viewportWidth / configuration.numberOfColumns;
  }

  int getRequiredColumnsOf(FlutterResponsiveCol col, BuildContext context){
    ScreenSize current = findCurrentScreenSize(context);
    print("current is $current value is ${col.sizes[current.index]}");
    return col.sizes[current.index];
  }

  static double findCurrentHeight(BuildContext context){
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return mediaQueryData.size.height;
  }
  static ScreenSize findCurrentScreenSize(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double width = mediaQueryData.size.width;

    if (width < 576) {
      return ScreenSize.xs;
    }
    if (width < 768) {
      return ScreenSize.sm;
    }
    if (width < 992) {
      return ScreenSize.md;
    }
    if (width < 1200) {
      return ScreenSize.lg;
    }
    return ScreenSize.xl;
  }

}




const defaultGridSystemConfiguration = GridSystemConfiguration(12);

class GridSystemConfiguration {
  final int numberOfColumns;

  const GridSystemConfiguration(this.numberOfColumns);
}
