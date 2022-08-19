// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: unused_import
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class Newslayout extends StatelessWidget {
   const Newslayout({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsAppCubit , NewsAppStates>(
      
      listener: (context, state) {
      } ,
      builder: (context, state) {
       var cubit = NewsAppCubit.get(context); 
        return Scaffold(
        appBar: AppBar(
          title: const Text(
             'News App On your Pocket'
          ), 
          actions: [
            IconButton(
              onPressed: (){
                // navigeTo(context,SearchScreen());
              },
              icon: const Icon(
                Icons.search
              ),
              ),
               IconButton(
              onPressed: (){
                NewsAppCubit.get(context).changeAppMode();
              },
              icon: const Icon(
                Icons.brightness_3_outlined
              ),
              )   
          ],
        ),
        body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
         currentIndex: cubit.currentIndex,
         onTap: (index)
         {
           cubit.changeBottomNavbar(index);
         },
          items: cubit.bottomItems,
        ), 
      );
      },
    );
  }
}
 