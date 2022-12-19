import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../widgets/PrefixInputField.dart';

class PersonalTabScreen extends StatefulWidget {
  Function() changeTab;
  PersonalTabScreen(this.changeTab, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PersonalTabScreen();
  }
}

class _PersonalTabScreen extends State<PersonalTabScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  "assets/images/personal_bg.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: _height * 0.30,
                ),
                const Positioned(
                    bottom: -50,
                    child: CircleAvatar(
                      foregroundImage:
                          AssetImage("assets/images/personal_bg.png"),
                      radius: 56,
                    ))
              ],
            ),
           const Spacer(),
           Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 20, top: 80),
                    child: Column(
                      children: [
                        prefixInputField(_controller, "assets/images/email.png",
                            "Firstname"),
                        const SizedBox(height: 12),
                        prefixInputField(
                            _controller, "assets/images/email.png", "Lastname"),
                        const SizedBox(height: 12),
                        prefixInputField(
                            _controller, "assets/images/email.png", "Email"),
                        const SizedBox(height: 12),
                        prefixInputField(_controller, "assets/images/email.png",
                            "+91| Contact Number"),
                        const SizedBox(height: 12),
                        InkWell(
                          onTap: () {
                            print("on login");
                            widget.changeTab();
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: [primaryColor, gradientTwo]),
                                borderRadius: BorderRadius.circular(5)),
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: const Text(
                                'Next',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
          ],
        ),
      )
    ]);
    // return Scaffold(body: LayoutBuilder(builder: (context, constraint) {
    //   return SingleChildScrollView(
    //       child: ConstrainedBox(
    //           constraints: BoxConstraints(minHeight: constraint.maxHeight),
    //           child: IntrinsicHeight(
    //             child: Column(
    //               children: [
    //                 Stack(
    //                   clipBehavior: Clip.none,
    //                   children: [
    //                     Image.asset(
    //                       "assets/images/personal_bg.png",
    //                       fit: BoxFit.cover,
    //                       width: double.infinity,
    //                       height: _height * 0.30,
    //                     ),
    //                     const Positioned(
    //                         bottom: -50,
    //                         child: CircleAvatar(
    //                           foregroundImage:
    //                               AssetImage("assets/images/personal_bg.png"),
    //                           radius: 56,
    //                         ))
    //                   ],
    //                 ),
    //                 const Spacer(),
    //                 Padding(
    //                     padding: const EdgeInsets.only(
    //                         left: 20, right: 20, bottom: 20, top: 80),
    //                     child: Column(
    //                       children: [
    //                         prefixInputField(_controller,
    //                             "assets/images/email.png", "Firstname"),
    //                         const SizedBox(height: 12),
    //                         prefixInputField(_controller,
    //                             "assets/images/email.png", "Lastname"),
    //                         const SizedBox(height: 12),
    //                         prefixInputField(_controller,
    //                             "assets/images/email.png", "Email"),
    //                         const SizedBox(height: 12),
    //                         prefixInputField(
    //                             _controller,
    //                             "assets/images/email.png",
    //                             "+91| Contact Number"),
    //                         const SizedBox(height: 12),
    //                         InkWell(
    //                           onTap: () {
    //                             print("on login");
    //                           },
    //                           child: Ink(
    //                             decoration: BoxDecoration(
    //                                 gradient: const LinearGradient(
    //                                     colors: [primaryColor, gradientTwo]),
    //                                 borderRadius: BorderRadius.circular(5)),
    //                             child: Container(
    //                               alignment: Alignment.center,
    //                               padding:
    //                                   const EdgeInsets.symmetric(vertical: 16),
    //                               child: const Text(
    //                                 'Next',
    //                                 textAlign: TextAlign.center,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ],
    //                     ))
    //               ],
    //             ),
    //           )));
    // }));
  }
}
