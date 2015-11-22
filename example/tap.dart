// Copyright (c) 2015, Kwang Yul Seo. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library tap.example;

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
