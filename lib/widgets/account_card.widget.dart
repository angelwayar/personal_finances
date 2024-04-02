import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AccountCardWidget extends StatefulWidget {
  const AccountCardWidget({
    super.key,
    this.img,
    this.callback,
    this.account,
    this.totalBalance,
  });

  final String? img;
  final String? account;
  final String? totalBalance;
  final ValueChanged<XFile>? callback;

  @override
  State<AccountCardWidget> createState() => _AccountCardWidgetState();
}

class _AccountCardWidgetState extends State<AccountCardWidget> {
  XFile? image;
  late final ImagePicker picker;

  @override
  void initState() {
    picker = ImagePicker();
    super.initState();
  }

  Future<void> imageSelect() async {
    final selectedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = selectedImage;
      widget.callback!(image!);
    });
  }

  DecorationImage? imageSelected() {
    if (widget.img != null) {
      return DecorationImage(
        image: AssetImage(widget.img!),
        fit: BoxFit.cover,
      );
    } else if (image != null) {
      return DecorationImage(
        image: Image.file(
          File(image!.path),
        ).image,
        fit: BoxFit.cover,
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.img != null ? null : imageSelect,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: const Color(0xFF345BAF),
          borderRadius: BorderRadius.circular(24.0),
          image: imageSelected(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/icons/visa.png',
              height: 22.0,
            ),
            if ((widget.img == null) && (image == null))
              const Center(
                child: Text(
                  'Agrega tu imagen',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
            const Spacer(),
            const Text(
              'Total balance',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '\$${widget.totalBalance ?? ''}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                const Text(
                  '*****',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  '${widget.account ?? ''} ',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
