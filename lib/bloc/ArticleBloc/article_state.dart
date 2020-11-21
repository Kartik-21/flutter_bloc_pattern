import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/model/article_data.dart';

abstract class ArticleState extends Equatable {}

class ArticleInitState extends ArticleState {
  @override
  List<Object> get props => [];
}

class ArticleLoadingState extends ArticleState {
  @override
  List<Object> get props => [];
}

class ArticleLoadedState extends ArticleState {
final  List<Articles> articles;

  ArticleLoadedState({@required this.articles});

  @override
  List<Object> get props => [];
}

class ArticleErrorState extends ArticleState {
 final String msg;

  ArticleErrorState({@required this.msg});

  @override
  List<Object> get props => [];
}
