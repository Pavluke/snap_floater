import 'package:flutter/material.dart';

/// {@template basic_snap_floater_button}
/// The default floater button used by [SnapFloaterScope].
///
/// Renders a filled [IconButton] with a circular shadow.
/// Replace it via [SnapFloaterScope.builder] if you need a custom widget.
/// {@endtemplate }
class BasicSnapFloaterButton extends StatelessWidget {
  /// {@macro basic_snap_floater_button}
  const BasicSnapFloaterButton(this.onTap, {super.key});

  /// Called when the button is tapped.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              spreadRadius: .01,
              color: Theme.of(context).buttonTheme.colorScheme?.secondary ??
                  Colors.transparent,
            ),
          ],
        ),
        child: IconButton.filled(
          padding: const EdgeInsets.all(15),
          onPressed: onTap,
          icon: Icon(
            Icons.code,
            color: Theme.of(context).buttonTheme.colorScheme?.onPrimary,
          ),
        ),
      );
}
