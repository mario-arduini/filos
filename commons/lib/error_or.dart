import 'package:equatable/equatable.dart';

class ErrorOr<T> extends Equatable {
  final T _value;
  final Error _error;

  const ErrorOr._(this._value, this._error)
      : assert(_value == null || _error == null),
        assert(_value != null || _error != null);

  ErrorOr.value(T value) : this._(value, null);
  ErrorOr.error(Error error) : this._(null, error);

  bool get hasValue => _value != null;
  bool get isError => !hasValue;

  T get value => hasValue
      ? _value
      : throw StateError('ErrorOr<T> is error, cannot access value');

  Error get error => isError
      ? _error
      : throw StateError('ErrorOr<T> has value, cannot access error');

  @override
  List<Object> get props => [_value, _error];
}
