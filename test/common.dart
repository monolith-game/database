import 'dart:async';

/// Run test function [f] multiple times, up to [count].
FutureOr<void> runUntilCount({
  required final FutureOr<void> Function(int i) f,
  final int count = 30,
}) {
  for (var i = 0; i < count; i++) {
    f(count);
  }
}
