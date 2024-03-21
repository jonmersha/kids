import 'package:get/get.dart';
import 'package:kids/src/services/model/play_list.dart';
import 'package:kids/src/services/repository/repo_service.dart';

class PlayListController extends GetxController {
  final Services serviceRepo;
  PlayListController({required this.serviceRepo});
  List<dynamic> _list = [];
  List<dynamic> get list => _list;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getList(String path) async {
    Response response = await serviceRepo.getAll(path);
    print(response.body);
    if (response.statusCode == 200) {
      _list = [];
      _list.addAll(PlayList.fromJson(response.body).data!);

      _isLoaded = true;
      update();
      _isLoaded = true;
    } else {
      print(response.statusText);
    }
  }
}
