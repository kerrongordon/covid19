import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-bottom-dialog.dart';
import 'package:covid19/models/contact-model.dart';
import 'package:covid19/providers/contact-provider.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCardList extends HookWidget {
  const ContactCardList();

  @override
  Widget build(BuildContext context) {
    final homeContact = useProvider(contactProvider);
    return homeContact.when(
      data: (data) => ContactList(data: data),
      loading: () => Container(),
      error: (_, __) => Container(),
    );
  }
}

class ContactList extends StatelessWidget {
  final Contact data;
  const ContactList({this.data});

  Future<bool> _call(String phoneNumber) async {
    final String call = 'tel:+$phoneNumber';
    return await canLaunch(call)
        ? await launch(call)
        : throw 'Could not launch $phoneNumber';
  }

  Future<bool> _openUrl(String url) async {
    return await canLaunch(url)
        ? await launch(url)
        : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Expanded(
              child: FadeInLeft(
                child: CardComponent(
                  color: Colors.blue,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  onTap: () => _call(data.hotlineone.phonenumber),
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Ionicons.ios_call,
                          size: 30,
                          color: Colors.white,
                        ),
                        Divider(color: Colors.white.withOpacity(0.5)),
                        Text(
                          data.hotlineone.title,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ZoomIn(
                child: CardComponent(
                  color: Colors.green,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  onTap: () async {
                    showModalBottomSheet(
                      context: context,
                      elevation: 30,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child: KgpBottomDialog(
                            title: '${data.country} Resources',
                            child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                ListTile(
                                  leading: const Icon(
                                    Ionicons.ios_link,
                                    color: ColorTheme.primary,
                                  ),
                                  title: const Text('Website'),
                                  trailing: const Icon(
                                    Ionicons.ios_arrow_forward,
                                    color: ColorTheme.primary,
                                  ),
                                  onTap: () => _openUrl(data.website),
                                ),
                                // Divider(),
                                ListTile(
                                  leading: const Icon(
                                    Ionicons.logo_facebook,
                                    color: ColorTheme.primary,
                                  ),
                                  title: const Text('Facebook'),
                                  trailing: const Icon(
                                    Ionicons.ios_arrow_forward,
                                    color: ColorTheme.primary,
                                  ),
                                  onTap: () =>
                                      _openUrl(data.socialmedia.facebook),
                                ),
                                // Divider(),
                                ListTile(
                                  leading: const Icon(
                                    Ionicons.ios_pin,
                                    color: ColorTheme.primary,
                                  ),
                                  title: Text(data.address.title),
                                  trailing: const Icon(
                                    Ionicons.ios_arrow_forward,
                                    color: ColorTheme.primary,
                                  ),
                                  onTap: () async {
                                    final availableMaps =
                                        await MapLauncher.installedMaps;
                                    await availableMaps.first.showMarker(
                                      description: data.address.detail,
                                      coords: Coords(
                                        data.address.lat,
                                        data.address.long,
                                      ),
                                      title: data.address.title,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Ionicons.ios_apps,
                          size: 30,
                          color: Colors.white,
                        ),
                        Divider(color: Colors.white.withOpacity(0.5)),
                        Text(
                          '${data.country} Resources',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FadeInRight(
                child: CardComponent(
                  color: Colors.red,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  onTap: () => _call(data.hotlinetwo.phonenumber),
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Ionicons.ios_call,
                          size: 30,
                          color: Colors.white,
                        ),
                        Divider(color: Colors.white.withOpacity(0.5)),
                        Text(
                          data.hotlinetwo.title,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
