part of 'api_bloc.dart';

class ApiState extends Equatable{

final ApiStatus apiStatus;
final List<ApiDataModel> apiDataModel;
final List<ApiDataModel> tempApiDataModel;
final String message;
final String searchMessage;
 ApiState({
  this.apiStatus = ApiStatus.loading,
  this.apiDataModel = const <ApiDataModel>[],
   this.tempApiDataModel = const <ApiDataModel>[],
  this.message = '',
   this.searchMessage = ''
});

ApiState copyWith({ApiStatus? apiStatus,List<ApiDataModel>? apiDataModel,List<ApiDataModel>? tempApiDataModel,String? message,String? searchMessage}){
  return ApiState(
      apiStatus:apiStatus ?? this.apiStatus,
  apiDataModel: apiDataModel ?? this.apiDataModel,
  tempApiDataModel: tempApiDataModel ?? this.tempApiDataModel,
  message
      : message ?? this.message,
      searchMessage: searchMessage?? this.searchMessage
  );
}
  @override
  List<Object?> get props =>[apiStatus,apiDataModel,message,tempApiDataModel,searchMessage];

}

