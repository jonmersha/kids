import 'package:get/get.dart';
import 'package:kids/src/services/model/vodeo.dart';
import 'package:kids/src/services/repository/repo_service.dart';
import 'package:kids/src/utils/app_constants.dart';

class Controllers extends GetxController {
  final Services Repo;
  Controllers({required this.Repo});
  List<dynamic> _list = [];
  List<dynamic> get list => _list;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getList(String path) async {
    Response response = await Repo.getAll(path);
print(response.body);

    if (response.statusCode == 200) {
      _list = [];
      _list.addAll(Video.fromJson(response.body).data!);

      _isLoaded = true;
      update();
      _isLoaded = true;
    } else {
      print(response.statusText);
    }
  }
}
