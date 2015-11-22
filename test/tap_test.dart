// Copyright (c) 2015, Kwang Yul Seo. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library tap.test;

import 'package:tap/tap.dart';
import 'package:test/test.dart';

class User extends TapMixin<User> {
  final String id;
  final String name;

  User(this.id, this.name);
}

void main() {
  group('tap tests', () {
    test('tap', () {
      final user1 = new User('kseo', 'Kwang Yul Seo');
      final user2 = new User('john', 'John Doe');
      final userIds = [];

      final name1 = user1.tap((user) => userIds.add(user.id)).name;
      final name2 = user2.tap((user) => userIds.add(user.id)).name;

      expect(name1, equals(user1.name));
      expect(name2, equals(user2.name));
      expect(userIds, equals(['kseo', 'john']));
    });
  });
}

