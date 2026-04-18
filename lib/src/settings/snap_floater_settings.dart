import 'package:flutter/painting.dart';

import '../storage/storage.dart';

/// {@template snap_floater_settings}
/// Configuration for a [SnapFloaterScope].
///
/// All fields are optional and have sensible defaults. Pass an instance
/// to [SnapFloaterScope] or [SnapFloaterScope.builder] via the `settings`
/// parameter.
///
/// ```dart
/// SnapFloaterSettings(
///   snapAlignments: [
///     .topRight,
///     .bottomRight,
///   ],
///   initialAlignment: .bottomRight,
///   storage: SharedPreferencesStorage(),
/// )
/// ```
/// {@endtemplate}
class SnapFloaterSettings {
  /// {@macro snap_floater_settings}
  const SnapFloaterSettings({
    this.initialAlignment = Alignment.bottomRight,
    this.snapAlignments = const [Alignment.bottomRight],
    this.isEnabled = true,
    this.showPreview = true,
    this.storage,
  });

  /// Whether the floater renders at all.
  /// When `false`, [SnapFloaterController.show]
  /// has no effect until re-enabled via settings.
  final bool isEnabled;

  /// Whether to show previews at snap targets while dragging.
  /// Has no effect when [snapAlignments] contains fewer than two entries.
  final bool showPreview;

  /// Storage backend for persisting position across app launches.
  /// When `null`, position resets to [initialAlignment] on every cold start.
  final SnapFloaterStorage? storage;

  /// Starting alignment before any user interaction
  /// or persisted value is loaded.
  final Alignment initialAlignment;

  /// The alignments the floater can snap to.
  /// When fewer than two are provided, drag is disabled entirely.
  final List<Alignment> snapAlignments;
}
