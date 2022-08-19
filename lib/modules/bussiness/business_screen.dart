// ignore: file_names
// ignore_for_file: camel_case_types, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit , NewsAppStates>(
      listener: (context , state){},

      builder: (context, state) {
        var list = NewsAppCubit.get(context).business;
        return categoryBuilder(list ,context);
       }
      );
  }
}
