import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/authentication/data/firebase_auth_repository.dart';
import '../features/authentication/presentation/signin_screen.dart';
import '../features/authentication/presentation/signup_screen.dart';
import '../features/cart/presentation/screens/cart_screen.dart';
import '../features/checkout/presentation/screens/order_summary_screen.dart';
import '../features/checkout/presentation/screens/payment_method_screen.dart';
import '../features/checkout/presentation/screens/payment_success_screen.dart';
import '../features/checkout/presentation/screens/select_shipping_address_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/products/presentation/screens/product_details_screen.dart';
import 'go_router_refresh_stream.dart';
import 'root_scaffold.dart';

part 'app_router.g.dart';

enum AppRoute {
  signUp,
  signIn,
  home,
  cart,
  productDetails,
  selectShippingAddress,
  paymentMethod,
  paymentSuccess,
  orderSummary,
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'main');

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  // rebuild GoRouter when app startup state changes
  final firebaseAuth = ref.watch(firebaseAuthProvider);

  return GoRouter(
    initialLocation: '/signIn',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    refreshListenable: GoRouterRefreshStream(
      firebaseAuth.authStateChanges(),
    ),
    redirect: (context, state) {
      final isLoggedIn = firebaseAuth.currentUser != null;
      final path = state.uri.path;
      if (isLoggedIn) {
        if (path.startsWith('/signUp') || path.startsWith('/signIn')) {
          return '/home';
        }
      } else {
        if (!path.startsWith('/signIn') && !path.startsWith('/signUp')) {
          return '/signIn';
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/signIn',
        name: AppRoute.signIn.name,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/signUp',
        name: AppRoute.signUp.name,
        builder: (context, state) => const SignUpScreen(),
      ),
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) => NoTransitionPage<dynamic>(
          child: RootScaffold(navigationShell: navigationShell),
        ),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/home',
                name: AppRoute.home.name,
                pageBuilder: (context, state) {
                  return const MaterialPage<dynamic>(child: HomeScreen());
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/product-details/:id',
        name: AppRoute.productDetails.name,
        pageBuilder: (context, state) {
          final id = int.tryParse(state.pathParameters['id'] ?? '-1');
          return MaterialPage<dynamic>(child: ProductDetailsScreen(id: id!));
        },
      ),
      GoRoute(
        path: '/cart',
        name: AppRoute.cart.name,
        pageBuilder: (context, state) {
          return const MaterialPage<dynamic>(child: CartScreen());
        },
        routes: [
          GoRoute(
            path: 'select-shipping-address',
            name: AppRoute.selectShippingAddress.name,
            pageBuilder: (context, state) {
              return const MaterialPage<dynamic>(child: SelectShippingAddressScreen());
            },
          ),
          GoRoute(
            path: 'payment-method',
            name: AppRoute.paymentMethod.name,
            pageBuilder: (context, state) {
              return const MaterialPage<dynamic>(child: PaymentMethodScreen());
            },
          ),
          GoRoute(
            path: 'payment-success',
            name: AppRoute.paymentSuccess.name,
            pageBuilder: (context, state) {
              return const MaterialPage<dynamic>(child: PaymentSuccessScreen());
            },
          ),
          GoRoute(
            path: 'order-summary',
            name: AppRoute.orderSummary.name,
            pageBuilder: (context, state) {
              return const MaterialPage<dynamic>(child: OrderSummaryScreen());
            },
          ),
        ],
      ),
    ],
  );
}
