import 'package:flutter/material.dart';
import 'package:sala_app/core/functions/navigation.dart';
import 'package:sala_app/core/network/local/cache_helper.dart';
import 'package:sala_app/features/intro_view/presentation/views/welcome_view.dart';
import 'package:sala_app/features/onboarding_view/data/onboarding_model.dart';
import 'package:sala_app/features/onboarding_view/presentation/views/widgets/onboarding_button.dart';
import 'package:sala_app/features/onboarding_view/presentation/views/widgets/onboarding_item.dart';
import 'package:sala_app/features/onboarding_view/presentation/views/widgets/onboarding_text_button.dart';
import 'package:sala_app/features/onboarding_view/presentation/views/widgets/smooth_indicator.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  List<OnBoardingModel> boarding = [
    OnBoardingModel(
        image: 'assets/images/onboarding_1.png',
        title: 'Online Shopping',
        description: 'You can shopping anytime, anywhere that you want.'),
    OnBoardingModel(
        image: 'assets/images/onboarding_2.png',
        title: 'Mobile Payment',
        description:
            'Download our shopping application and buy using your smartphone or laptop.'),
    OnBoardingModel(
        image: 'assets/images/onboarding_3.png',
        title: 'Delivery Service',
        description:
            'Modern delivering technologies.The products you order will be delivered to your address.'),
  ];
  PageController boardController = PageController();
  bool isLast = false;

  void navigateMethod({required int index}) {
    if (index == boarding.length - 1) {
      setState(() {
        isLast = true;
      });
    } else {
      setState(() {
        isLast = false;
      });
    }
  }

  void submit() {
    CacheHelper.saveDate(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinsh(context: context, router: WelcomeView());
        //GoRouter.of(context).push(Routes.kWelcomeView);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                    itemCount: boarding.length,
                    controller: boardController,
                    physics: BouncingScrollPhysics(),
                    onPageChanged: (index) {
                      navigateMethod(index: index);
                    },
                    itemBuilder: ((context, index) {
                      return OnBoardintItem(boarding: boarding[index]);
                    })),
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmoothBoardingIndicator(
                              boarding: boarding,
                              pageController: boardController),
                        ],
                      ),
                      isLast
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: OnBoardingButton(
                                  text: 'Start',
                                  paddingH: 80,
                                  paddingV: 20,
                                  functuon: submit))
                          : Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  OnBoardingTextButton(
                                    function: submit,
                                  ),
                                  OnBoardingButton(
                                      text: 'NEXT',
                                      paddingH: 30,
                                      paddingV: 20,
                                      functuon: () {
                                        boardController.nextPage(
                                            duration: Duration(
                                                microseconds: 200), //750,
                                            curve:
                                                Curves.fastLinearToSlowEaseIn);
                                      }),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
