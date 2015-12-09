# tap

This package provides Ruby's [Object#tap method][tap] for Dart.

[![Build Status](https://travis-ci.org/kseo/tap.svg)](https://travis-ci.org/kseo/tap)
[![Coverage Status](https://coveralls.io/repos/kseo/tap/badge.svg?branch=master&service=github)](https://coveralls.io/github/kseo/tap?branch=master)

[tap]: http://ruby-doc.org/core-2.2.3/Object.html#method-i-tap

## Usage

The primary purpose of this method is to “tap into” a method chain,
in order to perform operations on intermediate results within the chain.

```dart
import 'package:quiver_collection/collection.dart';
import 'package:tap/tap.dart';

List<int> gen(int n) => new List<int>.generate(n, (i) => i);

class MyList<E> extends DelegatingList<E> with TapMixin<MyList<E>> {
  final List<E> _base = new List<E>();

  @override
  List<E> get delegate => _base;

  @override
  String toString() => _base.toString();
}

main() {
  final xs = new MyList<int>()..addAll(gen(10));
  xs
    ..tap((xs) => print('original: $xs'))
    ..removeWhere((x) => x % 2 == 0)
    ..tap((xs) => print('removed: $xs'))
    ..shuffle()
    ..tap((xs) => print('shuffled: $xs'))
    ..sort()
    ..tap((xs) => print('sorted: $xs'));
  // original: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  // removed: [1, 3, 5, 7, 9]
  // shuffled: [3, 1, 7, 9, 5] (can differ)
  // sorted: [1, 3, 5, 7, 9]
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/kseo/tap/issues
