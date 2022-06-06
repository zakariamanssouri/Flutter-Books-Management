import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp1flutter/bloc/adherents/adhrent_bloc.dart';

import '../bloc/adherents/adhrent_event.dart';

class DeleteButton extends StatelessWidget {
  final AdhrentEvent adhrentEvent;
  final String text;
  const DeleteButton({Key? key,required this.adhrentEvent,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      context.read()<AdhrentBloc>().add(adhrentEvent);
    }, child: Text(text),
      style: ElevatedButton.styleFrom(primary: (context.read<AdhrentBloc>().lastEvent ==text)? Colors.amber:Colors.green),);
  }
}
