import 'package:flutter/cupertino.dart';
import 'package:sca_mentee/model/photo_model.dart';
import 'package:sca_mentee/services/web_services.dart';
import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends ChangeNotifier {
  PhotoModel _photoModel;
  PhotoModel get photoModel => _photoModel;

  set photoModel(PhotoModel val) {
    _photoModel = val;
    notifyListeners();
  }

  Future<void> loadPhoto() async {
    try {
      var photos = await ApiUrl().randomPhoto();
      _photoModel = photos;

      notifyListeners();
    } catch (e) {}
  }
}
