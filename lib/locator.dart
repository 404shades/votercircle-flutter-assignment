import 'package:disqus_system/core/services/post_service.dart';
import 'package:disqus_system/utils/profile_generator.dart';
import 'package:get_it/get_it.dart';
GetIt locator = GetIt.I;
void setUpLocator(){
  locator.registerLazySingleton(()=>PostService());
  locator.registerLazySingleton(()=>ProfileGenerator());
}