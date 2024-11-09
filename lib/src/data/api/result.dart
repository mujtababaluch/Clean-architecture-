 class Result<T> {
    Result._();

      factory Result.loading(T msg) = LoadingState<T>;

  factory Result.success(T value) =  SucccesState<T>;

  factory Result.error(T msg) = ErrorState<T>;

  factory Result.networkError(T msg) = NetworkErrorState<T>;
 }

 class LoadingState<T> extends Result<T> {
  LoadingState(this.msg) : super._();
    final T msg;
 }

 class ErrorState<T> extends Result<T>{
     final T msg;
    ErrorState(this.msg) :super._();
 }

 class NetworkErrorState<T> extends Result<T>{
  final T msg;
  NetworkErrorState(this.msg) : super._();
 }

 class  SucccesState<T> extends Result<T>{
  final T value;
  SucccesState(this.value) :  super._();
 }