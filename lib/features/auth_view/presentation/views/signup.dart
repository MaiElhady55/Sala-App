import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala_app/core/app_widgets/custom_textformfield.dart';
import 'package:sala_app/core/app_widgets/main_button.dart';
import 'package:sala_app/core/app_widgets/main_text_button.dart';
import 'package:sala_app/core/functions/navigation.dart';
import 'package:sala_app/core/functions/show_toast.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/core/utils/styles.dart';
import 'package:sala_app/features/auth_view/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:sala_app/features/auth_view/presentation/views/login_view.dart';
import 'package:sala_app/features/intro_view/presentation/views/welcome_view.dart';

class SignupView extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  bool secirty = true;
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
            listener: (BuildContext context, state) {
          if (state is RegisterSuccessState) {
            if (state.registerModel.status!) {
              print(state.registerModel.message);
              print('REG TOKEN ${state.registerModel.data!.token}');
              showToast(
                  message: state.registerModel.message!,
                  state: ToastStates.SUCCESS);
              navigateAndFinsh(context: context, router: WelcomeView());
            } else {
              print(state.registerModel.message);
              showToast(
                  message: state.registerModel.message!,
                  state: ToastStates.ERROR);
            }
          }
        }, builder: (BuildContext context, state) {
          return Scaffold(
              body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign Up Now',
                        style: Styles.textStyle30,
                      ),
                      Text(
                        'login now to browse our hot offers ',
                        style: Styles.textStyle14,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomTextFormField(
                        style: Theme.of(context).textTheme.bodyText2!,
                        controller: nameController,
                        type: TextInputType.name,
                        lableText: 'Name',
                        hintText: 'Enter Full Name',
                        obscureText: !secirty,
                        prifix: Icon(
                          Icons.person,
                          color: AppColors.kPrimaryColor,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        style: Theme.of(context).textTheme.bodyText2!,
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        lableText: 'Email',
                        hintText: 'Enter Email Adress',
                        obscureText: !secirty,
                        prifix: Icon(
                          Icons.email,
                          color: AppColors.kPrimaryColor,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          if  (!value.contains('@')) {
                            return 'Please a valid Email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                          style: Theme.of(context).textTheme.bodyText2!,
                          controller: phoneController,
                          type: TextInputType.phone,
                          lableText: 'Phone',
                          hintText: 'Enter your phone',
                          prifix: Icon(
                            Icons.phone,
                            color: AppColors.kPrimaryColor,
                          ),
                          obscureText: !secirty,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            if (value.length <= 10) {
                              return 'Please Enter right number';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                          style: Theme.of(context).textTheme.bodyText2!,
                          controller: passController,
                          type: TextInputType.text,
                          lableText: 'Password',
                          hintText: 'Enter Your Password',
                          prifix: Icon(
                            Icons.lock,
                            color: AppColors.kPrimaryColor,
                          ),
                          suffixIcon: AuthCubit.get(context).suffix,
                          suffixFun: () {
                            AuthCubit.get(context).ChangePasswordVisibility();
                          },
                          obscureText: AuthCubit.get(context).secirty,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            if (value.length <= 5) {
                              return 'Please enter long password';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      ConditionalBuilder(
                        condition: state is! RegisterLoadingState,
                        builder: (context) => MainButton(
                          height: 50,
                          width: 250,
                          text: 'Sign Up',
                          function: () async{
                            if (formkey.currentState!.validate()) {
                             await AuthCubit.get(context).userSignup(
                                  email: emailController.text,
                                  password: passController.text,
                                  name: nameController.text,
                                  phone: phoneController.text);
                            }
                          },
                        ),
                        fallback: (context) => CircularProgressIndicator(),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account ?',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF8D8E98),
                              )),
                          MainTextButton(
                            text: 'LogIn',
                            function: () {
                              navigateTo(router: LoginView(), context: context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
        }));
  }
}
