import 'package:flutter/material.dart';
import 'package:login_trainning_cnv/base/base_view.dart';
import 'package:login_trainning_cnv/widget/serch_trending/search_trending_provider.dart';
import 'package:provider/provider.dart';

class SearchTrending extends StatefulWidget {
  @override
  SearchTrendingState createState() => SearchTrendingState();
}

class SearchTrendingState
    extends BaseView<SearchTrending, SearchTrendingProvider> {
  @override
  void initState() {
    super.initState();
    provider.getSearchTrendingAPI();
  }

  @override
  Widget body() {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          color: Colors.green,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(icon: Icon(Icons.search), onPressed: null),
                  Expanded(
                    child: Text('Tim kiem noi bat'),
                    flex: 1,
                  )
                ],
              ),
              Container(
                  // height: 300,
                  // width: double.infinity,
                  child: Consumer<SearchTrendingNotifier>(
                      builder: (context, listSearchTrending, _) {
                    return Wrap(
                      children: listSearchTrending.value
                          .map((e) => chipChoice(e))
                          .toList(),
                    );
                  }))
            ],
          ),
        ),
      ],
    );
  }

  @override
  SearchTrendingProvider initProverder() {
    return SearchTrendingProvider(this);
  }

  Widget chipChoice(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, top: 5, right: 2),
      child: Container(
        child: Chip(
            label: Text(
          text,
          style: TextStyle(fontFamily: 'Regular'),
        )),
      ),
    );
  }
}
