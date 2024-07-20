import 'app_localizations.dart';

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'اسم التطبيق';

  @override
  String get switchTheme => 'تغيير اللون';

  @override
  String get changeLanguage => 'تغيير اللغة';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get lightMode => 'الوضع الصباحي';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get welcomeAgain => 'مرحباً بك مرة أخرى';

  @override
  String get username => 'اسم المستخدم';

  @override
  String get typeYourUsenameHere => 'ادخل اسم المستخدم هنا';

  @override
  String get validationEmail => 'الرجاء إدخال بريد إلكتروني صالح';

  @override
  String get validationMaxLength => 'الرجاء إكمال الطول المطلوب';

  @override
  String get validationRequired => 'هذا الحقل مطلوب';

  @override
  String get validationUrl => 'الرجاء إدخال عنوان URL صالح';

  @override
  String get validationPhoneNumber => 'الرجاء إدخال رقم هاتف صالح';

  @override
  String get invalidFieldValue => 'قيمة حقل غير صالحة';

  @override
  String get typeYourPasswordHere => 'أدخل كلمة المرور هنا';

  @override
  String get password => 'كلمة المرور';

  @override
  String get fieldRequired => 'هذا الحقل مطلوب';

  @override
  String get loginSuccess => 'تم تسجيل الدخول بنجاح';

  @override
  String validatorMinLength(Object n) {
    return 'رجاءً أدخل $n أحرف على الأقل';
  }

  @override
  String validatorMaxLength(Object n) {
    return 'رجاءً أدخل $n أحرف على الأكثر';
  }

  @override
  String get validatorEmail => 'البريد الإلكتروني غير صحيح';

  @override
  String get validatorPhoneNumber => 'رقم الهاتف غير صحيح';

  @override
  String get validatorRequired => 'هذا الحقل مطلوب';

  @override
  String get validatorUrl => 'الرابط غير صحيح';

  @override
  String get validatorUseArabicOrKurdishLetters => 'رجاءً أدخل حروف عربية أو كردية';

  @override
  String get validatorUseEnglishLetters => 'رجاءً أدخل حروف إنجليزية';

  @override
  String get defaultErrorMessage => 'حدث خطأ ما, يرجى المحاولة مرة أخرى';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get theme => 'المظهر';

  @override
  String get cancel => 'إلغاء';

  @override
  String get crop => 'قص الصورة';

  @override
  String get noItemsFoundError => 'لا يوجد عناصر';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeDark => 'داكن';

  @override
  String get pickDate => 'اختر التاريخ';

  @override
  String get relocate => 'إعادة تحديد الموقع';

  @override
  String get locationPermissionIsRequiredToContinue => 'يجب السماح بالوصول إلى الموقع للمتابعة';

  @override
  String get themeSystem => 'النظام';
}
