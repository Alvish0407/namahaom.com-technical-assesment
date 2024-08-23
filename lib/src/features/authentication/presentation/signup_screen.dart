import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_widgets/app_button.dart';
import '../../../constants/app_sizes.dart';
import '../../../routing/app_router.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/exception_handler.dart';
import '../data/firebase_auth_repository.dart';
import 'validations.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // To determine if the sign-up API is in being called
    final isLoading = useState(false);

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final passwordVisible = useState(false);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    Future<void> onSignUp() async {
      if (formKey.currentState!.validate()) {
        final email = emailController.text;
        final password = passwordController.text;
        try {
          isLoading.value = true;
          await handleException(() async {
            final firebaseAuth = ref.read(firebaseAuthProvider);
            await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
          });
        } on AppException catch (err) {
          if (context.mounted) context.errorSnackBar(err.message);
        } finally {
          isLoading.value = false;
        }
      }
    }

    return Scaffold(
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: Sizes.p16),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  gapH64,
                  Text(
                    "Create Account",
                    style: const TextStyle(fontSize: 32).medium,
                  ),
                  gapH12,
                  Text(
                    "Fill your information below",
                    style: TextStyle(fontSize: 14, color: context.appColors.onSurface2),
                  ),
                  gapH64,
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: Sizes.p4),
                      child: Text("Email"),
                    ),
                  ),
                  gapH8,
                  TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "example@gmail.com",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'required';
                      } else if (!value.isValidEmail) {
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                  ),
                  gapH16,
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: Sizes.p4),
                      child: Text("Password"),
                    ),
                  ),
                  gapH8,
                  TextFormField(
                    controller: passwordController,
                    obscureText: !passwordVisible.value,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      errorMaxLines: 5,
                      hintText: "Password",
                      suffixIcon: switch (passwordVisible.value) {
                        false => IconButton(
                            icon: SvgPicture.asset(AppIcons.eyeSlash),
                            onPressed: () => passwordVisible.value = true,
                          ),
                        _ => IconButton(
                            icon: SvgPicture.asset(AppIcons.eye),
                            onPressed: () => passwordVisible.value = false,
                          ),
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'required';
                      } else if (!value.isPasswordStrong) {
                        return '1. At least 8 characters long.\n2. Contains both uppercase and lowercase letters.\n3. Includes at least one numeric digit.\n4. Has at least one special character (e.g., @, #, \$, etc.).';
                      }
                      return null;
                    },
                  ),
                  gapH48,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
                    child: AppButton(
                      label: "Sign Up",
                      onPressed: onSignUp,
                      width: double.infinity,
                      isLoading: isLoading.value,
                    ),
                  ),
                  gapH24,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: context.textTheme.bodyMedium?.color),
                        ),
                        TextSpan(
                          text: "Sign In",
                          style: TextStyle(
                            color: context.colorScheme.primary,
                            decoration: TextDecoration.underline,
                            decorationColor: context.colorScheme.primary,
                          ).medium,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => context.goNamed(AppRoute.signIn.name),
                        ),
                      ],
                    ),
                  ),
                ].animate().fade(duration: 500.ms),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
