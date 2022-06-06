import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp1flutter/Repository/AdherentRepository.dart';
import 'package:tp1flutter/Repository/LivreRepository.dart';
import 'package:tp1flutter/bloc/adherents/adhrent_bloc.dart';
import 'package:tp1flutter/bloc/livres/livre_bloc.dart';
import 'package:tp1flutter/pages/AboutPage.dart';
import 'package:tp1flutter/pages/adhrents_page.dart';
import 'package:tp1flutter/pages/home.dart';
import 'package:tp1flutter/pages/livre_page.dart';

import 'bloc/adherents/adhrent_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AdhrentBloc(AdhrentState(adherents: [], requestState: RequestState.NONE, errorMessage: ""), AdherentRepository())),
        BlocProvider(create: (context)=>LivreBloc(LivreState(livres: [], requestState: RequestLiverState.NONE, errorMessage: ""), LivreRepository())),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.amber,
            textTheme: TextTheme(
                //bodyText1: TextStyle(color: Colors.grey)
                )),
        routes: {
          "/": (context) => Home(),
          "/Livres": (context) => const LivrePage(),
          "/Adhrents": (context) => const AdherentPage(),
          "/About":(context)=>  AboutPage()
        },
      ),
    );
  }
}
