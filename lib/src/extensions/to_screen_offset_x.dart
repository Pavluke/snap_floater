import 'package:flutter/material.dart';

/// Converts an [Alignment]
/// to a screen-space [Offset] for a widget of [targetSize],
/// clamped to stay within the screen bounds minus [padding].
///
/// Used internally by [SnapPreviewBuilder] and [SnapFloaterChild]
/// to calculate both the floater's position and snap target positions.
extension AlignmentToScreenOffsetX on Alignment {
  /// Returns the top-left [Offset] in screen coordinates where a widget of
  /// [targetSize] should be placed to match this alignment, clamped to
  /// stay within the screen bounds minus [padding].
  Offset toScreenOffset(
    BuildContext context, {
    required Size targetSize,
    required EdgeInsets padding,
  }) {
    final screenSize = MediaQuery.sizeOf(context);

    final double x = (this.x + 1) / 2 * screenSize.width;
    final double y = (this.y + 1) / 2 * screenSize.height;

    final double left = (x - targetSize.width / 2).clamp(
      padding.left,
      screenSize.width - targetSize.width - padding.right,
    );

    final double top = (y - targetSize.height / 2).clamp(
      padding.top,
      screenSize.height - targetSize.height - padding.bottom,
    );

    return Offset(left, top);
  }
}
