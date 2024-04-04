import 'package:ecommerce_market_ui/Auth/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = ChangeNotifierProvider((ref) => AuthController());