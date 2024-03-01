import 'package:antenatal_app/features/account_type/data/repos/account_type_repo_impl.dart';
import 'package:antenatal_app/features/login/data/repos/login_repo_impl.dart';
import 'package:antenatal_app/features/signup/data/repos/signup_repo_impl.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<SignUpRepoImpl>(SignUpRepoImpl());
  locator.registerSingleton<AccountTypeRepoImpl>(AccountTypeRepoImpl());
  locator.registerSingleton<LoginRepoImpl>(LoginRepoImpl());
}
