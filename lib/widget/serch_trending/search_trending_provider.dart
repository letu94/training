import 'package:login_trainning_cnv/base/base_notifier.dart';
import 'package:login_trainning_cnv/base/base_provider.dart';
import 'package:login_trainning_cnv/widget/serch_trending/search_trending_widget.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class SearchTrendingProvider extends BaseProvider<SearchTrendingState> {
  SearchTrendingProvider(SearchTrendingState state) : super(state);
  final List<String> searchTrending = [
    'rose',
    'white',
    ' gadson',
    'orwell',
    'lavandar',
    'computer',
    'other'
  ];

  SearchTrendingNotifier searchTrendingNotifier =
      new SearchTrendingNotifier(['rose']);

  @override
  List<BaseNotifier> initNotifiers() {
    return [searchTrendingNotifier];
  }

  getSearchTrendingAPI() {
    searchTrendingNotifier.value = searchTrending;
  }
}

class SearchTrendingNotifier extends BaseNotifier<List<String>> {
  SearchTrendingNotifier(List<String> value) : super(value);

  @override
  SingleChildWidget provider() {
    return ChangeNotifierProvider<SearchTrendingNotifier>(create: (_) => this);
  }
}
