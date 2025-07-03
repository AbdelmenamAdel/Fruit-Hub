import 'package:fruit_hub/core/services/backend/data_service.dart';
import 'package:fruit_hub/core/services/backend/firebase_auth_service.dart';
import 'package:fruit_hub/core/services/backend/firestore_service.dart';
import 'package:fruit_hub/core/services/local/local_storage.dart';
import 'package:fruit_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  sl.registerSingletonAsync<LocalStorage>(() async {
    final prefs = await SharedPreferences.getInstance();
    return LocalStorage(sharedInstance: prefs);
  });
  sl.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  sl.registerSingleton<DatabaseService>(FireStoreService());
  sl.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: sl<FirebaseAuthService>(),
      databaseService: sl<DatabaseService>(),
    ),
  );
  await sl.allReady();
}
