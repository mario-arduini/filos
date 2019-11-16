import 'package:commons/eq_list.dart';
import 'package:test/test.dart';

void main() {
  group('EqList', () {
    final emptyList = EqList([]);
    final list = EqList([1, "2", 0.3]);
    test('should equal itself', () {
      expect(list, list);
      expect(emptyList, emptyList);
    });
    test('should equal a list with the same elements', () {
      expect(list, EqList([1, "2", 0.3]));
      expect(emptyList, EqList([]));
    });
    test('should not equal a different object', () {
      expect(list, isNot(EqList([2, "2", 0.3])));
      expect(list, isNot(EqList([1, "", 0.3])));
      expect(list, isNot(EqList([1, "2", 4.2])));
      expect(list, isNot(EqList([1, "2", 0.3, false])));
      expect(list, isNot(EqList([1, "2"])));
      expect(emptyList, isNot(EqList([1])));
    });
  });
}
