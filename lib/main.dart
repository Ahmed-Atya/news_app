// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/NewsLayout.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'shared/bloc_observer.dart';
import 'shared/network/local/shared_helper.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   DioHelper.init();
   Bloc.observer = MyBlocObserver();
   await CashHelper.init();
   bool? isDark = CashHelper.getBoolean(key: 'isDark');
   runApp( MyApp(isDark!));
}

class MyApp extends StatelessWidget {
  final bool isDark;
   // ignore: prefer_const_constructors_in_immutables
   MyApp(this.isDark, {Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsAppCubit()..getBusiness()..changeAppMode(fromShared: isDark),
      child: BlocConsumer<NewsAppCubit , NewsAppStates>(
        listener: (context , state){},
        builder: (context , state) {
          return MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData(
            scaffoldBackgroundColor:HexColor('333739'),
            primarySwatch: Colors.deepOrange,
            appBarTheme:  AppBarTheme(
            titleSpacing: 20.0,
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
               statusBarColor: HexColor('333739'),
               statusBarBrightness: Brightness.light,
              ),
              elevation: 0.0,
              titleTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: const IconThemeData(
                color: Colors.white
              ),
              textTheme:const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              ),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.deepOrange,
              elevation: 30.0,
              backgroundColor: Colors.white,
            ),
             textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              ),
          ),
          themeMode: NewsAppCubit.get(context).isDark ? ThemeMode.dark:ThemeMode.light,
          //light theme
          theme: ThemeData(
            primarySwatch:Colors.deepOrange ,
            appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0.0,
            titleSpacing: 20.0,
            titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold 
              ),
              iconTheme: IconThemeData(
                color: Colors.black
              ),
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.black,
                statusBarBrightness: Brightness.dark  
              ), 
            ),
            scaffoldBackgroundColor: Colors.white, 
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
              elevation: 30.0,
              backgroundColor: Colors.white,
            ),
             textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),
              ),
          
          ),
          title: 'News App',
          home:  const Directionality (
            child: Newslayout(title: 'Touch the News'),
            textDirection: TextDirection.ltr,
            ),
        
         );
        },
        
      ),
    );
  }
}

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return const NewsLayout(title: 'Main News Page',);
  }
}
