part of 'api_bloc.dart';

class ApiState extends Equatable{

final ApiStatus apiStatus;
final List<ApiDataModel> apiDataModel;
final String message;

 ApiState({
  this.apiStatus = ApiStatus.loading,
  this.apiDataModel = const <ApiDataModel>[],
  this.message = ''
});

ApiState copyWith({ApiStatus? apiStatus,List<ApiDataModel>? apiDataModel,String? message}){
  return ApiState(
      apiStatus:apiStatus ?? this.apiStatus,
  apiDataModel: apiDataModel ?? this.apiDataModel,
  message: message ?? this.message
  );
}
  @override
  List<Object?> get props =>[apiStatus,apiDataModel,message];

}

