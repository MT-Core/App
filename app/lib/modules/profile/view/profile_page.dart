import 'package:app/constants/theme.dart';
import 'package:app/constants/values.dart';
import 'package:app/models/user_data.dart';
import 'package:app/modules/home/home_page.dart';
import 'package:app/modules/profile/bloc/profile_page_bloc.dart';
import 'package:app/modules/profile/view/profile_page_fiels.dart';
import 'package:app/modules/splash/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

/// [ProfilePage] is a widget that contains the profile page.
class ProfilePage extends StatefulWidget {
  /// [ProfilePage] constructor.
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfilePageBloc bloc;
  final String initialCountry = 'FR';
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    bloc = BlocProvider.of<ProfilePageBloc>(context);
    bloc.add(FetchUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<ProfilePageBloc, ProfilePageState>(
        bloc: bloc,
        builder: (BuildContext context, Object? state) => state is ProfilePageLoadedState ? AccountView(user: state.user) : const SplashPage(),
      );
}

/// [AccountView] is a widget that contains the account view.
class AccountView extends StatefulWidget {
  /// [AccountView] constructor.
  const AccountView({required this.user, super.key});

  /// [user] is the user data.
  final UserData user;

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  late ProfilePageBloc bloc;
  late UserData localUser;
  final RefreshController _refreshController = RefreshController();

  Future<void> _onLoading() async => _refreshController.loadComplete();

  Future<void> _onRefresh() async {
    bloc.add(FetchUserEvent());
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    localUser = widget.user;
    bloc = BlocProvider.of<ProfilePageBloc>(context);
    super.initState();
  }

  void _saveProfile({required UserData user}) => setState(() => localUser = user);

  void _onSave() {
    ScaffoldMessenger.of(context).showSnackBar(customSnackBar(label: 'Confirm', notifLabel: 'Account informations updated'));
    setState(() => bloc.add(UpdateUserEvent(user: localUser)));
  }

  SnackBar customSnackBar({required String label, required String notifLabel}) => SnackBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        action: SnackBarAction(label: label, onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar()),
        content: Text(notifLabel),
        duration: const Duration(milliseconds: 2500),
        padding: const EdgeInsets.symmetric(horizontal: 8),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(actions: <Widget>[ProfilePageAppBar(user: widget.user, onSaved: _onSave)], backgroundColor: Theme.of(context).colorScheme.secondary),
        body: SmartRefresher(
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(top: 10),
              child: Column(children: <Widget>[ProfileImage(user: widget.user), ProfilePageField(user: widget.user, onSaved: _saveProfile)]),
            ),
          ),
        ),
      );
}

/// [ProfileImage] is a widget that contains the profile image.
class ProfileImage extends StatelessWidget {
  /// [ProfileImage] constructor.
  const ProfileImage({required this.user, super.key});

  /// [user] is the user data.
  final UserData user;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: Stack(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: SizedBox(
                width: 100,
                height: 100,
                child: CircleAvatar(backgroundColor: Colors.white54, backgroundImage: NetworkImage(user.avatarUrl.endsWith('.svg') ? Constants.profilePlaceholderUrl : user.avatarUrl)),
              ),
            ),
          ],
        ),
      );
}

/// [ProfilePageAppBar] is a widget that contains the profile page app bar.
class ProfilePageAppBar extends StatefulWidget {
  /// [ProfilePageAppBar] constructor.
  const ProfilePageAppBar({required this.user, required this.onSaved, super.key});

  /// [user] is the user data.
  final UserData user;

  /// [onSaved] is the on saved callback.
  final VoidCallback onSaved;

  @override
  State<ProfilePageAppBar> createState() => _ProfilePageAppBarState();
}

class _ProfilePageAppBarState extends State<ProfilePageAppBar> {
  late ProfilePageBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<ProfilePageBloc>(context);
    super.initState();
  }

  @override
  Expanded build(BuildContext context) => Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                const SizedBox(width: 10),
                // ShaderMask(shaderCallback: shaderCallback, child: IconButton(icon: const Icon(Icons.privacy_tip_outlined), onPressed: () => <void>{})),
                // IconButton(icon: const Icon(Icons.save, color: Color.fromRGBO(171, 135, 222, 1)), onPressed: widget.onSaved),
                InkWell(
                  onTap: () => widget.onSaved(),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: <BoxShadow>[BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 0.2, offset: Offset(0, 4))],
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ShaderMask(shaderCallback: shaderCallback, child: const Icon(Icons.save, color: Colors.white)),
                    ),
                  ),
                ),
                // const SizedBox(width: 10),
              ],
            ),
            Text('My Profile', style: Theme.of(context).textTheme.headlineMedium),
            Row(
              children: <Widget>[
                // const SizedBox(width: 10),
                SizedBox(
                  width: 42,
                  height: 42,
                  child: FloatingActionButton(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: ShaderMask(shaderCallback: shaderCallback, child: const Icon(Icons.logout, color: Colors.white)),
                    onPressed: () async => <void>{await FirebaseAuth.instance.signOut(), Get.offNamedUntil(HomePage.route, (Route<dynamic> route) => false)},
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ],
        ),
      );
}
