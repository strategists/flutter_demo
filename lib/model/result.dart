class Result<E> {
  final int code;

  final String errorMsg;

  final E data;

  const Result({this.code, this.errorMsg, this.data});
}
