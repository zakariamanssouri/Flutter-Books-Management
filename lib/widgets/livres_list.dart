



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp1flutter/bloc/livres/livre_bloc.dart';

class LivresListView extends StatelessWidget {
  final LivreState state;
  LivresListView({Key? key,required this.state}) : super(key: key);
  TextEditingController? textEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context,index)=>Divider(color: Colors.grey,height: 3),
        itemCount: state.livres.length,
        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.all(15),
            width: 200,
            height: 200,
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
            child: BlocBuilder<LivreBloc,LivreState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),

                      Row(
                          children:[ Padding(
                            padding: EdgeInsets.only(left: 20),
                            child:
                            Text("auteur: "+state.livres[index].auteur??"",
                              style: TextStyle(fontSize: 20,color: Colors.white,
                              ),)
                            ,
                          ),
                            Spacer(),
                            IconButton(onPressed:(){
                              context.read<LivreBloc>().add(DeleteLivre(id: state.livres[index].id_livre));
                            }
                                , icon: Icon(Icons.delete))
                          ]
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child:
                            Text("ISBN: "+state.livres[index].isbn??"",
                              style: TextStyle(fontSize: 20,color: Colors.white),)
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
                            Text(state.livres[index].titre??"",
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)
                            ,
                          )
                        ],
                      ),
                      SizedBox(height: 10,),

                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child:
                            Text("prix :"+state.livres[index].prix.toString(),
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
