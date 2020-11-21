import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pattern/bloc/ArticleBloc/article_bloc.dart';
import 'package:flutter_bloc_pattern/bloc/ArticleBloc/article_event.dart';
import 'package:flutter_bloc_pattern/bloc/ArticleBloc/article_state.dart';
import 'package:flutter_bloc_pattern/model/article_data.dart';
import 'package:flutter_bloc_pattern/repo/ArticleRepo.dart';

class NextScreen extends StatefulWidget {
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  ArticleBloc articleBloc;

  @override
  void initState() {
    super.initState();
    articleBloc = BlocProvider.of<ArticleBloc>(context);
    articleBloc.add(FetchArticleEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Articles"),
      ),
      body: Container(
        child: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is ArticleInitState) {
              return buildLoading();
            } else if (state is ArticleLoadingState) {
              return buildLoading();
            } else if (state is ArticleLoadedState) {
              return buildLoaded(state.articles);
            } else if (state is ArticleErrorState) {
              return buildError(state.msg);
            }
            return null;
            // else {
            //   return buildError("other");
            // }
          },
        ),
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: Text("Loading"),
    );
  }

  Widget buildError(String msg) {
    return Center(
      child: Text(msg),
    );
  }

  Widget buildLoaded(List<Articles> list) {
    return Center(
      child: Text(list.length.toString()),
    );
  }
}
