// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_print, unnecessary_null_comparison, unused_import

import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/bussiness/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/shared_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsAppCubit extends Cubit<NewsAppStates> {
  NewsAppCubit() : super(NewsInitialState());
  static NewsAppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen() ,  
  ];
  List<BottomNavigationBarItem> bottomItems  = [
    const BottomNavigationBarItem(
      icon:Icon(
        Icons.business
        ),
        label: 'Business'
   ),
     const BottomNavigationBarItem(
      icon:Icon(
        Icons.sports_football_outlined
        ),
        label: 'Sports'
   ),
     const BottomNavigationBarItem(
      icon:Icon(
        Icons.science_sharp
        ),
        label: 'Science'
   ),
  ];

  void changeBottomNavbar(int index)
  {
   currentIndex = index;
   if(index == 1) {
     getSports();
   }
   if(index == 2) {
     getScience();
   }
   emit(NewsBottomNavbarState());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
       query: {
        'country': 'eg',
        'category' : 'business',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
       },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
       print(error);
       emit(NewsGetBusinessErrorState());
    });
  }


  void getScience()
  {
    if(science.isEmpty)
    {
     emit(NewsGetScienceLoadingState());
     science = [];
     DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category' :'science',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error){
        print(error);
        emit(NewsGetScienceErrorState());
      }); 
    }else{
       emit(NewsGetScienceSuccessState());
    }
      
  }
  void getSports()
  {
    if(sports.isEmpty)
    {
      emit(NewsGetSportLoadingState());
      sports = [];
      DioHelper.getData(
      url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category' :'sport',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        sports = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetSportSuccessState());
      }).catchError((error){
        print(error);
        emit(NewsGetSportErrorState());
      });
    }else{
     emit( NewsGetSportSuccessState());
    }
    
  }

  ThemeMode appMode = ThemeMode.dark;
  bool isDark = false;
  void changeAppMode({bool? fromShared})
  {
    if(fromShared != null)
    {
      isDark = fromShared;
      emit(NewsAppModeCahngeState());
    }
    else {
      isDark = ! isDark;
      CashHelper.putBoolean(key: 'isDark' , value:isDark).then((value) {
       emit(NewsAppModeCahngeState());
     });
    }
  }
   List<dynamic> search = [];
  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());
    if(search.isEmpty)
    {
     search = [];
     DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q' : value,
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        search = value.data['articles'];
        print(search[0]['title']);
        emit(NewsGetSearchSuccessState());
      }).catchError((error){
        print(error);
        emit(NewsGetSearchErrorState());
      }); 
    }else{
       emit(NewsGetSearchSuccessState());
    }
      
  }
}
