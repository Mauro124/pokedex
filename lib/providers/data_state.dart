abstract class DataState<T> {
  const factory DataState.initial({T? value}) = InitialDataState<T>;
  const factory DataState.data(T value) = ValueDataState<T>;
  const factory DataState.loading() = LoadingDataState<T>;
  const factory DataState.error(Object error, {StackTrace? stackTrace}) = ErrorDataState<T>;

  R _map<R>({
    required R Function(InitialDataState<T> initial) initial,
    required R Function(ValueDataState<T> data) data,
    required R Function(ErrorDataState<T> error) error,
    required R Function(LoadingDataState<T> loading) loading,
  });
}

class InitialDataState<T> implements DataState<T> {
  const InitialDataState({T? value});

  @override
  R _map<R>({
    required R Function(InitialDataState<T> initial) initial,
    required R Function(ValueDataState<T> data) data,
    required R Function(ErrorDataState<T> error) error,
    required R Function(LoadingDataState<T> loading) loading,
  }) {
    return initial(this);
  }
}

class LoadingDataState<T> implements DataState<T> {
  const LoadingDataState();

  @override
  R _map<R>({
    required R Function(InitialDataState<T> initial) initial,
    required R Function(ValueDataState<T> data) data,
    required R Function(ErrorDataState<T> error) error,
    required R Function(LoadingDataState<T> loading) loading,
  }) {
    return loading(this);
  }
}

class ErrorDataState<T> implements DataState<T> {
  const ErrorDataState(this.error, {this.stackTrace});

  final Object error;
  final StackTrace? stackTrace;

  @override
  R _map<R>({
    required R Function(InitialDataState<T> initial) initial,
    required R Function(ValueDataState<T> data) data,
    required R Function(ErrorDataState<T> error) error,
    required R Function(LoadingDataState<T> loading) loading,
  }) {
    return error(this);
  }
}

class ValueDataState<T> implements DataState<T> {
  const ValueDataState(this.value);
  final T value;

  @override
  R _map<R>({
    required R Function(InitialDataState<T> initial) initial,
    required R Function(ValueDataState<T> data) data,
    required R Function(ErrorDataState<T> error) error,
    required R Function(LoadingDataState<T> loading) loading,
  }) {
    return data(this);
  }
}

extension DataStateExtension<T> on DataState<T> {
  R when<R>({
    R Function(T? initial)? initial,
    required R Function(T data) data,
    required R Function(Object error, StackTrace? stackTrace) error,
    R Function()? loading,
  }) {
    return _map(
      initial: (v) => initial!(v.value),
      data: (d) => data(d.value),
      error: (e) => error(e.error, e.stackTrace),
      loading: (l) => loading!(),
    );
  }

  T? get value => _map(
        initial: (_) => null,
        data: (d) => d.value,
        error: (e) => throw e.error,
        loading: (l) => null,
      );
}
