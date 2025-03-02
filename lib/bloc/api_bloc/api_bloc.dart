import 'package:api_with_bloc/model/api_data_model.dart';
import 'package:api_with_bloc/repository/api_repository.dart';
import 'package:api_with_bloc/utils/enum.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {

   List<ApiDataModel> tempApiDataModel = [];
  ApiRepository apiRepository = ApiRepository();
ApiBloc():super(ApiState()){
  on<FetchData>(fetchData);
  on<SearchItem>(_searchItem);
}
  Future<void> fetchData(FetchData event, Emitter<ApiState> emit) async {
    try {
      final value = await apiRepository.fetchApiData();
      emit(state.copyWith(
        apiStatus: ApiStatus.success,
        message: 'Success',
        apiDataModel: value,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(apiStatus: ApiStatus.failure, message: error.toString()));
    }
  }

   void _searchItem(SearchItem event, Emitter<ApiState> emit) {
if(event.emailSearched.isEmpty){
  emit(state.copyWith(tempApiDataModel: [],searchMessage: ''));
}else{
  tempApiDataModel =  state.apiDataModel.where((element)=> element.email.toString().toLowerCase().contains(event.emailSearched.toString().toLowerCase())).toList();
if(tempApiDataModel.isEmpty){
  emit(state.copyWith(tempApiDataModel: tempApiDataModel,searchMessage: 'No Data Found'));

}else{
  emit(state.copyWith(tempApiDataModel: tempApiDataModel,searchMessage: ''));
}
}
  emit(state.copyWith(tempApiDataModel: tempApiDataModel));
   }
}
