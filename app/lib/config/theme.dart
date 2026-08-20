import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yun_lan_transfer/gen/strings.g.dart';
import 'package:yun_lan_transfer/model/persistence/color_mode.dart';
import 'package:yun_lan_transfer/provider/device_info_provider.dart';
import 'package:yun_lan_transfer/util/native/platform_check.dart';
import 'package:yun_lan_transfer/util/ui/dynamic_colors.dart';
import 'package:refena_flutter/refena_flutter.dart';

const _yunlanBlue = Color(0xFF2F80ED);
const _yunlanDeepBlue = Color(0xFF1E6ED8);
const _yunlanPaleBlue = Color(0xFFF2F7FF);
const _yunlanBorderBlue = Color(0xFFB9D5F8);
final _borderRadius = BorderRadius.circular(6);

/// 云联局域网快传在所有平台使用统一的蓝白视觉，不跟随设备动态取色或深色模式。
ThemeData getTheme(ColorMode _colorMode, Color _customColor, Brightness _brightness, DynamicColors? _dynamicColors) {
  const colorScheme = ColorScheme.light(
    primary: _yunlanBlue,
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFDCEBFF),
    onPrimaryContainer: _yunlanDeepBlue,
    secondary: _yunlanDeepBlue,
    onSecondary: Colors.white,
    secondaryContainer: _yunlanPaleBlue,
    onSecondaryContainer: Color(0xFF173B69),
    surface: Colors.white,
    onSurface: Color(0xFF1E293B),
    error: Color(0xFFD92D20),
    onError: Colors.white,
  );

  final inputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: _yunlanBorderBlue),
    borderRadius: _borderRadius,
  );
  final focusedInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: _yunlanBlue, width: 1.5),
    borderRadius: _borderRadius,
  );

  final String? fontFamily;
  if (checkPlatform([TargetPlatform.windows])) {
    fontFamily = switch (LocaleSettings.currentLocale) {
      AppLocale.ja => 'Yu Gothic UI',
      AppLocale.ko => 'Malgun Gothic',
      AppLocale.zhCn => 'Microsoft YaHei UI',
      AppLocale.zhHk || AppLocale.zhTw => 'Microsoft JhengHei UI',
      _ => 'Segoe UI Variable Display',
    };
  } else if (checkPlatform([TargetPlatform.linux])) {
    fontFamily = switch (LocaleSettings.currentLocale) {
      AppLocale.ja => 'Noto Sans CJK JP',
      AppLocale.ko => 'Noto Sans CJK KR',
      AppLocale.zhCn => 'Noto Sans CJK SC',
      AppLocale.zhHk || AppLocale.zhTw => 'Noto Sans CJK TC',
      _ => 'Noto Sans',
    };
  } else {
    fontFamily = null;
  }

  return ThemeData(
    colorScheme: colorScheme,
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.white,
    cardColor: Colors.white,
    dividerColor: const Color(0xFFD6E7FF),
    fontFamily: fontFamily,
    visualDensity: VisualDensity.standard,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: _yunlanDeepBlue,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Color(0xFFE2EEFC)),
      ),
    ),
    navigationRailTheme: const NavigationRailThemeData(
      backgroundColor: Color(0xFFF7FBFF),
      indicatorColor: Color(0xFFDCEBFF),
      selectedIconTheme: IconThemeData(color: _yunlanDeepBlue),
      unselectedIconTheme: IconThemeData(color: Color(0xFF64748B)),
      selectedLabelTextStyle: TextStyle(color: _yunlanDeepBlue, fontWeight: FontWeight.w600),
      unselectedLabelTextStyle: TextStyle(color: Color(0xFF475569)),
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      indicatorColor: Color(0xFFDCEBFF),
      iconTheme: WidgetStatePropertyAll(IconThemeData(color: Color(0xFF64748B))),
      labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Color(0xFF475569))),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _yunlanPaleBlue,
      border: inputBorder,
      focusedBorder: focusedInputBorder,
      enabledBorder: inputBorder,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _yunlanBlue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _yunlanDeepBlue,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.selected) ? _yunlanBlue : const Color(0xFFD8E7F8);
      }),
      thumbColor: const WidgetStatePropertyAll(Colors.white),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: _yunlanDeepBlue,
      selectionColor: Color(0x662F80ED),
      selectionHandleColor: _yunlanBlue,
    ),
  );
}

Future<void> updateSystemOverlayStyle(BuildContext context) async {
  await updateSystemOverlayStyleWithBrightness(Brightness.light);
}

Future<void> updateSystemOverlayStyleWithBrightness(Brightness _brightness) async {
  if (checkPlatform([TargetPlatform.android])) {
    final androidSdkInt = RefenaScope.defaultRef.read(deviceInfoProvider).androidSdkInt ?? 0;
    final bool edgeToEdge = androidSdkInt >= 29;

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge); // ignore: unawaited_futures
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: edgeToEdge ? Colors.transparent : Colors.white,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  } else {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
    ));
  }
}

extension ThemeDataExt on ThemeData {
  Color get cardColorWithElevation => cardColor;
}

extension ColorSchemeExt on ColorScheme {
  Color get warning => Colors.orange;

  Color? get secondaryContainerIfDark => null;

  Color? get onSecondaryContainerIfDark => null;
}

extension InputDecorationThemeExt on InputDecorationThemeData {
  BorderRadius get borderRadius => _borderRadius;
}
