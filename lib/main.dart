import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makdad_app/core/utils/cashe_helper.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/core/utils/simple_bloc_observer.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_cubit.dart';
import 'package:makdad_app/features/data/presentation/views/home_views.dart';
import 'package:makdad_app/features/data/presentation/views/social_home_view.dart';
import 'package:makdad_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();
  await CasheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Widget widget;
   uId = CasheHelper.getData(key: 'uId');
  if (uId != '') {
    widget = const SocialHomeView();
  } else {
    widget = const HomeView();
  }

  runApp(MyApp(
    starWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.starWidget});
  final Widget starWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<SocialCubit>(create:(context) =>  SocialCubit()..getUserData(),)],
      child: MaterialApp(
        theme: ThemeData(
          iconTheme:const IconThemeData(color: Colors.grey),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: defaultColor,
            backgroundColor: Colors.white,
            elevation: 20.0,
            unselectedItemColor: Colors.grey
          )
        ),
        debugShowCheckedModeBanner: false,
        home: starWidget,
      ),
    );
  }
}
