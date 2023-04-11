import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala_app/core/app_widgets/custom_textformfield.dart';
import 'package:sala_app/core/app_widgets/main_button.dart';
import 'package:sala_app/core/app_widgets/main_text_button.dart';
import 'package:sala_app/core/functions/navigation.dart';
import 'package:sala_app/core/functions/show_toast.dart';
import 'package:sala_app/core/network/local/cache_helper.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/core/utils/styles.dart';
import 'package:sala_app/features/auth_view/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:sala_app/features/auth_view/presentation/views/signup.dart';
import 'package:sala_app/features/bottom_nav_views/presentation/views/bottom_nav_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              if (state.authModel.status!) {
                print('MMMEESSSAAGGEE ${state.authModel.message}');
                print('TOOKKEEN ${state.authModel.data!.token}');
                CacheHelper.saveDate(
                        key: 'token', value: state.authModel.data!.token)
                    .then((value) =>
                        navigateAndFinsh(context: context, router: BottomNavView()));
              } else {
                print(state.authModel.message);
                showToast(
                    message: state.authModel.message!,
                    state: ToastStates.ERROR);
              }
            } else if (state is LoginFailureState) {
              showToast(message: state.errMessage, state: ToastStates.ERROR);
            }
          },
          builder: (context, state) => Scaffold(
                body: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Login Now', style: Styles.textStyle30),
                            Text(
                              'login now to browse our hot offers ',
                              style: Styles.textStyle14,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            CustomTextFormField(
                              controller: emailController,
                              lableText: 'Email Adress',
                              hintText: 'Enter Email Adress',
                              prifix: Icon(
                                Icons.email,
                                color: AppColors.kPrimaryColor,
                              ),
                              type: TextInputType.emailAddress,
                              style: Theme.of(context).textTheme.bodyText2!,
                              validator: (value) {
                                if (value!.isEmpty || !value.contains('@')) {
                                  return 'Please Enter a valid Email';
                                } else if (value.isEmpty) {
                                  return 'Enter some Text';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              controller: passwordController,
                              lableText: 'Password',
                              hintText: 'Enter Your Password',
                              prifix: Icon(
                                Icons.lock,
                                color: AppColors.kPrimaryColor,
                              ),
                              suffixIcon:
                                  BlocProvider.of<AuthCubit>(context).suffix,
                              suffixFun: () {
                                BlocProvider.of<AuthCubit>(context)
                                    .ChangePasswordVisibility();
                              },
                              obscureText:
                                  BlocProvider.of<AuthCubit>(context).secirty,
                              type: TextInputType.visiblePassword,
                              style: Theme.of(context).textTheme.bodyText2!,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                                if (value.length <= 5) {
                                  return 'Password is too short';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ConditionalBuilder(
                              condition: state is! LoginLoadingState,
                              builder: (context) => MainButton(
                                width: 250,
                                height: 50,
                                text: 'LOGIN',
                                function: () async {
                                  if (formKey.currentState!.validate()) {
                                    await BlocProvider.of<AuthCubit>(context)
                                        .userLogin(
                                            email: emailController.text,
                                            password: passwordController.text);
                                  }
                                },
                              ),
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account ?',
                                  style: Styles.textStyle14,
                                ),
                                MainTextButton(
                                    text: 'Sign Up...',
                                    function: () => navigateAndFinsh(
                                        context: context, router: SignupView()))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
