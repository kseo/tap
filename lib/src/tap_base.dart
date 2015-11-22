// Copyright (c) 2015, Kwang Yul Seo. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library tap.base;

/// When applied to any argument [x], yields a one-argument constant
/// function `Kx`, which, when applied to any argument, returns [x].
///
/// ```dart
/// print(_kestrel(#foo)(x));
/// // => #foo
/// ```
dynamic _kestrel(x) => (_) => x;

/// [TapMixin] can be used as a mixin to make a class capable of using [tap].
class TapMixin<T extends TapMixin<T>> {
  /// Calls [f] with this as argument and returns this.
  ///
  /// The primary purpose of this method is to “tap into” a method chain,
  /// in order to perform operations on intermediate results within the chain.
  T tap(void f(T self)) => _kestrel(this)(f(this));
}

