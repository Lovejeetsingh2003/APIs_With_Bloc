part of 'api_bloc.dart';


abstract class ApiEvent extends Equatable{
 @override
  List<Object> get props => [];
}

class FetchData extends ApiEvent{}

class SearchItem extends ApiEvent{

 final String emailSearched;
 SearchItem(this.emailSearched);
}
