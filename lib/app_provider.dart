import 'package:provider/provider.dart';
import 'package:tchilla/viewmodel/splash_viewmodel.dart';

final appProviders = [
  ChangeNotifierProvider(create: (_) => SplashViewmodel()),
  
];