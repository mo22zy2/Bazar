import 'package:flutter/material.dart';

class Maintextfield extends StatefulWidget {
  const Maintextfield({
    super.key,
    required this.hint,
    required this.pic,
    required this.obs,
    this.validator,
    required this.svg,
    required this.iconss,
    required this.isIcon,
    required this.keyboared,
  });

  final String hint;
  final String? pic;
  final bool obs;
  final String? Function(String?)? validator;
  final bool svg;
  final bool isIcon;
  final IconData? iconss;
  final TextInputType keyboared;

  @override
  State<Maintextfield> createState() => _MaintextfieldState();
}

class _MaintextfieldState extends State<Maintextfield> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obs;
  }

  Widget? _buildSuffixIcon() {
    if (!widget.obs) return null;

    return IconButton(
      icon: Icon(
        _isObscure ? Icons.visibility_off : Icons.visibility,
        color: const Color(0xff747688),
      ),
      onPressed: () {
        setState(() {
          _isObscure = !_isObscure;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isObscure,
      obscuringCharacter: '*',
      keyboardType: widget.keyboared,

      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFEDEDED),
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.black.withValues(alpha: 0.3)),

        suffixIcon: _buildSuffixIcon(),

        contentPadding: EdgeInsets.all(16),

        errorStyle: TextStyle(
          color: Colors.red,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(style: BorderStyle.none),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(style: BorderStyle.none),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(style: BorderStyle.none),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(style: BorderStyle.none),
        ),
      ),
    );
  }
}
