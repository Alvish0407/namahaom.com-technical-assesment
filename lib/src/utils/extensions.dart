import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:hooks_riverpod/hooks_riverpod.dart';

extension ColorX on Color {
  Color get hardcodedColor => this;
}

extension StringX on String {
  String get hardcoded => this;
}

int value = 0;

extension CacheForExtension on AutoDisposeRef<Object?> {
  /// Keeps the provider alive for [duration].
  void cacheFor(Duration duration) {
    value++;
    final effectiveValue = value;
    // Immediately prevent the state from getting destroyed.
    final link = keepAlive();
    // After duration has elapsed, we re-enable automatic disposal.
    final timer = Timer(
      duration,
      () {
        log('$effectiveValue: Time is up! Disposing the provider');
        link.close();
      },
    );

    // Optional: when the provider is recomputed (such as with ref.watch),
    // we cancel the pending timer.
    onDispose(timer.cancel);

    // If the provider is listened again after it was paused, cancel the timer
    onResume(timer.cancel);

    onAddListener(() => log('$effectiveValue: Listener added'));
    onRemoveListener(() => log('$effectiveValue: Listener removed'));
    onCancel(() => log('$effectiveValue: Provider canceled'));
    onDispose(() => log('$effectiveValue: Provider disposed'));
    onResume(() => log('$effectiveValue: Provider resumed'));
  }

  /// Purpose: Keep the provider alive for [duration] after it has been canceled.
  /// If the provider is listened again, the timer is canceled and link will be closed.
  void cacheOnCanceledFor(Duration duration) {
    Timer? timer;
    KeepAliveLink? link;

    // Prevent provider from being disposed when it's canceled(when the last listener is removed)
    onCancel(() => link = keepAlive());
    // After [duration] has elapsed, close the link to allow the provider to be disposed
    onCancel(() {
      timer = Timer(duration, () => link?.close());
    });
    // Cancel the timer and close the link if the provider is listened again
    onResume(() {
      timer?.cancel();
      link?.close();
    });
  }
}

extension IterableX<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E element) test, {E? Function()? orElse}) {
    for (E element in this) {
      if (test(element)) return element;
    }
    if (orElse != null) return orElse();
    return null;
  }
}
