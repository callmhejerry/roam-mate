class DelayedResult<T> {
  final T? value;
  final String? errorMessage;
  final dynamic error;
  final bool _isLoading;

  const DelayedResult.loading({
    this.value,
  })  : _isLoading = true,
        error = null,
        errorMessage = null;

  const DelayedResult.fromValue({required this.value})
      : _isLoading = false,
        error = null,
        errorMessage = null;

  const DelayedResult.idle()
      : _isLoading = false,
        value = null,
        error = null,
        errorMessage = null;

  const DelayedResult.error({
    required this.errorMessage,
    required this.error,
    this.value,
  }) : _isLoading = false;

  bool get isLoading => _isLoading;
  bool get hasData => value != null;
  bool get isFailed => errorMessage != null && error != null;
  bool get isIdle =>
      value == null &&
      errorMessage == null &&
      error == null &&
      _isLoading == false;
}
