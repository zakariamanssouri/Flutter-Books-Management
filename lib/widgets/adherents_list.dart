import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp1flutter/bloc/adherents/adhrent_bloc.dart';
import 'package:tp1flutter/models/Adherent.dart';
import 'package:tp1flutter/widgets/DeleteButton.dart';

import '../bloc/adherents/adhrent_event.dart';
import '../bloc/adherents/adhrent_state.dart';

class AdhrentListView extends StatelessWidget {
  final AdhrentState state;
  const AdhrentListView({Key? key,required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context,index)=>Divider(color: Colors.grey,height: 3),
        itemCount: state.adherents.length,
        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.all(15),
            width: 200,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.deepPurple,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]
            ),
            child: BlocBuilder<AdhrentBloc,AdhrentState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),

                  Row(
                    children:[ Padding(
                      padding: EdgeInsets.only(left: 20),
                      child:
                        Text(state.adherents[index].nom??"",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)
                      ,
                    ),
                    Spacer(),
                      IconButton(onPressed:(){}
                          , icon: Icon(Icons.delete))
                    ]
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 20),
                        child:
                        Text(state.adherents[index].email??"",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)
                        ,
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 10,),

                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child:
                        Text(state.adherents[index].tel??"",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)
                        ,
                      )
                    ],
                  )

                ],
              );}
            ),
          );
        });
  }
}
