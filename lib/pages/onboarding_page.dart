import 'package:edu_vista/widgets/buttons/my_elevated_button.dart';
import 'package:edu_vista/widgets/items/onboarding_item.dart';
import 'package:flutter/material.dart';

import '../utils/color_utility.dart';
import '../utils/image_utility.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;
  late PageController onBoardingController;

  @override
  void initState() {
    super.initState();
    onBoardingController = PageController(initialPage: 0);
  }

  void onPageChangedEx(int page) {
    setState(() {
      currentPage = page;
    });
  }

  void skipToEnd() {
    onBoardingController.animateToPage(
      3,
      duration: const Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
  }

  void goToNextPage() {
    onBoardingController.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
  }

  void goToPreviousPage() {
    onBoardingController.previousPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    onBoardingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            if (currentPage != 3) buildSkipButton(),
            buildPageView(),
            buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget buildSkipButton() {
    return Positioned(
        top: 10,
        right: 10,
        child: TextButton(
          onPressed: skipToEnd,
          child: const Text(
            'Skip',
            style: TextStyle(
                color: ColorUtility.mediumBlack, fontWeight: FontWeight.w300),
          ),
        ));
  }

  Widget buildPageView() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, right: 60, left: 60),

      //On Boarding items
      child: PageView(
        controller: onBoardingController,
        onPageChanged: onPageChangedEx,
        children: const [
          //Item #1 : custom space/image height
          OnBoardingItem(
            imagePath: ImageUtility.certifications,
            title: 'Certification and Badges',
            description: 'Earn a certificate after completion of every course',
            sizedBoxHeight: 180,
            imageHeight: 290,
          ),

          //Item #2
          OnBoardingItem(
            imagePath: ImageUtility.progressTracking,
            title: 'Progress Tracking',
            description: 'Check your Progress of every course',
          ),

          //Item #3
          OnBoardingItem(
            imagePath: ImageUtility.offlineAccess,
            title: 'Offline Access',
            description: 'Make your course available offline',
          ),

          //Item #4
          OnBoardingItem(
            imagePath: ImageUtility.courseCatalog,
            title: 'Course Catalog',
            description: 'View in which courses you are enrolled',
          ),
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: 40,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: currentPage == index
                    ? ColorUtility.secondary
                    : ColorUtility.grey)),
      ),
    );
  }

  Widget buildArrows() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //First Page ? don't show previous button
        currentPage == 0
            ? const SizedBox()
            : IconButton(
                onPressed: goToPreviousPage,
                icon: const Icon(Icons.arrow_circle_left),
                color: Colors.grey.shade300,
                iconSize: 65,
              ),
        IconButton(
          onPressed: goToNextPage,
          icon: const Icon(Icons.arrow_circle_right),
          color: ColorUtility.secondary,
          iconSize: 65,
        ),
      ],
    );
  }

  //The indicator & (Arrows || register button)
  Widget buildBottomSection() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildIndicator(),
            //Last page ? Show register button : show the arrows
            currentPage == 3
                ? Padding(
                    padding: const EdgeInsets.only(
                        bottom: 75, top: 31, right: 30, left: 30),
                    child: MyElevatedButton(
                        label: 'Let\'s Start Learning!', onPressed: () {}))
                : Padding(
                    padding: const EdgeInsets.only(
                        bottom: 60, top: 15, right: 30, left: 30),
                    child: buildArrows()),
          ],
        ));
  }
}
