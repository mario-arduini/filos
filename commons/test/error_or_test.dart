import 'package:commons/error_or.dart';
import 'package:test/test.dart';

void main() {
  group('ErrorOr with value', () {
    final value = 42;
    final errorOr = ErrorOr<int>.value(value);
    test('should return true on hasValue', () {
      expect(errorOr.hasValue, true);
    });
    test('should return false on isError', () {
      expect(errorOr.isError, false);
    });
    test('should retrieve the original value', () {
      expect(errorOr.value, value);
    });
    test('should throw when accessing error', () {
      expect(() => errorOr.error, throwsStateError);
    });
    test('should equal another object with same value', () {
      expect(errorOr, ErrorOr<int>.value(value));
    });
    test('should not equal a different object', () {
      expect(errorOr == ErrorOr<int>.value(7), false);
      expect(errorOr == ErrorOr<int>.error(UnimplementedError('test')), false);
    });
  });
  group('ErrorOr with error', () {
    final error = UnimplementedError('test');
    final errorOr = ErrorOr<int>.error(error);
    test('should return true on isError', () {
      expect(errorOr.isError, true);
    });
    test('should return false on hasValue', () {
      expect(errorOr.hasValue, false);
    });
    test('should retrieve the original error', () {
      expect(errorOr.error, error);
    });
    test('should throw when accessing value', () {
      expect(() => errorOr.value, throwsStateError);
    });
    test('should equal another object with same error', () {
      expect(errorOr, ErrorOr<int>.error(error));
    });
    test('should not equal a different object', () {
      expect(errorOr == ErrorOr<int>.value(7), false);
      expect(errorOr == ErrorOr<int>.error(UnimplementedError('test')), false);
    });
  });
}
