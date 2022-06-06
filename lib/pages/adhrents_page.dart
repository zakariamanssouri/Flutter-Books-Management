import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp1flutter/bloc/adherents/adhrent_bloc.dart';
import 'package:bloc/bloc.dart';

import '../bloc/adherents/adhrent_event.dart';
import '../bloc/adherents/adhrent_state.dart';
import '../widgets/ButtonLoadAdherent.dart';
import '../widgets/adherents_list.dart';

class AdherentPage extends StatelessWidget {
  const AdherentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adherents")),
      body: Column(
          children: [
            BlocBuilder<AdhrentBloc,AdhrentState>(
                builder: (context, state) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child:ButtonLoadAdhrent(adhrentEvent: LoadAllAdhrentEvent(),text: "ALl",)
                    // child: ButtonsBar(),
                  );
                }),
            BlocBuilder<AdhrentBloc,AdhrentState>(
                builder: (context, state) {
                  if(state.requestState==RequestState.Loading){
                    return const CircularProgressIndicator();
                  }else if(state.requestState==RequestState.Loaded){
                    return Container(
                      child: Expanded(child: AdhrentListView(state: state)),
                    );
                  }else if(state.requestState==RequestState.Error){
                    return Column(
                      children: [
                        Text("${state.errorMessage}"),
                      ],
                    );
                  }
                  else{
                    return Center(child: Text("Aucun élément"));
                  }
                }),

          ])
      ,
    );
  }

}


