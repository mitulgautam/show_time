import 'package:flutter/material.dart';
import 'package:show_time/bloc/movieBloc.dart';
import 'package:show_time/constant.dart';
import 'package:show_time/models/moviemodel.dart';
import 'package:show_time/resources/apiprovider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  _refresh() {
    bloc.getMovieList(Constant.FILTER_UPCOMING);

    _refreshController.refreshCompleted();
  }

  RefreshController _refreshController;
  MovieBloc bloc = MovieBloc();
  bool refreshStatus = true;
  @override
  void initState() {
    super.initState();

    _refreshController = RefreshController();

    bloc.getMovieList(Constant.FILTER_POPULAR);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Movie>(
      stream: bloc.streamOutput,
      builder: (BuildContext context, AsyncSnapshot<Movie> snapshot) {
        print("Inside Builder");
        print("DATA STATUS:${snapshot.hasData}");
        
        if (snapshot.hasData) {
          return SmartRefresher(
            onRefresh: _refresh,
            enablePullDown: true,
            child: ListView.builder(
              itemCount: snapshot.data.data.length,
              itemBuilder: (BuildContext context, int index) {
                if (snapshot.hasData) {
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                            height: 256.0,
                            child: Image.network(
                                "http://image.tmdb.org/t/p/w300/${snapshot.data.data[index].poster}")),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${snapshot.data.data[index].title}",
                                style: TextStyle(fontSize: 20.0),
                              ),
                              Text(
                                "${snapshot.data.data[index].description}",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return Container(child: CircularProgressIndicator());
                }
              },
            ),
            controller: _refreshController,
          );
        } else {
          return Center(
              child:
                  Container(height: 32.0, child: CircularProgressIndicator()));
        }
      },
    );
  }
}
