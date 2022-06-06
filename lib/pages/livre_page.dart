import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp1flutter/bloc/livres/livre_bloc.dart';
import 'package:tp1flutter/bloc/livres/livre_bloc.dart';

import '../widgets/livres_list.dart';

class LivrePage extends StatelessWidget {
  const LivrePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Livres")),
      body: Column(
          children: [
            BlocBuilder<LivreBloc,LivreState>(
                builder: (context, state) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<LivreBloc>().add(LoadAllLivresEvent());
                      },
                      child: Text("load"),
                    ),
                  );
                }),
            BlocBuilder<LivreBloc,LivreState>(
                builder: (context, state) {
                  if(state.requestState==RequestLiverState.Loading){
                    return CircularProgressIndicator();
                  }else if(state.requestState==RequestLiverState.Loaded){
                    return Container(
                      child: Expanded(
                        child: LivresListView(state: state),
                      ),
                    );
                  }else if(state.requestState==RequestLiverState.Error){
                    return Column(
                      children: [
                        Text("${state.errorMessage}"),
                      ],
                    );
                  }
                  else{
                    return Center(child: Text("Aucun élément"),);
                  }
                }),

          ])
      ,
    );
  }
}
