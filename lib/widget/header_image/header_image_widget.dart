import 'package:flutter/material.dart';
import 'package:login_trainning_cnv/base/base_view.dart';
import 'package:login_trainning_cnv/widget/header_image/header_image_provider.dart';
import 'package:login_trainning_cnv/widget/header_trending/header_trending_widget.dart';
import 'package:provider/provider.dart';

class HeaderImage extends StatefulWidget {
  @override
  HeaderImageState createState() => HeaderImageState();
}

class HeaderImageState extends BaseView<HeaderImage, HeaderImageProvider> {
  
@override
  void initState() {
    super.initState();
provider.getHeaderImageAPI();
// provider.countDownTimerHeader();
  }

  @override
  Widget body() {
    return Container(
      height: 200,
      child: Consumer<HeaderImageNotifier>(builder: (context, listHeaderImage, _){
        return PageView.builder(
          itemCount: listHeaderImage.value.length,
      controller: provider.controllerPageView,
      itemBuilder: (context, index){
        return headerImage(listHeaderImage.value[index].urlImage == null ? '' : listHeaderImage.value[index].urlImage[0].image[0]);
      }
    );
      })
      
    );
  }

  @override
  HeaderImageProvider initProverder() {
    return HeaderImageProvider(this);
  }
}
    