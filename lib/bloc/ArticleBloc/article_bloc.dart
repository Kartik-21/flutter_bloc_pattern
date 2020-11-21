import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/bloc/ArticleBloc/article_event.dart';
import 'package:flutter_bloc_pattern/bloc/ArticleBloc/article_state.dart';
import 'package:flutter_bloc_pattern/model/article_data.dart';
import 'package:flutter_bloc_pattern/repo/ArticleRepo.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleRepo articleRepo;

  ArticleBloc({ArticleState initialState, @required this.articleRepo})
      : super(ArticleInitState());

  @override
  void onTransition(Transition<ArticleEvent, ArticleState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    if (event is FetchArticleEvent) {
      yield ArticleLoadingState();
      try {
        List<Articles> art = await articleRepo.getArticles();
        yield ArticleLoadedState(articles: art);
      } catch (e) {
        yield ArticleErrorState(msg: e.toString());
      }
    }
  }
}
