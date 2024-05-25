import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'belnn92w': {
      'en': '1',
      'ar': '1',
    },
    'nuqvbiki': {
      'en': ' Hi ',
      'ar': 'أهلاً',
    },
    '57ldgpb4': {
      'en': 'View Your Nutritionist Appointments ',
      'ar': 'مواعيد اختصاصي التغذية',
    },
    '5f584u78': {
      'en': 'Lets get it to 100%',
      'ar': 'لنصل إلى 100% ',
    },
    '6eqsbmnt': {
      'en': 'Classes ',
      'ar': 'النشاطات',
    },
    'evcq51ym': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // Login
  {
    '7qz3xujr': {
      'en': 'Gym Racks',
      'ar': 'Gym Racks',
    },
    'iz7st4fz': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
    },
    'xfc95fli': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    '1rchp7oh': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'pn9jh2p4': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
    },
    'a70ny0k8': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'n1xqu6j1': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'اختر من القائمة',
    },
    'hyrdmzta': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'fgh62o9g': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'اختر من القائمة',
    },
    'dwjczl3o': {
      'en': 'Forgot Password?',
      'ar': 'هل نسيت كلمة السر؟',
    },
    'jlte4p3b': {
      'en': 'click here',
      'ar': 'انقر هنا',
    },
    'djor5bpp': {
      'en': 'Home',
      'ar': 'الرئيسية ',
    },
  },
  // Profile
  {
    '5661q1zj': {
      'en': 'Settings',
      'ar': 'الحساب الخاص بك',
    },
    '3665pu3t': {
      'en': 'Change Account Info',
      'ar': 'تغيير المعلومات',
    },
    'y3y0ele4': {
      'en': 'Subscription',
      'ar': 'الاشتراك',
    },
    'jqf140b7': {
      'en': 'Help',
      'ar': 'المساعدة',
    },
    'c3zvjqax': {
      'en': 'Language',
      'ar': 'إعدادات التطبيقات',
    },
    '5zsc44gr': {
      'en': 'Log Out',
      'ar': 'تسجيل خروج',
    },
    'ele1n1ul': {
      'en': 'Profile',
      'ar': 'الرئيسية ',
    },
  },
  // ForgetPasword
  {
    '46csg9aw': {
      'en': 'Gym Racks',
      'ar': 'Gym Racks',
    },
    'lyq3m5vs': {
      'en': 'Forget password',
      'ar': 'نسيت كلمة المرور',
    },
    'zjuf59f8': {
      'en':
          'Enter the email associated with your account and we\'ll send you an',
      'ar': 'أدخل رقم التعريف وسنرسل لك بريدًا إلكترونيًا',
    },
    'ls7vyczk': {
      'en': 'Email',
      'ar': 'رقم التعريف',
    },
    'kfglthr9': {
      'en': 'Send Link',
      'ar': 'Forget',
    },
    '7n2zaf1c': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '2pkj5s1z': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'اختر من القائمة',
    },
    'umztkxpu': {
      'en': 'or login',
      'ar': 'أو تسجيل الدخول',
    },
    'jzujwcx4': {
      'en': 'Home',
      'ar': 'الرئيسية ',
    },
  },
  // ChangeInfo
  {
    'qlqth221': {
      'en': 'Edit Photo',
      'ar': 'تغيير الصورة',
    },
    '38jax2on': {
      'en': 'Reset Password',
      'ar': 'تغيير كلمة السر',
    },
    'zuqk049r': {
      'en': 'Change Username',
      'ar': 'تغيير اسم المستخدم',
    },
    '0okq6bhh': {
      'en': 'Change Email',
      'ar': 'تغيير الايميل',
    },
    'vcjkjnvh': {
      'en': 'Change Phone Number',
      'ar': 'تغيير رقم الهاتف',
    },
    '2b2ro16b': {
      'en': 'Change Info',
      'ar': 'تغيير المعلومات',
    },
    'k1qpzc2o': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // SubscriptionPlans
  {
    't6csp8gq': {
      'en': 'Your Plan',
      'ar': 'خطتك',
    },
    '19w8nbwn': {
      'en': 'Anual Plan',
      'ar': 'الخطة السنوية',
    },
    'd0029lqn': {
      'en': '240 JOD',
      'ar': '240 دينار',
    },
    'kp2ki4i3': {
      'en': 'Expires in: ',
      'ar': 'ينتهي في:',
    },
    'kd8o5gfw': {
      'en': 'Freeze',
      'ar': 'تجميد',
    },
    'wel5t2sj': {
      'en': 'Available Plans',
      'ar': 'الخطط المتاحة',
    },
    '5tjhya8g': {
      'en': 'Anual Plan',
      'ar': 'الخطة السنوية',
    },
    '33fttrwe': {
      'en': '240 JOD',
      'ar': '240 دينار',
    },
    'lo6f8iaw': {
      'en': '20 JOD/month',
      'ar': '20 دينار/شهر',
    },
    'nrvyn88n': {
      'en': 'Subscribe',
      'ar': 'يشترك',
    },
    'gwzdlkag': {
      'en': '6 Months Plan',
      'ar': 'خطة 6 أشهر',
    },
    '3jqgl9iy': {
      'en': '150 JOD',
      'ar': '150 دينار',
    },
    '7bhzdlbd': {
      'en': '25 JOD/month',
      'ar': '25 دينار/شهر',
    },
    '8ybb2q5r': {
      'en': 'Subscribe',
      'ar': 'يشترك',
    },
    'nwhxkg4o': {
      'en': 'Monthly Plan',
      'ar': 'خطة شهرية',
    },
    'rpjuao0w': {
      'en': '30 JOD/month',
      'ar': '30 دينار/شهر',
    },
    'lcot682u': {
      'en': 'Subscribe',
      'ar': 'يشترك',
    },
    'f906yxup': {
      'en': 'Subscription Plans',
      'ar': 'خطط الاشتراك',
    },
  },
  // HelpPage
  {
    '93lei58v': {
      'en': 'FAQs',
      'ar': 'أسئلة متكررة',
    },
    'dvp7b4a6': {
      'en': 'Feel free to reach out to your gym administrator for any help.',
      'ar': 'تواصل مع مسؤول النادي لأي مساعدة.',
    },
    '01h9a8ig': {
      'en': 'Ask Here...',
      'ar': 'اسأل هنا...',
    },
    'gureqoxm': {
      'en': 'Send Email',
      'ar': 'ارسل ايميل',
    },
    'g2d3xf92': {
      'en': 'Help',
      'ar': 'مساعدة',
    },
    'syzd1z4w': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // FaqPage
  {
    'vy24nhhg': {
      'en': 'What should I do if I forgot my password?',
      'ar': 'ماذا علي أن أفعل إذا نسيت كلمة المرور الخاصة بي؟',
    },
    'nfthkx3i': {
      'en':
          'You can logout and select to forget password. Make sure you have access to the email associated with your account before logging out.',
      'ar':
          'يمكنك تسجيل الخروج واختيار نسيان كلمة المرور. تأكد من أنك تستطيع الوصول إلى البريد الإلكتروني المرتبط بحسابك قبل تسجيل الخروج.',
    },
    'zf9igqks': {
      'en': 'What are the available membership plans?',
      'ar': 'ما هي خطط العضوية المتاحة؟',
    },
    '4d5ydtr2': {
      'en':
          'Go to \"Subscription\" in the Profile page to view your subscription along with the available plans',
      'ar':
          'انتقل إلى \"الاشتراك\" في صفحة الملف الشخصي لعرض اشتراكك بالإضافة إلى الخطط المتاحة',
    },
    'wey12tw4': {
      'en': 'FAQs',
      'ar': 'أسئلة متكررة',
    },
    'pnsp6rb4': {
      'en': 'Home',
      'ar': '',
    },
  },
  // notificationsPage
  {
    'mdz76tt3': {
      'en': 'Nutritionist',
      'ar': 'اختصاصي التغذية',
    },
    'rpei52br': {
      'en': 'Our meeting is next week',
      'ar': 'موعدنا الاسبوع المقبل',
    },
    'sxbw5j4h': {
      'en': 'Mar 8, 2022',
      'ar': '8 مارس 2022',
    },
    'ynkf2fx3': {
      'en': 'Trainer',
      'ar': 'المدرب',
    },
    'bd564wch': {
      'en': 'Keep up the grind',
      'ar': 'استمر في العمل المجد!',
    },
    'psp38218': {
      'en': 'Mar 8, 2022',
      'ar': '8 مارس 2022',
    },
    'qaqopf41': {
      'en': 'Admin',
      'ar': 'مسؤول النادي',
    },
    'hel7ciei': {
      'en': 'Gym is not open for tomorrow',
      'ar': 'صالة الألعاب الرياضية ليست مفتوحة ليوم غد',
    },
    'udjo9u7a': {
      'en': 'Mar 8, 2022',
      'ar': '8 مارس 2022',
    },
    '8s487vh4': {
      'en': 'Notifications',
      'ar': 'إشعارات',
    },
    '65wsmi74': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // ExcercisesPage
  {
    'n1mi5slr': {
      'en': 'Progress',
      'ar': 'التقدم',
    },
    '2rv1c00s': {
      'en': 'Lets get it to 100%',
      'ar': 'لنصل إلى 100% ',
    },
    'mq7ygwu0': {
      'en': 'Exercises',
      'ar': 'التمارين',
    },
    'cn25g92s': {
      'en': 'Excercise',
      'ar': 'التمرين',
    },
  },
  // ShopPage
  {
    '3fq6ojrw': {
      'en': 'Your Current Points',
      'ar': 'نقاطك الحالية',
    },
    'harzq077': {
      'en': 'Search for items...',
      'ar': 'البحث عن العناصر...',
    },
    'okqrt7xs': {
      'en': 'Option 1',
      'ar': '',
    },
    'gp74nktr': {
      'en': 'Shop',
      'ar': 'المتجر',
    },
    'v5k63mle': {
      'en': 'Shop',
      'ar': 'المتجر',
    },
  },
  // ClassesPage
  {
    '8uxnx417': {
      'en': 'Search for items...',
      'ar': 'البحث عن العناصر...',
    },
    'g7uu7o6f': {
      'en': 'Option 1',
      'ar': '',
    },
    '6f3941m7': {
      'en': 'Classes',
      'ar': 'النشاطات',
    },
    'druqdble': {
      'en': 'Classes',
      'ar': 'النشاطات',
    },
  },
  // NutritionPage
  {
    'e5xvi1gg': {
      'en': 'This month',
      'ar': 'هذا الشهر',
    },
    'eybuzawn': {
      'en': 'Breakfast',
      'ar': 'الافطار',
    },
    'a7xpdvhf': {
      'en': 'Lunch',
      'ar': 'الغداء',
    },
    'gnkw2oh7': {
      'en': 'Dinner',
      'ar': 'العشاء',
    },
    '4kyogpdm': {
      'en': 'Snacks',
      'ar': 'وجبات خفيفة',
    },
    '5674m0ci': {
      'en': 'Nutrition plan',
      'ar': 'خطة التغذية',
    },
    '7ojuy7t0': {
      'en': 'Nutrition',
      'ar': 'التغذية',
    },
  },
  // HealthPage
  {
    'wlu0sxob': {
      'en': 'Inbody-Test PDF',
      'ar': 'Inbody-Test PDF',
    },
    '63m0ivbv': {
      'en': 'Milestone',
      'ar': 'الهدف',
    },
    '7qsv3bw2': {
      'en': 'Progress Over Time',
      'ar': 'التقدم مع مرور الوقت',
    },
    'evv1bgju': {
      'en': 'Below is an overview of your Weight change over time.',
      'ar': 'فيما يلي نظرة عامة على تغير وزنك مع مرور الوقت.',
    },
    'ecqzuav0': {
      'en': 'Weight',
      'ar': 'الوزن',
    },
    '4472pp0v': {
      'en': 'time',
      'ar': 'الوقت',
    },
    '9gv08i21': {
      'en': 'kg',
      'ar': 'كج',
    },
    '97lf11gv': {
      'en': 'weight',
      'ar': 'الوزن',
    },
    '1bcic79v': {
      'en': 'Progress Over Time',
      'ar': 'التقدم مع مرور الوقت',
    },
    '90306uii': {
      'en': 'Below is an overview of your Fat Percentage change over time.',
      'ar': 'فيما يلي نظرة عامة على تغير نسبة الدهون لديك بمرور الوقت.',
    },
    'x9h3i75b': {
      'en': 'Fat Percentage',
      'ar': ' نسبة الدهون',
    },
    '8p9sx7ck': {
      'en': 'time',
      'ar': 'الوقت',
    },
    'vp5i1aki': {
      'en': 'Fat Percentage',
      'ar': ' نسبة الدهون',
    },
    'og3584lw': {
      'en': 'Fat Percentage',
      'ar': ' نسبة الدهون',
    },
    'kv8idgba': {
      'en': 'Health',
      'ar': 'الصحة',
    },
    'hu7wcegm': {
      'en': 'Health',
      'ar': 'الصحة',
    },
  },
  // InbodyViewer
  {
    'p6lwyiah': {
      'en': 'Your Inbody-Test',
      'ar': 'Your Inbody-Test',
    },
    'beds9ba5': {
      'en': 'Excercise',
      'ar': 'التمارين',
    },
  },
  // appointmentPage
  {
    '916xsxeu': {
      'en': 'upcoming appointment',
      'ar': 'الموعد القادم',
    },
    'o54z21er': {
      'en': 'Appointments',
      'ar': 'تعيينات',
    },
    '0b8yy21b': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // changePasswordModal
  {
    '3vompp3i': {
      'en': 'Reset Password',
      'ar': 'إعادة تعيين كلمة المرور',
    },
    '188ul8to': {
      'en':
          'enter your email and we will send you a link to reset your password.',
      'ar':
          'أدخل بريدك الإلكتروني وسنرسل لك رابطًا لإعادة تعيين كلمة المرور الخاصة بك.',
    },
    's4xht8yn': {
      'en': 'Account email',
      'ar': 'حساب البريد الإلكتروني',
    },
    '5m4fm7e2': {
      'en': 'send link',
      'ar': 'أرسل الرابط',
    },
  },
  // pageCard
  {
    'sg7rsjul': {
      'en': 'Shop',
      'ar': 'المتجر',
    },
    'aund4p40': {
      'en': 'Current points',
      'ar': 'النقاط الحالية',
    },
    'aklrg0gy': {
      'en': 'keep it up',
      'ar': 'استمر',
    },
  },
  // changeUsernameModal
  {
    '5r738a1a': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
    },
    '7suhfr3b': {
      'en': 'username',
      'ar': 'اسم المستخدم',
    },
    '0uv1b92y': {
      'en': 'Change Username',
      'ar': 'غير اسم المستخدم',
    },
  },
  // changeEmailModal
  {
    'eclc7qo9': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'w275v8ij': {
      'en': 'New Email',
      'ar': 'بريد إلكتروني جديد',
    },
    'aj1x0vlz': {
      'en': 'I am sure I want to change my Email',
      'ar': 'أنا متأكد من أنني أريد تغيير البريد الإلكتروني الخاص بي',
    },
    'uosnkw28': {
      'en': 'Change Email',
      'ar': 'تغيير الايميل',
    },
    '2a69uid5': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'iujlb9vk': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
  },
  // changePhoneNumberModal
  {
    '8tg4chc3': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    '95lv7p7w': {
      'en': 'New Phone Number',
      'ar': 'رقم الهاتف الجديد',
    },
    'vgjg8umi': {
      'en': 'Change Phone Number',
      'ar': 'غير رقم الهاتف',
    },
  },
  // excerciseCard
  {
    'c7rvwbme': {
      'en': '8 kg',
      'ar': '8 كجم',
    },
    'gndzsh8k': {
      'en': '12 kg',
      'ar': '12 كجم',
    },
    'f5fik1hq': {
      'en': '16 kg',
      'ar': '16 كجم',
    },
    'ir8fj10n': {
      'en': '20 kg',
      'ar': '20 كجم',
    },
    '5wzw9bh4': {
      'en': '24 kg',
      'ar': '24 كجم',
    },
    's3dizpo3': {
      'en': '28 kg',
      'ar': '28 كجم',
    },
    'fpt58oe1': {
      'en': '32 kg',
      'ar': '32 كجم',
    },
    'sshktmrr': {
      'en': '36 kg',
      'ar': '36 كجم',
    },
    'ijyog83u': {
      'en': '40 kg',
      'ar': '40 كجم',
    },
    '7j06s4yw': {
      'en': 'weight',
      'ar': 'وزن',
    },
    '82gth2p6': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'vgnb3gji': {
      'en': 'Done',
      'ar': 'منتهي',
    },
  },
  // shopItem
  {
    '5tfr5w1e': {
      'en': 'Price: ',
      'ar': 'سعر:',
    },
    'gotfwe5q': {
      'en': 'JOD',
      'ar': 'دينار ',
    },
    '74n7pxrd': {
      'en': 'Points cost: ',
      'ar': 'تكلفة النقاط:',
    },
  },
  // classCard
  {
    'vqn8a1g1': {
      'en': '/',
      'ar': '/',
    },
    'pxuwd0gu': {
      'en': ' Participants',
      'ar': 'مشاركون',
    },
  },
  // freezeModal
  {
    'yo5unp6f': {
      'en': 'Freeze Account',
      'ar': 'تجميد الحساب',
    },
    'oflzo705': {
      'en': '2 weeks',
      'ar': '2 أسابيع',
    },
    'de8spjhm': {
      'en': '1 month',
      'ar': 'شهر واحد',
    },
    '2r3w131l': {
      'en': 'Please select...',
      'ar': 'الرجاء التحديد...',
    },
    'q5t39so2': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '01ixu4cq': {
      'en': 'I confirm freezing my account',
      'ar': 'أؤكد تجميد حسابي',
    },
    'f0gbary5': {
      'en': 'Freeze',
      'ar': 'تجميد',
    },
  },
  // logoutConfirmModal
  {
    'rw3g1mr1': {
      'en': 'want to logout?',
      'ar': 'تريد تسجيل الخروج؟',
    },
    'axwgdh4k': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    'ij4ffgsd': {
      'en': 'No',
      'ar': 'لا',
    },
  },
  // Miscellaneous
  {
    'lyacx7tx': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'kdqaftir': {
      'en': '',
      'ar': 'التطبيق يتطلب الوصول الى الكاميرا',
    },
    '75o47yui': {
      'en': '',
      'ar': 'التطبيق يتطلب الوصول الى الصور',
    },
    'vajw51mn': {
      'en': '',
      'ar': '',
    },
    'dk4m02er': {
      'en': '',
      'ar': '',
    },
    '5z6w47fa': {
      'en': '',
      'ar': '',
    },
    '6dipiy5i': {
      'en': '',
      'ar': '',
    },
    'uj5rre26': {
      'en': '',
      'ar': '',
    },
    'y8b7d5gc': {
      'en': '',
      'ar': '',
    },
    'jzop22dg': {
      'en': '',
      'ar': '',
    },
    '9y2k5io1': {
      'en': '',
      'ar': '',
    },
    '7llxckjj': {
      'en': '',
      'ar': 'تم ارسال ايميل التوثيق!',
    },
    'qn2ntt4h': {
      'en': '',
      'ar': '',
    },
    'cmoczx51': {
      'en': '',
      'ar': '',
    },
    'k0yhsaes': {
      'en': '',
      'ar': 'غير صحيح',
    },
    'f2q58vpo': {
      'en': '',
      'ar': 'جاري تحميل الملفات...',
    },
    'srqi2lsq': {
      'en': '',
      'ar': 'تم بنجاح!',
    },
    '3x9fagzd': {
      'en': '',
      'ar': 'فشل رفع الملفات',
    },
    'kcf78ygd': {
      'en': '',
      'ar': '',
    },
    'f6x1tozb': {
      'en': '',
      'ar': '',
    },
    'f4vm3dbu': {
      'en': '',
      'ar': '',
    },
    '94yby40a': {
      'en': '',
      'ar': '',
    },
    'fxgrxyvg': {
      'en': '',
      'ar': '',
    },
    'tsa2nqcx': {
      'en': '',
      'ar': '',
    },
    'fr5oxf44': {
      'en': '',
      'ar': '',
    },
    'qpfpv1zf': {
      'en': '',
      'ar': '',
    },
    'b7tv93sc': {
      'en': '',
      'ar': '',
    },
    't19aw70j': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
