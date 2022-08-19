// ignore_for_file: import_of_legacy_library_into_null_safe

// ignore: avoid_web_libraries_in_flutter, unused_import
import 'dart:js';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/webview/webview.dart';

Widget buildArticleItem(article ,context) => InkWell(
  onTap: () => {
    navigeTo(context, WebViewScreen(article['url']))
  },
  child:   Padding(
   
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
           Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
               image:  DecorationImage(
                image:NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover
               ),
  
            ),
  
           ) ,
  
           const SizedBox(
  
            width:20.0 ,
  
           ),
  
           Expanded(
  
             // ignore: sized_box_for_whitespace
  
             child: Container(
  
              height: 120.0,
  
               child: Column(
  
                mainAxisAlignment: MainAxisAlignment.start,
  
                crossAxisAlignment: CrossAxisAlignment.start,
  
                mainAxisSize: MainAxisSize.min,
  
                children:  [
  
                   Text(
  
                   '${article['title']}',
  
                    style:Theme.of(context).textTheme.bodyText1,
  
                    maxLines: 3,
  
                    overflow: TextOverflow.ellipsis,
  
                   ),
  
                  const SizedBox(
  
                    height: 20.0,
  
                  ),
  
                  Text(
  
                    '${article['publishedAt']}',
  
                    style: const TextStyle(
  
                      color: Colors.grey
  
                    ),
  
                   ),
  
                ],
  
               ),
  
             ),
  
           )
  
  
  
          ],
  
          ),
  
      ),
);

Widget separator()=> Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:   Container(
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey[300],

                         ),
                    );




Widget categoryBuilder(list , context) => ConditionalBuilder(
           // ignore: prefer_is_empty
           condition: list.length > 0,
           builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context ,index)=> buildArticleItem(list[index],context),
            separatorBuilder: (context , index) => separator(),
            itemCount: 8,

           ),

           fallback: (context) => const Center(child: CircularProgressIndicator()),

          );


  void navigeTo(context , widget)=>Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context)=>  widget,
                 ),
              ); 