import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noted/controller/Splashscreen_controller.dart';
import 'package:noted/components/custom_color.dart';

class SplashscreenPage extends StatefulWidget {
  SplashscreenPage({super.key});

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage>
    with TickerProviderStateMixin {
  final splashController = Get.find<SplashscreenController>();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.lightBeige,
              AppColors.darkBeige,
              AppColors.cream,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Icon/Logo (tanpa container)
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/cat.jpg',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 30),
              
              // App Name
              Text(
                "Noted",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 10),
              
              // Tagline
              Text(
                "Your Personal Todo Manager",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.offWhite,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 40),
              
              // Bouncing Dots Loading Indicator
              BouncingDotsIndicator(
                animationController: _animationController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BouncingDotsIndicator extends StatelessWidget {
  final AnimationController animationController;

  const BouncingDotsIndicator({
    Key? key,
    required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            final value = (animationController.value - (index * 0.2)).clamp(0.0, 1.0);
            return Transform.translate(
              offset: Offset(0, -10 * (value < 0.5 ? 2 * value : 2 * (1 - value))),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}