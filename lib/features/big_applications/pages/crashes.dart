import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Crashes extends StatelessWidget {
  const Crashes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfff1f3f4),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Text(
        _crash,
        style: GoogleFonts.robotoMono(
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

const _crash = '''
*** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***
pid: 0, tid: 0 >>> com.groupon.redemption <<<

backtrace:
  #00  pc 0000000000042958  /system/lib/libc.so (tgkill+12)
  #00  pc 0000000000040565  /system/lib/libc.so (pthread_kill+32)
  #00  pc 000000000001cc5b  /system/lib/libc.so (raise+10)
  #00  pc 0000000000019ed9  /system/lib/libc.so (__libc_android_abort+34)
  #00  pc 0000000000017560  /system/lib/libc.so (abort+4)
  #00  pc 0000000000023a67  /data/app/com.groupon.redemption-1/split_config.armeabi_v7a.apk (offset 0x113e000)
''';
