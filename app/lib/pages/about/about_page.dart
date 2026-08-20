import 'package:flutter/material.dart';
import 'package:yun_lan_transfer/gen/strings.g.dart';
import 'package:yun_lan_transfer/widget/local_send_logo.dart';
import 'package:yun_lan_transfer/widget/responsive_list_view.dart';

class AboutPage extends StatelessWidget {
  const AboutPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.aboutPage.title),
      ),
      body: ResponsiveListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          const SizedBox(height: 20),
          const YunLanTransferLogo(withText: true),
          Text(
            '© ${DateTime.now().year} 云联软件科技',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(t.aboutPage.description.join('\n\n')),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
