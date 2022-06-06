import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp1flutter/bloc/adherents/adhrent_bloc.dart';

import '../bloc/adherents/adhrent_event.dart';


class ButtonLoadAdhrent extends StatelessWidget {
  final AdhrentEvent adhrentEvent;
  final String text;
  const ButtonLoadAdhrent({Key? key,required this.adhrentEvent,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      context.read<AdhrentBloc>().add(adhrentEvent);
    }, child: Text("load all adhrents"),);
  }
}