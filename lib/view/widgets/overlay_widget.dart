import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropIcons extends StatefulWidget {
  const DropIcons({
    super.key,
    required this.button,
    required this.iconsText,
    this.borderRadius,
    this.backgroundColor = const Color(0xFFD26324),
    this.iconColor = Colors.white,
    required this.onSelectIcon,
  });

  final Widget button;
  final List<Widget> iconsText;
  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final Color iconColor;
  final void Function(int index) onSelectIcon;

  @override
  State<DropIcons> createState() => _DropIconsState();
}

class _DropIconsState extends State<DropIcons>
    with SingleTickerProviderStateMixin {
  late GlobalKey _key;
  bool isMenuOpen = false;
  late Offset buttonPosition;
  late Size buttonSize;
  late OverlayEntry _overlayEntry;
  late BorderRadius? _borderRadius;

  @override
  void initState() {
    _borderRadius = widget.borderRadius;
    _key = LabeledGlobalKey("button_icon");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getButtonInfo();
    });
    super.initState();
  }

  void getButtonInfo() {
    RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
    _overlayEntry = _overlayEntryBuilder();
  }

  @override
  void didUpdateWidget(covariant DropIcons oldWidget) {
    getButtonInfo();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    if (isMenuOpen) {
      closeMenu();
    }
    super.dispose();
  }

  void closeMenu() {
    _overlayEntry.remove();
    isMenuOpen = false;
  }

  void openMenu() {
    Overlay.of(context).insert(_overlayEntry);
    isMenuOpen = true;
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      groupId: "tap_region",
      onTapOutside: (tap) {
        if (isMenuOpen) {
          closeMenu();
        }
      },
      child: Container(
        key: _key,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: _borderRadius ?? BorderRadius.circular(15.r),
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          child: InkWell(
            onTap: () {
              if (isMenuOpen) {
                closeMenu();
              } else {
                openMenu();
              }
            },
            child: widget.button,
          ),
        ),
      ),
    );
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: buttonPosition.dy + buttonSize.height,
          left: buttonPosition.dx,
          width: buttonSize.width,
          child: TapRegion(
            groupId: "tap_region",
            child: Material(
              color: Colors.transparent,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  ClipPath(
                    clipper: ArrowClipper(),
                    child: Container(
                      width: buttonSize.width / 3,
                      height: buttonSize.height / 3,
                      color: widget.backgroundColor,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15.0),
                    padding: const EdgeInsets.symmetric(horizontal: 2.5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius:
                          _borderRadius ?? BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      children: List.generate(
                        widget.iconsText.length,
                        (index) {
                          return IconButton.filled(
                            onPressed: () {
                              closeMenu();
                              widget.onSelectIcon(index);
                            },
                            icon: widget.iconsText[index],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  ArrowClipper({this.direction = ArrowDirection.up});
  final ArrowDirection direction;
  @override
  Path getClip(Size size) {
    Path path = Path();
    switch (direction) {
      case ArrowDirection.up:
        path.moveTo(0, size.height);
        path.lineTo(size.width / 2, size.height / 2);
        path.lineTo(size.width, size.height);
        break;
      case ArrowDirection.down:
        path.moveTo(0, size.height / 2);
        path.lineTo(size.width, size.height / 2);
        path.lineTo(size.width / 2, size.height);
        break;
      case ArrowDirection.left:
        path.moveTo(0, size.height / 2);
        path.lineTo(size.width / 2, 0);
        path.lineTo(size.width / 2, size.height);
        break;
      case ArrowDirection.right:
        path.moveTo(size.width / 2, 0);
        path.lineTo(size.width, size.height / 2);
        path.lineTo(size.width / 2, size.height);
        break;
    }
    return path..close;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

enum ArrowDirection {
  up,
  down,
  left,
  right,
}
