import 'package:api_with_bloc/bloc/api_bloc/api_bloc.dart';
import 'package:api_with_bloc/utils/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ApiBloc>().add(FetchData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Api'),),
      body: BlocBuilder<ApiBloc,ApiState>(
          builder: (context,state){

              switch(state.apiStatus){
                case ApiStatus.loading:
                  return Center(child: CircularProgressIndicator(),);
                case ApiStatus.failure:
                  return Center(child: Text(state.message.toString()),);
                case ApiStatus.success:
                  return Column(
                    children: [
                      TextFormField(
                        onChanged: (filterKey){
                          context.read<ApiBloc>().add(SearchItem(filterKey));
                        },
                        decoration: InputDecoration(
                          hintText: 'Search From Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          )
                        ),
                      ),
                      Expanded(child:state.searchMessage.isNotEmpty?Center(child: Text(state.searchMessage.toString()),): ListView.builder(
                          itemCount: state.tempApiDataModel.isEmpty ? state.apiDataModel.length : state.tempApiDataModel.length,
                          itemBuilder: (context,index){
                           if(state.tempApiDataModel.isNotEmpty){
                             final item = state.tempApiDataModel[index] ;
                             return Card(
                               child: ListTile(
                                 title: Text(item.email.toString()),
                                 subtitle: Text(item.body.toString()),
                               ),
                             );
                           }else{
                             final item = state.apiDataModel[index] ;
                             return Card(
                               child: ListTile(
                                 title: Text(item.email.toString()),
                                 subtitle: Text(item.body.toString()),
                               ),
                             );
                           }
                          }

                      ))
                    ],
                  ); }
      })
    );
  }
}
