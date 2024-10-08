import 'package:flutter/widgets.dart';

class CompanyLogoWidget extends StatelessWidget {
  const CompanyLogoWidget({super.key,required this.companyUrl});
  final String companyUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),),
                  child: Image.network(companyUrl),
                );
  }
}