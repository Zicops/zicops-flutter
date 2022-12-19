import 'package:flutter/material.dart';
import 'package:zicops/views/widgets/PrefixInputField.dart';

class OrganizationTabScreen extends StatefulWidget {
  const OrganizationTabScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OrganizationTabScreen();
  }
}

class _OrganizationTabScreen extends State<OrganizationTabScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        prefixInputField(
            _controller, "assets/images/email.png", "Organisation"),
        const SizedBox(height: 12),
        prefixInputField(
            _controller, "assets/images/email.png", "Organization Unit"),
        const SizedBox(height: 12),
        prefixInputField(
            _controller, "assets/images/email.png", "Learning Space Role"),
        const SizedBox(height: 12),
        prefixInputField(
            _controller, "assets/images/email.png", "Role in Organization"),
        const SizedBox(height: 12),
        prefixInputField(_controller, "assets/images/email.png", "Other Role"),
        const SizedBox(height: 12),
      ],
    );
  }
}
