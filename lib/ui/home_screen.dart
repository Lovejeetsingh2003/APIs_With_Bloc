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
                  return ListView.builder(
                      itemCount: state.apiDataModel.length,
                      itemBuilder: (context,index){
                        final item = state.apiDataModel[index];
                        return Card(
                    child: ListTile(
                      title: Text(item.email.toString()),
                      subtitle: Text(item.body.toString()),
                    ),
                  );
              }

                  );}
      })
    );
  }
}
