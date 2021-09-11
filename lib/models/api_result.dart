class ApiResult<T> {
  T data;
  String code;
  String msg;
  int totalCount;
  bool hasNextPage;

  ApiResult(
      {required this.data,
      required this.code,
      required this.msg,
      required this.totalCount,
      required this.hasNextPage});


}
