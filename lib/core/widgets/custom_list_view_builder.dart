import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A highly customizable ListView.builder widget that supports both vertical and horizontal orientations
///
/// Usage examples:
/// ```dart
/// // Vertical list
/// CustomListViewBuilder(
///   itemCount: items.length,
///   itemBuilder: (context, index) => MyItemWidget(items[index]),
///   orientation: ListOrientation.vertical,
/// )
///
/// // Horizontal list
/// CustomListViewBuilder(
///   itemCount: items.length,
///   itemBuilder: (context, index) => MyItemWidget(items[index]),
///   orientation: ListOrientation.horizontal,
///   height: 200.h,
/// )
///
/// // With spacing and padding
/// CustomListViewBuilder(
///   itemCount: items.length,
///   itemBuilder: (context, index) => MyItemWidget(items[index]),
///   orientation: ListOrientation.horizontal,
///   spacing: 12.w,
///   padding: EdgeInsets.symmetric(horizontal: 16.w),
/// )
/// ```
class CustomListViewBuilder extends StatelessWidget {
  /// Number of items in the list
  final int itemCount;

  /// Builder function for each item
  final Widget Function(BuildContext context, int index) itemBuilder;

  /// Orientation of the list (vertical or horizontal)
  final ListOrientation orientation;

  /// Height for horizontal lists (required when orientation is horizontal)
  final double? height;

  /// Width for vertical lists (optional)
  final double? width;

  /// Spacing between items
  final double? spacing;

  /// Padding around the entire list
  final EdgeInsetsGeometry? padding;

  /// Scroll physics
  final ScrollPhysics? physics;

  /// Whether to shrink wrap the list
  final bool shrinkWrap;

  /// Whether the list is scrollable
  final bool scrollable;

  /// Empty state widget when itemCount is 0
  final Widget? emptyWidget;

  /// Loading state widget
  final Widget? loadingWidget;

  /// Whether to show loading state
  final bool isLoading;

  const CustomListViewBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.orientation = ListOrientation.vertical,
    this.height,
    this.width,
    this.spacing,
    this.padding,
    this.physics,
    this.shrinkWrap = false,
    this.scrollable = true,
    this.emptyWidget,
    this.loadingWidget,
    this.isLoading = false,
  });

  /// Creates a vertical list
  static CustomListViewBuilder vertical({
    required int itemCount,
    required Widget Function(BuildContext context, int index) itemBuilder,
    double? width,
    double? spacing,
    EdgeInsetsGeometry? padding,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    bool scrollable = true,
    Widget? emptyWidget,
    Widget? loadingWidget,
    bool isLoading = false,
  }) {
    return CustomListViewBuilder(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      orientation: ListOrientation.vertical,
      width: width,
      spacing: spacing,
      padding: padding,
      physics: physics,
      shrinkWrap: shrinkWrap,
      scrollable: scrollable,
      emptyWidget: emptyWidget,
      loadingWidget: loadingWidget,
      isLoading: isLoading,
    );
  }

  /// Creates a horizontal list
  static CustomListViewBuilder horizontal({
    required int itemCount,
    required Widget Function(BuildContext context, int index) itemBuilder,
    required double height,
    double? spacing,
    EdgeInsetsGeometry? padding,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    bool scrollable = true,
    Widget? emptyWidget,
    Widget? loadingWidget,
    bool isLoading = false,
  }) {
    return CustomListViewBuilder(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      orientation: ListOrientation.horizontal,
      height: height,
      spacing: spacing,
      padding: padding,
      physics: physics,
      shrinkWrap: shrinkWrap,
      scrollable: scrollable,
      emptyWidget: emptyWidget,
      loadingWidget: loadingWidget,
      isLoading: isLoading,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Show loading state if loading
    if (isLoading) {
      return loadingWidget ?? _buildDefaultLoading();
    }

    // Show empty state if no items
    if (itemCount == 0) {
      return emptyWidget ?? _buildDefaultEmpty();
    }

    // Build the list based on orientation
    Widget listWidget = ListView.builder(
      scrollDirection: orientation == ListOrientation.horizontal
          ? Axis.horizontal
          : Axis.vertical,
      itemCount: itemCount,
      itemBuilder: _buildItemWithSpacing,
      physics: scrollable ? physics : const NeverScrollableScrollPhysics(),
      shrinkWrap: shrinkWrap,
      padding: padding,
    );

    // Wrap with SizedBox for horizontal lists to set height
    if (orientation == ListOrientation.horizontal && height != null) {
      listWidget = SizedBox(height: height, child: listWidget);
    }

    // Wrap with SizedBox for vertical lists to set width (if specified)
    if (orientation == ListOrientation.vertical && width != null) {
      listWidget = SizedBox(width: width, child: listWidget);
    }

    return listWidget;
  }

  /// Builds each item with optional spacing
  Widget _buildItemWithSpacing(BuildContext context, int index) {
    Widget item = itemBuilder(context, index);

    // Add spacing between items (except for the last item)
    if (spacing != null && index < itemCount - 1) {
      if (orientation == ListOrientation.horizontal) {
        return Padding(
          padding: EdgeInsets.only(right: spacing!),
          child: item,
        );
      } else {
        return Padding(
          padding: EdgeInsets.only(bottom: spacing!),
          child: item,
        );
      }
    }

    return item;
  }

  /// Default loading widget
  Widget _buildDefaultLoading() {
    return Container(
      padding: EdgeInsets.all(24.w),
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  /// Default empty state widget
  Widget _buildDefaultEmpty() {
    return Container(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 48.sp, color: Colors.grey),
          SizedBox(height: 16.h),
          Text(
            'No items available',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

/// Enum for list orientation
enum ListOrientation { vertical, horizontal }
