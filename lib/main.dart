import 'package:flutter/material.dart';
import 'package:renov_proprietaire_app/values/colors.dart';
import 'package:renov_proprietaire_app/views/pages/home_page.dart';
import 'package:renov_proprietaire_app/views/pages/work_type_selection_page.dart';
import 'package:renov_proprietaire_app/views/widgets/background_green_wave.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renov_proprietaire_app/blocs/work_selection/select_work_bloc.dart';
import 'package:renov_proprietaire_app/views/widgets/green_button.dart';
import 'package:renov_proprietaire_app/views/widgets/project_side_button.dart';


void main() {
  runApp(
  MultiBlocProvider(providers: [
    BlocProvider<SelectWorkBloc>(create: (_) => SelectWorkBloc())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App renov',
      theme: ThemeData(fontFamily: 'Poppins', primaryColor: ColorsRenov.primaryGreen),
      home: HomePage(),
    );
  }
}
