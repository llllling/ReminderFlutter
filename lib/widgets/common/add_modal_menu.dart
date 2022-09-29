import 'package:flutter/cupertino.dart';

class AddModalMenu extends StatelessWidget {
  const AddModalMenu(
      {super.key, required this.children, this.onTab, this.onTabModal});
  final List<Widget> children;
  final Function? onTab;
  final Widget? onTabModal;

  void _showModal({
    required BuildContext context,
    required Widget child,
  }) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => CupertinoTheme(
        data: CupertinoTheme.of(context),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTabModal != null) {
          _showModal(
            context: context,
            child: _MenuClickContainer(child: onTabModal!),
          );
        }
        if (onTab != null) {
          onTab!();
        }
      },
      child: _Menu(
        children: children,
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: CupertinoColors.inactiveGray, width: 0),
          bottom: BorderSide(color: CupertinoColors.inactiveGray, width: 0),
        ),
      ),
      height: 44,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}

class _MenuClickContainer extends StatelessWidget {
  const _MenuClickContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: 22,
        ),
        child: GestureDetector(
          onTap: () {},
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      ),
    );
  }
}
