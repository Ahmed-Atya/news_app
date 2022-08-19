// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
   SearchScreen({ Key? key }) : super(key: key);
  var searchControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context ,state){},
      builder: (context, state) {
       var list = NewsAppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children:  [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black38),
                  controller: searchControler,
                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return ('search Must not be empty!');
                    }
                  },
                  decoration: const InputDecoration(
                      labelText: 'Search for anything',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontSize: 17,
                        fontFamily: 'AvenirLight',
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black38,
                      )),
                  // ignore: avoid_types_as_parameter_names
                  onChanged: (ValueKey) {
                    NewsAppCubit.get(context).getSearch(ValueKey);
                  },
                ),
              ), 
              Expanded(child: buildArticleItem(list ,context)), 
            ],
            
            ),
        );
      });
       
  }
}  