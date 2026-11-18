import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

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
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // ClientHome
  {
    'uzx4bezc': {
      'en': 'Customer',
      'fr': 'Particulier',
    },
    'smozkon9': {
      'en': 'Create request',
      'fr': 'Créer une demande',
    },
    'komvntf7': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // ElectricienHome
  {
    '2uoymg8f': {
      'en': 'Electrician',
      'fr': 'Electricien',
    },
    'b4n7jerm': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // OnboardingPage
  {
    'wkn5rta0': {
      'en': 'Onboarding Page',
      'fr': 'Page d\'intégration',
    },
    'z1eoroc2': {
      'en': 'Customer',
      'fr': 'Particulier',
    },
    'y71ehyn5': {
      'en': 'Entreprise',
      'fr': 'Entreprise',
    },
    'o30e72bm': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // Adminpage
  {
    'u96o1hg9': {
      'en': 'Admin page',
      'fr': 'Page Admin',
    },
    'rkpensbx': {
      'en': 'Add a new electrician',
      'fr': 'Ajouter un nouvel electricien',
    },
    '49y47nnc': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // Auth1
  {
    'a0nrhmv5': {
      'en': 'Sign In',
      'fr': 'Se connecter',
    },
    'avt47w1o': {
      'en': 'Let\'s get started by filling out the form below.',
      'fr': 'Commençons par remplir le formulaire ci-dessous.',
    },
    '8prgl8bq': {
      'en': 'Email',
      'fr': 'Email',
    },
    '8x6exxo2': {
      'en': 'Password',
      'fr': 'mot de passe',
    },
    'vu2e1wt8': {
      'en': 'Sign In',
      'fr': 'se connecter',
    },
    'd27n27an': {
      'en': 'Forgot Password',
      'fr': 'mot de passe oublié',
    },
    'gel95cb8': {
      'en': 'Or sign up with',
      'fr': 'Ou inscrivez-vous avec',
    },
    'hiry9dvi': {
      'en': 'Continue with Google',
      'fr': 'Continuer avec Google',
    },
    '0yspgw75': {
      'en': 'Continue with Apple',
      'fr': 'Continuer avec Apple',
    },
    'phazhqlp': {
      'en': 'Sign out',
      'fr': 'se déconnecter',
    },
    '60i4c54r': {
      'en': 'Sign Up',
      'fr': 'S\'inscrire',
    },
    'hycogbf6': {
      'en': 'Let\'s get started by filling out the form below.',
      'fr': 'Commençons par remplir le formulaire ci-dessous.',
    },
    'c4sf6njf': {
      'en': 'Name and surname',
      'fr': 'Nom et prénom',
    },
    'rz57s1mh': {
      'en': 'Email',
      'fr': 'Email',
    },
    'kcv88ynn': {
      'en': 'Mot de passe',
      'fr': 'Password',
    },
    'eegnbphf': {
      'en': 'Confirmer mot de passe',
      'fr': 'Confirm password',
    },
    '953rhfhu': {
      'en': 'Create Account',
      'fr': 'Créer un compte',
    },
    'jeyj3h5v': {
      'en': 'Or sign up with',
      'fr': 'Ou inscrivez-vous avec',
    },
    '8ec1c66f': {
      'en': 'Continue with Google',
      'fr': 'Continuer avec Google',
    },
    'h38iebl7': {
      'en': 'Continue with Apple',
      'fr': 'Continuer avec Apple',
    },
    'zmysgafg': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // JobDetailsPage
  {
    'qlq1w1p5': {
      'en': 'Service request',
      'fr': 'Numéro de la demande',
    },
    'shhbep9s': {
      'en': 'Yellow-Pending\n\"We are looking for an available electrician\"',
      'fr':
          'Statut jaune-en attente\n« Nous recherchons un électricien disponible. »',
    },
    'juo17ruh': {
      'en': 'Orange status-Assigned\nAn electrician has accepted your request',
      'fr':
          'Statut orange- Attribué \n«Un électricien a accepté votre demande.»',
    },
    'jvpqw2ch': {
      'en': 'Red Status-\tIntervention cancelled\n',
      'fr': 'Statut rouge: «Intervention annulée »',
    },
    'x97iowtn': {
      'en': 'Pink status: \"Your electrician is on its way\"',
      'fr': 'Statut rose : « Votre électricien est en route »',
    },
    'ld91lmum': {
      'en': 'Purple status: \"awaiting for deposit payment\"',
      'fr': 'Statut violet : « En attente de paiement de l\'acompte »',
    },
    '7hy3881v': {
      'en': 'Green status: \"Awaiting payment of the remaining balance',
      'fr': ' Statut vert: « En attente de paiement  du solde restant »',
    },
    'vsjegtk1': {
      'en': 'Blue status- Your intervention is completed succesfully',
      'fr': 'Statut bleu « Intervention terminée avec succès»',
    },
    'bs1ruwzq': {
      'en':
          '✅ Intervention completed successfully.\nThank you for using SOS Elec.\nYour payment has been received.',
      'fr':
          'Intervention terminée avec succès.\nMerci d\'avoir utilisé SOS Elec.\nVotre paiement a été reçu.',
    },
    'ir1paix3': {
      'en': 'Mark Complete',
      'fr': 'Marquer l\'intervention comme terminée',
    },
    '3u1m69t9': {
      'en': 'Cancel Job',
      'fr': 'Annuler l\'intervention',
    },
    '96jdsfbq': {
      'en': 'Your electrician has confirmed availability.\n',
      'fr': 'Votre électricien a confirmé sa disponibilité.',
    },
    '188i8ovn': {
      'en': 'Please pay the deposit to dispatch the electrician.',
      'fr':
          'Veuillez verser l\'acompte afin que l\'électricien puisse se déplacer.',
    },
    '8uy4whzd': {
      'en': 'Please proceed with the deposit payment.',
      'fr': 'Procéder au paiement de l\'acompte ici',
    },
    '9bvqtgu8': {
      'en': 'Please proceed with payment of the remaining balance.',
      'fr': 'Procéder au paiement du solde restant ici',
    },
    'wz0demn2': {
      'en': 'Your electrician has completed the work. ',
      'fr': 'Votre électricien a terminé les travaux. ',
    },
    'keumdz34': {
      'en': 'Please pay the remaining balance to close the intervention.\n',
      'fr': 'Veuillez régler le solde restant pour clôturer l\'intervention.',
    },
    'qiuwr4mn': {
      'en': 'Job cancelled',
      'fr': 'Mission annulée',
    },
    'w37jq7ri': {
      'en': 'Job details page',
      'fr': 'Détail de la demande',
    },
    '3cjgzej6': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // CreateRequestPage
  {
    'hem7skb6': {
      'en': 'Create service request',
      'fr': 'Créer une demande de service',
    },
    'smz9pkg6': {
      'en': 'Urgent / ASAP',
      'fr': 'Urgent',
    },
    '5esyj585': {
      'en': 'Book an appointment',
      'fr': 'Prendre un rendez-vous',
    },
    'zqu5m6zd': {
      'en': 'Select date & time',
      'fr': 'Sélectionner date et l\'heure',
    },
    'oagolt0x': {
      'en': 'Appointment selected',
      'fr': 'rendez-vous sélectionné',
    },
    '3yyof42k': {
      'en': 'Name',
      'fr': 'Nom',
    },
    'r17qj17m': {
      'en': 'Email',
      'fr': 'Email',
    },
    'y627gs7o': {
      'en': 'Phone number',
      'fr': 'Telephone',
    },
    'eig986kz': {
      'en': 'address line',
      'fr': 'Rue',
    },
    'gbbdrchc': {
      'en': 'City',
      'fr': 'Ville',
    },
    'w789sdul': {
      'en': 'Postcode',
      'fr': 'Code postale',
    },
    'u79l5wpi': {
      'en': 'Add a new address',
      'fr': 'Ajouter une nouvelle addresse',
    },
    'pedvksdb': {
      'en': 'newAddressLine',
      'fr': 'Rue',
    },
    'mr8ls0h9': {
      'en': 'newCity',
      'fr': 'Ville',
    },
    'tqayip69': {
      'en': 'newPostcode',
      'fr': 'Code postale',
    },
    '7z5fazve': {
      'en': 'Save',
      'fr': 'Enregistrer',
    },
    'o5vvy07e': {
      'en': 'Problem Description',
      'fr': 'Description du probleme',
    },
    '7mdat2b4': {
      'en': 'Add photo',
      'fr': 'Ajoutez une photo',
    },
    '4d1jedve': {
      'en': 'Submit',
      'fr': 'Soumettre',
    },
    'pdv07s70': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // ElectricianOnboardingPage
  {
    'ek9qk7m9': {
      'en': 'electrician onboarding',
      'fr': 'Intégration d\'un nouvel électricien',
    },
    '9yvtxnlr': {
      'en': 'Name',
      'fr': 'Prénom',
    },
    'at7ueamt': {
      'en': 'Name',
      'fr': 'Nom',
    },
    'vrul3wg1': {
      'en': 'Select...',
      'fr': '',
    },
    'u5qr5ui2': {
      'en': 'Search...',
      'fr': '',
    },
    'bm7br0yi': {
      'en': 'Partner',
      'fr': 'Partenaire',
    },
    'zov3jcr1': {
      'en': 'Independent',
      'fr': 'Independant',
    },
    'bpd2aalx': {
      'en': 'Option 3',
      'fr': '',
    },
    '2byhwpm0': {
      'en': 'Email',
      'fr': 'Email',
    },
    'l7srkv4g': {
      'en': 'Email',
      'fr': 'Email',
    },
    'kqmj64jl': {
      'en': 'Phone',
      'fr': 'numéro de téléphone',
    },
    '5u49u5gx': {
      'en': 'Phone number',
      'fr': 'numéro de téléphone',
    },
    'eshk8xzh': {
      'en': 'Company',
      'fr': 'Entreprise',
    },
    'c7fwsj5h': {
      'en': 'Enter Password',
      'fr': 'Entrez le mot de passe',
    },
    'hh6v9jry': {
      'en': 'Enter Password',
      'fr': 'Entrez le mot de passe',
    },
    'gieudlzs': {
      'en': 'Confirm password',
      'fr': 'Confirmez le mot de passe',
    },
    'vy1tauvh': {
      'en': 'Confirm password',
      'fr': 'Confirmez le mot de passe',
    },
    'bk2r01z7': {
      'en': 'Create',
      'fr': 'Créer',
    },
    '7hb89uue': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // BusinessHomePage
  {
    'jb69vk34': {
      'en': 'Business',
      'fr': 'Entreprise',
    },
    'woi8fpry': {
      'en': 'Upgrade Plan',
      'fr': 'Prendre ou changer de forfait',
    },
    'cwi2rak1': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // AIAssistantPage
  {
    'wipqglx5': {
      'en': 'Hello ',
      'fr': 'Bonjour',
    },
    'vfb9m9p5': {
      'en': 'Hello',
      'fr': 'Bonjour',
    },
    '9ma28jhh': {
      'en': 'Send',
      'fr': 'Envoyer',
    },
    'xpb5kul8': {
      'en': 'AI Assistant Page',
      'fr': 'Page Assistant IA',
    },
    'p78lk11z': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // ElectricianReportPage
  {
    'r3smurbc': {
      'en': 'End time',
      'fr': 'Heure de la fin de l\'intervention',
    },
    'akdj7pei': {
      'en': 'Fault / issue found',
      'fr': 'Probleme trouvé / Mesures prises',
    },
    'waygd7nm': {
      'en': 'work_performed',
      'fr': 'Travail effectué',
    },
    'jpyh37lh': {
      'en': 'Add material',
      'fr': 'Ajouter du matériel',
    },
    'usnq4xfn': {
      'en': 'Parts used',
      'fr': 'Materiel utilisé',
    },
    'ozn6edp2': {
      'en': 'Quantity',
      'fr': 'Quantité',
    },
    'e1dtxiq6': {
      'en': 'Unit price',
      'fr': 'Prix unitaire',
    },
    'f9cbsz0n': {
      'en': 'Optional: Add your receipts',
      'fr': 'Optionnel: Ajouter vos reçus',
    },
    'ktfxeysn': {
      'en': 'Recommended follow_up',
      'fr': 'Suivi recommandé',
    },
    'vfb46b7e': {
      'en': 'Additional notes',
      'fr': 'Notes de travail supplémentaires',
    },
    'rpjai5os': {
      'en': 'Labour minutes',
      'fr': 'Nombre d\'heures travaillées (en minutes)',
    },
    'yv18dh9y': {
      'en': 'Add a photo',
      'fr': 'Ajoutez une ou plusieurs photos',
    },
    'iroaj091': {
      'en': 'Submit',
      'fr': 'Soumettre',
    },
    'b7x8babi': {
      'en': 'Electrician report',
      'fr': 'Rapport électricien',
    },
    'e51u6991': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // subscriptionPlans
  {
    'amo3o1t1': {
      'en': 'Subscriptions',
      'fr': 'Abonnements',
    },
    'l5sc4zte': {
      'en': 'Hello World',
      'fr':
          'Veuillez d\'abord sélectionner votre mode de facturation en cliquant sur le bouton ci-dessous:',
    },
    'sl35pu48': {
      'en': 'Monthly ',
      'fr': 'mensuel ',
    },
    'veye0y9x': {
      'en': 'or Annually',
      'fr': 'ou annuel',
    },
    'id6995xp': {
      'en': 'PARTNER_START',
      'fr': 'PARTNER_START',
    },
    'vud0m3l6': {
      'en': '€149/month',
      'fr': '149€/mois ',
    },
    'huxfrahd': {
      'en': ' billed monthly',
      'fr': 'facturé mensuellement ',
    },
    'o3u97i59': {
      'en': '€1520/year',
      'fr': '1520€/an',
    },
    'jrjufb2a': {
      'en': 'billed annually. \nSave €268/year',
      'fr': 'facturé annuellement. Economisez 268€/an',
    },
    'in0fkm82': {
      'en':
          'Partner offer for small managers\nAgencies 1-15 properties\nUp to 3 electrical interventions per month',
      'fr':
          'Offre partenaire petits gestionnaires\nAgences 1-15 biens\nJusqu\'à 3 interventions électriques par mois',
    },
    'glaep6i9': {
      'en': 'Button',
      'fr': 'S\'abonner',
    },
    'by0kd393': {
      'en': 'Hello World',
      'fr': '',
    },
    '13f6s9me': {
      'en': 'PARTNER_PRO',
      'fr': 'PARTNER_PRO',
    },
    '0pc4nquk': {
      'en': '299 €/month, ',
      'fr': '299 €/mois, ',
    },
    'jrnap0b9': {
      'en': 'billed monthly',
      'fr': 'facturé mensuellement',
    },
    'fo6hegmf': {
      'en': '3050€/year, ',
      'fr': '3050€/an,',
    },
    'a6zpgdcp': {
      'en': 'billed annually. Save €538/year',
      'fr': ' facturé annuellement. Économisez 538 €/an',
    },
    '75i3oghp': {
      'en':
          'Partner offer for medium managers\nAgencies 16-40 properties\nUp to 8 electrical interventions',
      'fr':
          'Offre partenaire moyen gestionnaires\nAgences 16-40 biens\nJusqu\'à 8 interventions électriques par mois',
    },
    'pamywy7g': {
      'en': 'Subscribe',
      'fr': 'S\'abonner',
    },
    'dau72ffu': {
      'en': 'PARTNER_MAX',
      'fr': 'PARTNER_MAX',
    },
    '59y1ulw9': {
      'en': '€499/month, ',
      'fr': '499 €/mois,',
    },
    '8l0dylxu': {
      'en': 'billed monthly',
      'fr': 'facturé mensuellement',
    },
    '1e490n3x': {
      'en': '€5090/year, ',
      'fr': '5 090 €/an,',
    },
    'rsefwwns': {
      'en': 'billed annually. Save €898/year',
      'fr': 'facturé annuellement. Économisez 898 €/an',
    },
    'kvabj18l': {
      'en':
          'Partner offer for medium managers\nAgencies 41-70 properties\nUp to 15 electrical interventions per month',
      'fr':
          'Offre partenaire moyen gestionnaires\nAgences 41-70 biens\nJusqu\'à 15 interventions électriques par mois',
    },
    'a9bp9xb5': {
      'en': 'Subscribe',
      'fr': 'S\'abonner',
    },
    'rngaskoz': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // AdminpageCopy
  {
    '4os7en8o': {
      'en': 'Admin page',
      'fr': 'Page Admin',
    },
    'hpwtav0j': {
      'en': 'Add a new electrician',
      'fr': 'Ajouter un nouvel electricien',
    },
    'mghsd5hx': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // subscriptionsuccesspage
  {
    'brib70cx': {
      'en': 'Payment Confirmed!',
      'fr': 'paiement effectué',
    },
    'r80797vs': {
      'en': '\$425.24',
      'fr': '',
    },
    '0qe6t7jn': {
      'en': 'activating your subscription',
      'fr': 'Activation de votre abonnement...',
    },
    'ejucl5vc': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // subscription_cancelled
  {
    'ix7eko9u': {
      'en': 'Payment Cancelled!',
      'fr': 'Paiement annulé',
    },
    'lloohe3e': {
      'en': '\$425.24',
      'fr': '',
    },
    'dh4bps9i': {
      'en': 'Your subscription was not activated',
      'fr': 'Votre abonnement n\'a pas été activé.',
    },
    '7cv87ag1': {
      'en': 'Go back to subscriptionplan page',
      'fr': 'Retour à la page des abonnements',
    },
    'odm7txdg': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // stripeOnboardingpage
  {
    'fjftinam': {
      'en': 'Start your Stripe integration by clicking here',
      'fr': 'Commencez votre Intégration Stripe en cliquant ici',
    },
    'z7bcnczc': {
      'en': 'Stripe integration',
      'fr': ' Intégration Stripe ',
    },
    '9tnnmhrl': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // depositcheckoutsuccess
  {
    '8j81jxsw': {
      'en': 'Payment Confirmed!',
      'fr': 'paiement effectué',
    },
    'nodpnd1h': {
      'en': '\$425.24',
      'fr': '',
    },
    'vjb1c8w5': {
      'en': 'Your deposit has been successfully received',
      'fr': 'Votre acompte a été reçu avec succès',
    },
    '8s6d0lak': {
      'en': 'Go to Homepage',
      'fr': 'Allez à votre page d\'accueil',
    },
    'qsskxp1i': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // depositcheckoutfailed
  {
    'nw9veyjd': {
      'en': 'Payment Cancelled!',
      'fr': 'Paiement annulé',
    },
    '7sgd39s8': {
      'en': '\$425.24',
      'fr': '',
    },
    'mpiwho5i': {
      'en': 'Your deposit payment has failed',
      'fr': 'Votre paiement d\'acompte a échoué',
    },
    'tqviaypy': {
      'en': 'Go back to subscriptionplan page',
      'fr': 'Retour à la page des abonnements',
    },
    '2ykgso3e': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // finalpaymentfailed
  {
    'wh83gjiq': {
      'en': 'Payment Cancelled!',
      'fr': 'Paiement annulé',
    },
    'y0pcs75z': {
      'en': '\$425.24',
      'fr': '',
    },
    'm02k8td6': {
      'en': 'Your balance due has failed',
      'fr': 'Votre solde dû a échoué',
    },
    'ktxk20y8': {
      'en': 'Go back to subscriptionplan page',
      'fr': 'Retour à la page des abonnements',
    },
    '15i3wnhc': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // finalpaymentsuccess
  {
    'sbo1hz8c': {
      'en': 'Payment Confirmed!',
      'fr': 'paiement effectué',
    },
    '44wqstys': {
      'en': '\$425.24',
      'fr': '',
    },
    'l5uho438': {
      'en': 'Your balance due has been successfully received',
      'fr': 'Votre solde dû a été reçu avec succès.',
    },
    'qys3x50j': {
      'en': 'Go to Homepage',
      'fr': 'Allez à votre page d\'accueil',
    },
    '5nvodoha': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // ResetPasswordPage
  {
    '0ts1fof8': {
      'en': 'Create a new password',
      'fr': 'Créer un nouveau mot de passe',
    },
    'enj0wrwd': {
      'en': 'New password ',
      'fr': 'Nouveau mot de passe',
    },
    'o0v3ksrg': {
      'en': 'Confirm the new password',
      'fr': 'Confirmer le nouveau mot de passe ',
    },
    '0mt3dnd8': {
      'en': 'Save the new password',
      'fr': 'Enregistrer le mot de passe',
    },
    'oknj2dum': {
      'en': 'Tab 2',
      'fr': '',
    },
    '5um8gewm': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // ProfileElectrician
  {
    'hq2dgv00': {
      'en': 'is available',
      'fr': 'Disponible',
    },
    'zp3u7m33': {
      'en': 'Edit Profile',
      'fr': 'Editer le profile',
    },
    'hx6znedb': {
      'en': 'Account Settings',
      'fr': 'Paramètres du compte',
    },
    'v5lyl7an': {
      'en': 'My requests',
      'fr': 'Mes interventions',
    },
    '6mdqhj78': {
      'en': 'Log Out',
      'fr': 'Se déconnecter',
    },
    '9l83fijw': {
      'en': '__',
      'fr': '',
    },
  },
  // EditProfileElectrician
  {
    'f7yhyn8p': {
      'en': 'Name',
      'fr': 'Prénom et nom',
    },
    '3o4p1z53': {
      'en': 'Phone',
      'fr': 'Téléphone',
    },
    '9uvecc72': {
      'en': 'Service area',
      'fr': 'zone d\'intervention',
    },
    'ybl116z8': {
      'en': 'Save',
      'fr': 'Enregistrer',
    },
    'bi6e5fj0': {
      'en': '__',
      'fr': '',
    },
  },
  // Homepage
  {
    '8ubwdpmp': {
      'en': 'MENU',
      'fr': 'MENU',
    },
    '4bfjezxq': {
      'en': 'FR',
      'fr': 'FR',
    },
    've5vws2c': {
      'en': 'EN',
      'fr': 'EN',
    },
    'yojef4vs': {
      'en': 'SOS Electricity: \nYour 24/7 Emergency Electrician',
      'fr': 'SOS Electricity : \nVotre électricien d\'urgence 24h/24 & 7j/7',
    },
    'ktv7e2tl': {
      'en':
          'Fast, reliable service for residential, commercial, and property management needs. Transparent pricing and certified expertise.',
      'fr':
          'Intervention rapide pour les particuliers, entreprises et gestionnaires immobiliers. Diagnostic précis et tarif transparent, sans surprise',
    },
    'mvqfzi6i': {
      'en': 'Request Emergency Service',
      'fr': 'Demander une intervention \nimmédiate',
    },
    '0r9jqeu9': {
      'en': 'My account',
      'fr': 'Mon compte',
    },
    'g6ku7ht2': {
      'en': 'Professional Electrical Solutions for Every Need',
      'fr': 'Des solutions électriques pour tous vos besoins',
    },
    '5aoszjlf': {
      'en': 'Our Services',
      'fr': 'Nos Services',
    },
    'f1wxrdu6': {
      'en': 'Emergency Repairs',
      'fr': 'Dépannage d\'Urgence',
    },
    'u6s52wwo': {
      'en':
          'Facing a power outage, short circuit, or electrical failure? Our expert electricians are ready to respond quickly and secure your property',
      'fr':
          'Une panne totale, un court-circuit ou une coupure de courant ? Nos électriciens interviennent rapidement pour sécuriser vos installations',
    },
    'iw9y10go': {
      'en': 'Installation & Upgrades',
      'fr': 'Installation & Mise aux normes',
    },
    'mleliphn': {
      'en':
          'From upgrading your electrical panel to installing new lighting or ensuring safety compliance, we provide durable and code-compliant installations',
      'fr':
          'Besoin de moderniser votre tableau électrique, installer de nouveaux luminaires ou mettre aux normes votre installation ? Nous assurons des travaux durables et conformes',
    },
    'x59ycagh': {
      'en': 'Real Estate Partners',
      'fr': 'Partenaires Immobiliers',
    },
    '71mf7fva': {
      'en':
          'Tailored services for property managers and concierge agencies: fast response times, detailed reporting, and customized maintenance contracts',
      'fr':
          'Un service dédié aux agences, conciergeries et gestionnaires de copropriété : réactivité, reporting détaillé et contrats d\'entretien personnalisés',
    },
    'zc08i5tw': {
      'en': 'Why Choose Us',
      'fr': 'Pourquoi nous choisir ?',
    },
    'ge2n7wmd': {
      'en': 'Rapid Response',
      'fr': 'Intervention rapide',
    },
    'wzya3njs': {
      'en':
          'We understand that electrical issues can\'t wait. We are committed to arriving as quickly as possible to resolve your problems.',
      'fr':
          'Nous savons qu\'une panne électrique ne peut pas attendre. Nous nous engageons à intervenir dans les meilleurs délais.',
    },
    'v8ojqay5': {
      'en': 'Transparent Pricing',
      'fr': 'Tarifs transparents',
    },
    '50vwimxu': {
      'en':
          'No hidden fees. Receive a clear estimate before any work begins, so you always know what to expect.',
      'fr':
          'Pas de frais cachés. Recevez une estimation claire avant que notre électricien ne commence le travail.',
    },
    'eymqcjuo': {
      'en': 'Certified Expertise',
      'fr': 'Expertise certifiée',
    },
    'imwpy6m2': {
      'en':
          'Our electricians are fully qualified professionals, regularly trained on the latest safety standards.',
      'fr':
          'Nos électriciens sont des professionnels qualifiés, régulièrement formés aux dernières normes de sécurité électrique.',
    },
    'xh0kww2q': {
      'en': ' Legal Notice | ',
      'fr': 'Mentions Legales | ',
    },
    'rdeb9fph': {
      'en': 'Terms of Service | ',
      'fr': 'CGU/CGV | ',
    },
    'ocfhh710': {
      'en': 'Privacy Policy ',
      'fr': 'Politique de confidentialité ',
    },
    'zrer7cri': {
      'en': 'Menu',
      'fr': 'Menu',
    },
    '64pdij6b': {
      'en': 'Home',
      'fr': 'Accueil',
    },
    '1sqfzgtq': {
      'en': 'Our prices',
      'fr': 'Nos prix',
    },
    '5qhgo4kw': {
      'en': 'Request an electrician',
      'fr': 'Demander un électricien',
    },
    'ycf7ll0p': {
      'en': 'AI Assistant',
      'fr': 'Assistant IA',
    },
    'evxyvvg1': {
      'en': 'Contact SOS Electricity',
      'fr': 'Contacter SOS Electricity',
    },
    'juv3r7k3': {
      'en': 'Log in',
      'fr': 'Se connecter',
    },
    'myi8u57x': {
      'en': 'Log out',
      'fr': 'Se deconnecter',
    },
    't1e1r2xy': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // CreateGuestRequestPage
  {
    '4rt1eau7': {
      'en': 'Create service request',
      'fr': 'Créer une demande de service',
    },
    'gi1sltl9': {
      'en': 'Urgent / ASAP',
      'fr': 'Urgent',
    },
    'nkjfxtzj': {
      'en': 'Book an appointment',
      'fr': 'Prendre un rendez-vous',
    },
    '5u5g00e1': {
      'en': 'Select date & time',
      'fr': 'Sélectionner  date et heure',
    },
    'k6luoyvw': {
      'en': 'Selected appointment',
      'fr': 'Rendez-vous sélectionné',
    },
    'm6b0phss': {
      'en': 'Code postal',
      'fr': 'Postcode',
    },
    'sswadv6s': {
      'en': 'Nom et prenom',
      'fr': 'Name',
    },
    'a7ft39um': {
      'en': 'Email',
      'fr': 'Email',
    },
    'qk0uu4u3': {
      'en': 'Telephone',
      'fr': 'Phone number',
    },
    '91o3vrw0': {
      'en': 'Rue',
      'fr': 'Address line',
    },
    'mqb96e93': {
      'en': 'Ville',
      'fr': 'City',
    },
    '93c4gd5z': {
      'en': 'Problem description',
      'fr': 'Description du problème\n',
    },
    'l67vgmzi': {
      'en': 'Add photo',
      'fr': 'Ajoutez une photo',
    },
    'm3rn5grv': {
      'en': 'Submit',
      'fr': 'Soumettre',
    },
    'gdqrlqxy': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // RequestConfirmationPage
  {
    'qi44l1g7': {
      'en': 'Request confirmation page',
      'fr': 'Page de confirmation de la demande',
    },
    'e28ocxhw': {
      'en':
          'Your request has been submitted successfully. Our team is reviewing your request now. We\'ll keep you updated using the contact details you provided. ',
      'fr':
          'Votre demande a bien été enregistrée.  Notre équipe examine actuellement votre demande. Nous vous tiendrons informé en utilisant les coordonnées que vous avez fournies.',
    },
    'hdii7p09': {
      'en': 'Request number:',
      'fr': 'Référence de la demande:',
    },
    'm8hg61w9': {
      'en': 'Track my request',
      'fr': 'Suivre ma demande',
    },
    'n49oc9em': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // GuestJobTrackingPage
  {
    'q1alqzzy': {
      'en': 'Guest job Tracking page',
      'fr': 'Page de suivi de la demande',
    },
    'mpr2b4m0': {
      'en': 'Tap below to view your customer details',
      'fr': 'Appuyez ci-dessous pour afficher vos coordonnées',
    },
    'wcin2lr3': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // Legalnotice
  {
    'iscd8axj': {
      'en': 'Legal Notice',
      'fr': 'Mention légales',
    },
    'ionltrub': {
      'en':
          'SAS- SOS Electricity\n25 rue de Ponthieu, 75008 Paris  \nRegistration number 109 421 057\ncontactsoselectricity@gmail.com',
      'fr':
          'SAS- SOS Electricity, \n25 rue de Ponthieu, 75008 Paris \nNumero de Siret 109 421 057\ncontactsoselectricity@gmail.com',
    },
    '1vc501at': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // Contact
  {
    '4nvj8urz': {
      'en': 'Contact us',
      'fr': 'Nous contacter',
    },
    '69vn3iwt': {
      'en':
          'For all other inquiries, you can contact us at:\ncontactsoselectricity@gmail.com',
      'fr':
          'Pour toutes autres demandes, vous pouvez nous contacter à :\ncontactsoselectricity@gmail.com',
    },
    'tbx7dp7h': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // Termsandconditions
  {
    'dd70vlvw': {
      'en': 'Terms & conditions',
      'fr': 'Conditions générales',
    },
    'hk8obu6y': {
      'en':
          'Last updated: 16th September 2026\n\n1. About SOS Electricity\n\nSOS Electricity is a French Société par Actions Simplifiée (SAS) duly registered in France.\n\nRegistered office: 25 rue de Ponthieu, 75008 Paris \nSIREN: 109 421 057 \nSIRET: 109421 05700018\nVAT number: en cours de validation\nEmail: contactsoselectricity@gmail.com\n\n\nSOS Electricity\'s activities include electrical installation, repair, troubleshooting and renovation services, as well as the development, operation and maintenance of a digital application and platform dedicated to the management of electrical interventions, coordination between customers and professionals, and administrative management of services.\n\nSOS Electricity may also provide non-continuing electrical training online and in person.\n\n2. Purpose of these Terms\n\nThese Terms govern the relationship between SOS Electricity and customers using the SOS Electricity application, website or other channels to request electrical services.\n\nBy creating an account, requesting a service, accepting a quotation or confirming an intervention, the customer acknowledges having read and accepted these Terms.\n\nWhere specific contractual terms or a quotation apply to a particular intervention, those terms form part of the contract between SOS Electricity and the customer.\n\n3. SOS Electricity as the customer\'s contracting party\n\nUnless expressly stated otherwise in a separate written agreement, SOS Electricity is the contracting party for the electrical service requested by the customer.\n\nThe customer therefore enters into the service contract with SOS Electricity.\nSOS Electricity determines the applicable customer price, issues the customer invoice and receives payment from the customer.\n\nTo fulfil the service, SOS Electricity may:\n\n-carry out the intervention itself through its qualified directors, associates, employees or other authorised personnel; or\n-engage an independent electrician or other appropriately qualified professional to perform all or part of the intervention on behalf of SOS Electricity.\n\nThe use of an independent professional to perform an intervention does not, by itself, change the customer\'s contractual relationship with SOS Electricity.\n\n4. Independent professionals and subcontractors\n\nSOS Electricity may use independent electricians and other qualified professionals to perform all or part of a service.\n\nSuch professionals may operate as independent businesses and may have a separate contractual relationship with SOS Electricity.\n\nSOS Electricity will select and dispatch professionals according to the nature, location and requirements of the intervention.\n\nIndependent professionals remain responsible to SOS Electricity for the proper performance of the services entrusted to them, in accordance with their contractual relationship with SOS Electricity and applicable law.\n\nSOS Electricity may require independent professionals to provide evidence of appropriate qualifications, registrations and insurance applicable to the activities they perform.\n\n5. Information provided before the intervention\n\nBefore the customer is bound by the contract, SOS Electricity will provide the information required by applicable law, including, where applicable:\n\n-the identity and contact details of SOS Electricity;\n-the nature and essential characteristics of the service;\n-the applicable price or pricing method;\napplicable travel, labour, material and other charges;\n-applicable taxes and VAT;\n-the expected method and timing of performance;\n-applicable cancellation and withdrawal rights;\n-relevant contractual conditions.\n\nWhere a quotation is legally required, the intervention will be subject to the customer\'s acceptance of the quotation before the relevant work is undertaken.\n\n6. Quotations and acceptance\n\nWhere applicable, SOS Electricity will provide the customer with a quotation describing the proposed work and applicable charges.\n\nA quotation may include:\n\n-the nature of the work;\n-labour;\n-travel charges;\n-materials;\n-applicable taxes;\n-the total price;\n-the validity period of the offer;\n-any other information required by law.\n\nA quotation becomes contractually binding once accepted in accordance with the applicable legal and contractual requirements.\n\nFor electrical dépannage, repair and maintenance services, SOS Electricity will comply with applicable French quotation and pre-contractual information requirements. French DGCCRF guidance specifically identifies electrical work among activities for which detailed quotations can be mandatory in certain circumstances.\n\n7. Emergency and standard interventions\n\nSOS Electricity may offer different intervention categories, including emergency, standard, evening, night, weekend and public-holiday interventions.\n\nThe applicable price and conditions will be communicated to the customer before confirmation where required.\n\nUnless otherwise specified, a standard intervention may be subject to a maximum standard intervention period.\n\nWhere additional work is required beyond the agreed scope or standard intervention, SOS Electricity may require the customer\'s approval of an additional quotation before continuing.\n\n8. Additional work\n\nIf, during an intervention, the professional determines that additional work is necessary, SOS Electricity may provide the customer with an additional quotation.\n\nWhere the customer\'s prior approval is legally or contractually required, additional work will not be undertaken until that approval has been obtained.\n\nIn an emergency, reasonable measures may be taken where immediately necessary to protect persons or property, subject to applicable law.\n\n9. Materials\n\nMaterials may be required to complete an intervention.\n\nThe cost of materials supplied for the intervention may be charged to the customer.\n\nWhere applicable, the customer will receive information concerning the materials used and their price.\n\nMaterials may be supplied or sourced by SOS Electricity or by the professional carrying out the intervention, according to SOS Electricity\'s operational arrangements.\n\n10. Pricing\n\nSOS Electricity determines the prices applicable to the services it offers.\n\nDepending on the intervention, the price may include:\n\n-an intervention or call-out fee;\n-travel;\n-labour;\n-additional labour;\n-materials;\n-evening charges;\n-night charges;\n-weekend charges;\n-public-holiday charges;\n-other applicable service charges.\n\nPrices will be communicated in euros and, where required, including applicable taxes.\n\nThe customer will be informed of the applicable price before being bound by the contract.\n\n11. Payment\n\nPayment may be made through the payment methods made available by SOS Electricity, including third-party payment providers such as Stripe.\n\nThe customer pays SOS Electricity for the contracted service.\n\nSOS Electricity may subsequently pay the professional who performed the intervention in accordance with the separate contractual relationship between SOS Electricity and that professional.\n\nThe customer does not become a party to that separate professional relationship merely because an independent professional performs the intervention.\n\n12. Invoicing\n\nSOS Electricity will issue the customer with the applicable invoice or payment document.\n\nThe invoice may identify:\n\n-SOS Electricity;\n-the customer;\n-the intervention date;\n-the intervention address;\n-the services provided;\n-labour;\n-materials;\n-applicable fees;\n-VAT;\n-the total amount payable.\n\n13. Performance of the intervention\n\nThe customer must provide accurate information necessary to organise and perform the intervention.\n\nThe customer must provide reasonable and safe access to the intervention location.\n\nThe customer must inform SOS Electricity or the assigned professional of any known circumstances that could create a safety risk.\n\nSOS Electricity may refuse or suspend an intervention where the conditions are unsafe or where performance would require work outside the qualifications or legal authorisations of the professional assigned.\n\n14. Electrical safety and professional requirements\n\nElectrical work must be performed by appropriately qualified professionals and in accordance with applicable French laws, regulations and professional standards.\n\nSOS Electricity will organise its services so that electrical work is assigned to persons appropriately qualified for the work concerned.\n\nIndependent professionals engaged by SOS Electricity remain responsible for maintaining the qualifications, registrations and insurance required for their own professional activity.\n\n15. Insurance and guarantees\n\nSOS Electricity will maintain the insurance required for its activities and will provide the information required by applicable law.\n\nWhere applicable, information concerning professional liability and relevant mandatory insurance will be included in the company\'s legal information, quotations or invoices.\n\nIndependent professionals engaged by SOS Electricity may also be required to maintain the insurance required for their activities.\n\nNothing in these Terms excludes or limits any mandatory legal guarantee or liability.\n\n16. Cancellation and withdrawal\n\nWhere the customer is a consumer, applicable statutory cancellation and withdrawal rights will apply.\n\nFor contracts concluded at a distance or outside the professional\'s premises, SOS Electricity will provide the information concerning the consumer\'s withdrawal rights required by French law.\n\nWhere the customer expressly requests that a service begin before the expiry of the applicable withdrawal period, the applicable legal consequences will be explained to the customer.\n\nCertain services may be subject to statutory exceptions or loss of the right of withdrawal once the service has been fully performed, subject to the conditions established by applicable law.\n\n17. Rescheduling and customer availability\n\nThe customer must make reasonable efforts to be available at the agreed intervention time.\n\nIf the customer is unavailable, cannot provide access, or provides materially incorrect information, the intervention may need to be rescheduled and applicable charges may apply where legally permitted and where the customer was informed of them beforehand.\n\n18. Liability\n\nSOS Electricity is responsible for its contractual obligations towards the customer in accordance with applicable law.\n\nWhere SOS Electricity uses an independent professional to perform an intervention on its behalf, this does not by itself transfer the customer\'s contract to that independent professional.\n\nSOS Electricity may seek contractual remedies against an independent professional where that professional fails to perform its obligations towards SOS Electricity.\n\nNothing in these Terms excludes or limits liability where such exclusion or limitation is prohibited by law.\n\n19. Complaints\n\nCustomers may submit complaints to SOS Electricity using the contact details provided in these Terms.\n\nSOS Electricity will investigate complaints relating to its services and the performance of interventions arranged through the platform.\n\nWhere an intervention was performed by an independent professional, SOS Electricity may obtain information from that professional as part of its investigation.\n\n20. Consumer mediation\n\nIn accordance with the provisions of the Consumer Code concerning \"the mediation process for consumer disputes\", after contacting us and if you do not receive a satisfactory response, you have the option of using a free consumer mediation procedure with:\n\nCM2C\n49 rue de Ponthieu\n75 008 PARIS\nPhone number: 01 89 47 00 14\nWebsite : https://www.cm2c.net/declarer-un-litige.php\nEmail : litiges@cm2c.net\n\n21. Personal data\n\nSOS Electricity processes personal data in accordance with its Privacy Policy.\nThe Privacy Policy explains:\n\n-the categories of personal data collected;\n-the purposes of processing;\n-applicable legal bases;\n-data retention;\n-recipients of personal data;\n-customer rights;\n-how those rights may be exercised.\n\nThe Privacy Policy is available through the SOS Electricity application and website.\n\n22. Intellectual property\n\nThe SOS Electricity application, website, trademarks, logos, software, databases and content are protected by applicable intellectual-property laws.\n\nExcept where expressly permitted, customers may not reproduce, modify, distribute or commercially exploit SOS Electricity\'s intellectual property.\n\n23. Digital platform\n\nThe SOS Electricity application and platform may be used to:\n\n-request interventions;\n-provide information about electrical problems;\n-schedule interventions;\n-communicate with SOS Electricity;\n-communicate operational information concerning an assigned professional;\n-manage intervention reports;\n-manage materials;\n-process payments;\n-receive invoices and other documents.\n\nSOS Electricity may modify, suspend or temporarily interrupt digital features where necessary for maintenance, security, development or legal compliance.\n\n24. User account\n\nCustomers are responsible for maintaining the confidentiality of their account credentials and for providing accurate account information.\nCustomers must notify SOS Electricity if they believe their account has been compromised.\n\n25. Governing law\n\nThese Terms are governed by French law, subject to mandatory consumer-protection provisions that may apply.\nAny dispute will be handled in accordance with the mandatory jurisdiction rules applicable to consumers.\n\n26. Changes to these Terms\n\nSOS Electricity may update these Terms to reflect changes to its services, technology or applicable law.\nThe version applicable to a particular contract will be the version accepted by the customer at the relevant time, subject to mandatory legal requirements concerning subsequent amendments.\n\n27. Contact\nSOS Electricity SAS\nSiège social : 25 rue de Ponthieu, 75008 Paris \nSIREN : 109 421 057\nSIRET : 109421 05700018\nN° TVA intracommunautaire : en cours de validation\nE-mail : contactsoselectricity@gmail.com\n',
      'fr':
          'Dernière mise à jour : 16 Septembre 2026\n\n1. Identification de SOS Electricity\n\nSOS Electricity est une Société par Actions Simplifiée (SAS) de droit français, dûment immatriculée en France.\nSiège social : 25 rue de Ponthieu, 75008 Paris \nSIREN : 109 421 057 \nSIRET : 109421 05700018\nN° TVA intracommunautaire : currently being validated\nE-mail : contactsoselectricity@gmail.com\n\nLes activités de SOS Electricity comprennent notamment l\'installation, le dépannage et la rénovation d\'installations électriques de tous types, ainsi que le développement, l\'exploitation et la maintenance d\'une application et d\'une plateforme numérique dédiées à la gestion des interventions électriques, à la mise en relation entre clients et professionnels et à la gestion administrative des prestations.\n\nSOS Electricity peut également proposer des formations non continues en ligne et en présentiel dans le domaine de l\'électricité.\n\n2. Objet des présentes Conditions Générales\n\nLes présentes Conditions Générales régissent la relation entre SOS Electricity et les clients utilisant l\'application, le site internet ou tout autre canal mis à disposition par SOS Electricity afin de demander une prestation électrique.\n\nEn créant un compte, en demandant une prestation, en acceptant un devis ou en confirmant une intervention, le client reconnaît avoir pris connaissance des présentes Conditions Générales et les accepter.\n\nLorsqu\'un devis ou des conditions particulières s\'appliquent à une intervention déterminée, ceux-ci font partie intégrante du contrat conclu entre SOS Electricity et le client.\n\n3. SOS Electricity en qualité de contractant\n\nSauf stipulation contraire expresse dans un accord écrit distinct, SOS Electricity est le cocontractant du client pour la prestation électrique demandée.\n\nLe contrat de prestation est donc conclu entre le client et SOS Electricity.\nSOS Electricity détermine le prix applicable au client, établit la facture et encaisse le paiement du client.\n\nPour assurer l\'exécution de la prestation, SOS Electricity peut :\n\n-réaliser elle-même l\'intervention par l\'intermédiaire de ses dirigeants, associés, salariés ou autres personnes habilitées et qualifiées ; ou\n-faire intervenir un électricien indépendant ou un autre professionnel dûment qualifié afin d\'exécuter tout ou partie de la prestation pour le compte de SOS Electricity.\n\nLe recours à un professionnel indépendant pour l\'exécution d\'une intervention ne modifie pas, en lui-même, la relation contractuelle entre SOS Electricity et le client.\n\n4. Professionnels indépendants et sous-traitants\n\nSOS Electricity peut faire appel à des électriciens indépendants et à d\'autres professionnels qualifiés afin d\'assurer tout ou partie de l\'exécution d\'une prestation.\n\nCes professionnels peuvent exercer leur activité de manière indépendante et être liés à SOS Electricity par un contrat distinct.\n\nSOS Electricity sélectionne et affecte les professionnels en fonction notamment de la nature, du lieu et des exigences de l\'intervention.\n\nLes professionnels indépendants demeurent responsables envers SOS Electricity de la bonne exécution des prestations qui leur sont confiées, conformément à leur relation contractuelle avec SOS Electricity et à la réglementation applicable.\n\nSOS Electricity peut demander aux professionnels indépendants de justifier des qualifications, immatriculations et assurances nécessaires à l\'exercice des activités concernées.\n\n5. Informations communiquées avant la prestation\n\nAvant que le client ne soit engagé par le contrat, SOS Electricity communique les informations requises par la réglementation applicable, notamment, le cas échéant :\n\n-l\'identité et les coordonnées de SOS Electricity ;\n-la nature et les caractéristiques essentielles de la prestation ;\n-le prix applicable ou son mode de calcul ;\n-les frais de déplacement, de main-d\'œuvre, de matériel et autres frais applicables ;\n-les taxes et la TVA applicables ;\n-les modalités et délais prévisibles d\'exécution ;\n-les éventuels droits de rétractation et conditions d\'annulation ;\n-les conditions contractuelles applicables.\n\nLorsqu\'un devis est légalement obligatoire, l\'intervention est subordonnée à l\'acceptation du devis par le client avant la réalisation des travaux concernés.\n\n6. Devis et acceptation\n\nLorsque cela est applicable, SOS Electricity remet au client un devis décrivant les travaux envisagés et les frais applicables.\n\nLe devis peut notamment préciser :\n\n-la nature des travaux ;\n-la main-d\'œuvre ;\n-les frais de déplacement ;\n-les matériaux ;\n-les taxes applicables ;\n-le prix total ;\n-la durée de validité de l\'offre ;\n-toute autre mention imposée par la réglementation.\n\nLe devis devient contractuellement engageant dès son acceptation conformément aux dispositions légales et contractuelles applicables.\n\nPour les prestations de dépannage, de réparation et d\'entretien dans le domaine électrique, SOS Electricity respecte les obligations françaises applicables en matière de devis et d\'information précontractuelle. La DGCCRF identifie notamment les prestations électriques parmi les activités pouvant être soumises à l\'établissement préalable d\'un devis détaillé.\n\n7. Interventions d\'urgence et interventions standard\n\nSOS Electricity peut proposer différentes catégories d\'intervention, notamment des interventions d\'urgence, standard, en soirée, de nuit, le week-end et les jours fériés.\n\nLe prix et les conditions applicables sont communiqués au client avant confirmation lorsque la réglementation l\'exige.\n\nSauf indication contraire, une intervention standard peut être soumise à une durée maximale.\n\nLorsque des travaux supplémentaires sont nécessaires au-delà du périmètre convenu ou de la durée standard, SOS Electricity peut demander l\'acceptation d\'un devis complémentaire avant la poursuite des travaux.\n\n8. Travaux supplémentaires\n\nLorsque le professionnel constate au cours de l\'intervention que des travaux supplémentaires sont nécessaires, SOS Electricity peut proposer au client un devis complémentaire.\n\nLorsque l\'accord préalable du client est légalement ou contractuellement requis, les travaux supplémentaires ne sont réalisés qu\'après obtention de cet accord.\n\nEn cas d\'urgence, des mesures raisonnables peuvent être prises lorsqu\'elles sont immédiatement nécessaires à la protection des personnes ou des biens, sous réserve de la réglementation applicable.\n\n9. Matériaux\n\nDes matériaux peuvent être nécessaires à la réalisation d\'une intervention.\n\nLe coût des matériaux fournis dans le cadre de l\'intervention peut être facturé au client.\n\nLorsque cela est applicable, le client reçoit les informations relatives aux matériaux utilisés et à leur prix.\n\nLes matériaux peuvent être fournis ou acquis par SOS Electricity ou par le professionnel intervenant, selon les modalités opérationnelles de SOS Electricity.\n\n10. Tarification\nSOS Electricity détermine les tarifs applicables aux prestations qu\'elle propose.\n\nSelon l\'intervention, le prix peut notamment comprendre :\n\n-un forfait d\'intervention ou de déplacement ;\n-les frais de déplacement ;\n-la main-d\'œuvre ;\n-la main-d\'œuvre supplémentaire ;\n-les matériaux ;\n-les majorations de soirée ;\n-les majorations de nuit ;\n-les majorations de week-end ;\n-les majorations applicables les jours fériés ;\n-les autres frais de service applicables.\n\nLes prix sont communiqués en euros et, lorsque cela est requis, toutes taxes comprises.\n\nLe client est informé du prix applicable avant d\'être engagé par le contrat.\n\n11. Paiement\n\nLe paiement peut être effectué au moyen des solutions de paiement proposées par SOS Electricity, notamment par l\'intermédiaire de prestataires de paiement tiers tels que Stripe.\n\nLe client règle SOS Electricity au titre de la prestation contractée.\nSOS Electricity peut ensuite rémunérer le professionnel ayant réalisé l\'intervention conformément à la relation contractuelle distincte existant entre SOS Electricity et ce professionnel.\n\nLe client ne devient pas partie à cette relation contractuelle distincte du seul fait qu\'un professionnel indépendant réalise l\'intervention.\n\n12. Facturation\n\nSOS Electricity établit au client la facture ou le justificatif de paiement applicable.\n\nLa facture peut notamment mentionner :\n-SOS Electricity ;\n-le client ;\n-la date de l\'intervention ;\n-le lieu de l\'intervention ;\n-les prestations réalisées ;\n-la main-d\'œuvre ;\n-les matériaux ;\n-les frais applicables ;\n-la TVA ;\n-le montant total.\n\n13. Réalisation de l\'intervention\n\nLe client doit fournir des informations exactes et nécessaires à l\'organisation et à la réalisation de l\'intervention.\n\nLe client doit permettre un accès raisonnable et sécurisé au lieu d\'intervention.\n\nLe client doit signaler à SOS Electricity ou au professionnel affecté tout élément connu susceptible de présenter un risque pour la sécurité.\n\nSOS Electricity peut refuser ou suspendre une intervention lorsque les conditions sont dangereuses ou lorsque les travaux nécessiteraient une intervention dépassant les qualifications ou autorisations légales du professionnel affecté.\n\n14. Sécurité électrique et exigences professionnelles\n\nLes travaux électriques sont réalisés par des professionnels disposant des qualifications appropriées et conformément aux lois, règlements et règles professionnelles applicables en France.\n\nSOS Electricity organise ses prestations de manière à affecter les travaux électriques à des personnes disposant des qualifications appropriées pour les travaux concernés.\n\nLes professionnels indépendants auxquels SOS Electricity fait appel restent responsables du maintien de leurs qualifications, immatriculations et assurances professionnelles nécessaires à leur propre activité.\n\n15. Assurances et garanties\n\nSOS Electricity souscrit et maintient les assurances nécessaires à ses activités conformément à la réglementation applicable.\n\nLorsque la réglementation l\'exige, les informations relatives à la responsabilité professionnelle et aux assurances obligatoires applicables sont mentionnées dans les informations légales de la société, les devis ou les factures.\n\nLes professionnels indépendants auxquels SOS Electricity fait appel peuvent également être tenus de disposer des assurances nécessaires à leur activité.\n\nAucune disposition des présentes Conditions Générales n\'a pour objet d\'exclure ou de limiter une garantie légale ou une responsabilité qui ne peut légalement l\'être.\n\n16. Annulation et droit de rétractation\n\nLorsque le client est un consommateur, les droits légaux applicables en matière d\'annulation et de rétractation s\'appliquent.\n\nPour les contrats conclus à distance ou hors établissement, SOS Electricity communique au client les informations relatives au droit de rétractation exigées par la réglementation française.\n\nLorsque le client demande expressément que la prestation commence avant l\'expiration du délai de rétractation applicable, les conséquences juridiques correspondantes lui sont communiquées.\n\nCertaines prestations peuvent être soumises à des exceptions légales ou entraîner la perte du droit de rétractation une fois la prestation entièrement exécutée, sous réserve du respect des conditions prévues par la réglementation applicable.\n\n17. Report de rendez-vous et disponibilité du client\n\nLe client doit prendre les dispositions nécessaires afin d\'être disponible au lieu de l\'intervention à l\'heure convenue.\n\nLorsque le client est absent, ne permet pas l\'accès aux lieux ou a fourni des informations substantiellement erronées, l\'intervention peut devoir être reportée et des frais peuvent être appliqués lorsque la réglementation l\'autorise et que le client en a été préalablement informé.\n\n18. Responsabilité\n\nSOS Electricity est responsable de ses obligations contractuelles envers le client conformément à la réglementation applicable.\n\nLorsque SOS Electricity fait appel à un professionnel indépendant pour exécuter une intervention pour son compte, cela ne transfère pas, en lui-même, le contrat conclu avec le client à ce professionnel indépendant.\n\nSOS Electricity peut exercer les recours contractuels dont elle dispose à l\'encontre d\'un professionnel indépendant qui ne respecterait pas ses obligations envers SOS Electricity.\n\nAucune disposition des présentes Conditions Générales n\'exclut ou ne limite une responsabilité lorsque cette exclusion ou limitation est interdite par la loi.\n\n19. Réclamations\n\nLe client peut adresser toute réclamation à SOS Electricity aux coordonnées indiquées dans les présentes Conditions Générales.\n\nSOS Electricity examine les réclamations relatives à ses services et à l\'exécution des interventions organisées par l\'intermédiaire de sa plateforme.\n\nLorsqu\'une intervention a été réalisée par un professionnel indépendant, SOS Electricity peut recueillir les informations nécessaires auprès de ce professionnel dans le cadre du traitement de la réclamation.\n\n20. Médiation de la consommation\n\nConformément aux dispositions du Code de la consommation concernant « le processus de médiation des litiges de la consommation », après nous avoir sollicités et à défaut de réponse vous satisfaisant, vous avez la possibilité de recourir gratuitement à une procédure de médiation de la consommation auprès de :\n\nCM2C\n49 rue de Ponthieu\n75 008 PARIS\nTel : 01 89 47 00 14\nSite internet : https://www.cm2c.net/declarer-un-litige.php\nMail : litiges@cm2c.net\n\n\n21. Données personnelles\n\nSOS Electricity traite les données personnelles conformément à sa Politique de confidentialité.\n\nLa Politique de confidentialité précise notamment :\n\n-les catégories de données collectées ;\n-les finalités des traitements ;\n-les bases légales ;\n-les durées de conservation ;\n-les destinataires des données ;\n-les droits du client ;\n-les modalités d\'exercice de ces droits.\n\nLa Politique de confidentialité est accessible depuis l\'application et le site internet SOS Electricity.\n\n22. Propriété intellectuelle\n\nL\'application SOS Electricity, son site internet, ses marques, logos, logiciels, bases de données et contenus sont protégés par les règles applicables en matière de propriété intellectuelle.\n\nSauf autorisation expresse, le client ne peut reproduire, modifier, distribuer ou exploiter commercialement les éléments appartenant à SOS Electricity.\n\n23. Plateforme numérique\n\nL\'application et la plateforme SOS Electricity permettent notamment :\n\n-de demander une intervention ;\n-de communiquer des informations concernant un problème électrique ;\n-de planifier une intervention ;\n-de communiquer avec SOS Electricity ;\n-de recevoir les informations opérationnelles relatives au professionnel affecté ;\n-de gérer les rapports d\'intervention ;\n-de gérer les matériaux ;\n-de traiter les paiements ;\n-de recevoir les factures et autres documents.\n\nSOS Electricity peut modifier, suspendre ou interrompre temporairement certaines fonctionnalités pour des raisons de maintenance, de sécurité, de développement ou de conformité réglementaire.\n\n24. Compte utilisateur\n\nLe client est responsable de la confidentialité de ses identifiants et de l\'exactitude des informations associées à son compte.\n\nLe client doit informer SOS Electricity s\'il pense que son compte a été compromis.\n\n25. Droit applicable\n\nLes présentes Conditions Générales sont soumises au droit français, sous réserve des dispositions impératives de protection du consommateur applicables.\n\nTout litige est traité conformément aux règles impératives de compétence juridictionnelle applicables aux consommateurs.\n\n26. Modification des Conditions Générales\n\nSOS Electricity peut modifier les présentes Conditions Générales afin de tenir compte de l\'évolution de ses services, de ses technologies ou de la réglementation applicable.\n\nLa version applicable à un contrat déterminé est celle acceptée par le client au moment concerné, sous réserve des dispositions légales impératives relatives aux modifications contractuelles.\n\n27. Contact\n\nSOS Electricity SAS\nSiège social : 25 rue de Ponthieu, 75008 Paris \nSIREN : 109 421 057 \nSIRET : 109421 05700018\nN° TVA intracommunautaire : currently being validated\nE-mail : contactsoselectricity@gmail.com\n',
    },
    'ih3adh5s': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // privacypolicy
  {
    '9u8t27vm': {
      'en': 'Privacy policy',
      'fr': 'Politique de confidentialité',
    },
    'ug7ait22': {
      'en':
          'Last updated: 16th september 2026\n\nSOS Electricity is committed to protecting the privacy and personal data of its users. This Privacy Policy explains how SOS Electricity collects, uses, stores and protects personal data when you use the SOS Electricity application, website and related services.\n\n1. Who we are\n\nSOS Electricity is a French simplified joint-stock company (Société par Actions Simplifiée – SAS), registered in France.\nRegistered office: 25 rue de Ponthieu 75 008 PARIS\nSIREN: 109 421 057\nVAT number: en cours de validation\nEmail: contactsoselectricity@gmail.com\n\n\nFor the purposes of applicable data protection legislation, SOS Electricity is the data controller for the personal data described in this Privacy Policy, unless otherwise stated.\n\n2. What personal data we collect\n\nDepending on how you use the SOS Electricity service, we may collect:\n\n-Account information\n-First and last name\n-Email address\n-Telephone number\n-Password or authentication information\n-Account type and account status\n-Service and intervention information\n-Service address\n-Description of the electrical problem\n-Appointment information\n-Start and completion times\n-Information concerning the intervention\n-Materials used\n-Photos and documents submitted in connection with an intervention\n-Information contained in reports, notes or recommendations\n\nPayment and transaction information\n\nPayments may be processed through our payment service provider, such as Stripe. \nSOS Electricity does not intend to store complete payment card details on its own systems.\n\nWe may receive information relating to a payment or transaction, such as:\n-transaction identifier;\n-payment status;\n-amount;\n-date of payment.\n\nLocation information\n\nWhere necessary for the provision of the service, we may process location information, including the service address and, where enabled and permitted, location information used to estimate travel distance or facilitate the intervention.\nWe will only request access to device location where this is necessary for a specific service feature and where permitted by applicable law.\n\nTechnical information\n\nWe may also process information necessary to operate and secure the application, such as:\n-IP address;\n-device and browser information;\n-application logs;\n-authentication and security information;\n-technical error information.\n\n3. Why we use your personal data\n\nWe may use personal data to:\n-create and manage your account;\n-provide and administer electrical intervention services;\n-connect customers with appropriate electricians;\n-arrange appointments and interventions;\n-calculate travel, intervention, labour and material charges;\n-process and confirm payments;\n-provide invoices and receipts;\n-communicate with customers and electricians;\n-manage customer service requests;\n-maintain intervention records and reports;\n-prevent fraud, misuse and security incidents;\n-maintain and improve the application;\ncomply with legal and regulatory obligations;\n-resolve disputes and enforce our contractual rights.\n\n4. Legal bases for processing\n\nDepending on the circumstances, SOS Electricity may rely on the following legal bases:\n\nPerformance of a contract\n\nWhere processing is necessary to provide the requested service, manage an intervention, communicate with you or process a transaction.\n\nLegal obligation\n\nWhere processing is necessary to comply with applicable legal, accounting, tax or regulatory requirements.\n\nLegitimate interests\n\nWhere processing is necessary for legitimate business purposes such as securing our services, preventing fraud, managing disputes, improving our services and protecting our business, provided that these interests do not override your fundamental rights.\n\nConsent\n\nWhere applicable law requires your consent, such as for certain optional communications or certain forms of tracking or marketing.\nYou may withdraw consent at any time where processing is based on consent.\n\n5. Who may receive your data\n\nDepending on the service provided, personal data may be shared with:\n\n-electricians or partner electricians involved in providing the requested service;\n-payment service providers, including Stripe where applicable;\n-hosting and cloud service providers;\n-software and application service providers;\n-customer-support providers;\n-professional advisers, where necessary;\n-insurers, where necessary;\n-competent authorities where required by law.\n\nWe only provide third parties with information that is reasonably necessary for the relevant purpose.\n\n6. International transfers\n\nSome of our service providers may process personal data outside France or the European Economic Area.\n\nWhere personal data is transferred outside the European Economic Area, SOS Electricity will take appropriate measures required by applicable data protection legislation to protect the transferred information.\n\n7. How long we keep your data\n\nWe retain personal data only for as long as necessary for the purposes for which it was collected, including to comply with legal, accounting and tax obligations and to establish, exercise or defend legal claims.\nDifferent categories of information may therefore be retained for different periods.\n\nWe will periodically review retained information and delete or anonymise information that is no longer required.\n\n8. Your rights\n\nSubject to applicable legal conditions, you may have the right to:\n-access your personal data;\n-request correction of inaccurate or incomplete data;\n-request deletion of your personal data;\n-request restriction of processing;\n-object to certain processing;\n-request portability of certain personal data;\n-withdraw consent where processing is based on consent.\n\nTo exercise your rights, contact:\n\ncontactsoselectricity@gmail.com\n\nWe may need to verify your identity before responding to a request.\n\nYou also have the right to lodge a complaint with the French data protection authority, the Commission Nationale de l\'Informatique et des Libertés (CNIL).\n\n9. Security\n\nSOS Electricity takes appropriate technical and organisational measures designed to protect personal data against unauthorised access, loss, destruction, alteration or disclosure.\nHowever, no internet-based system can be guaranteed to be completely secure.\n\n10. Cookies and similar technologies\n\nThe SOS Electricity website or application may use cookies or similar technologies.\nWhere consent is required, non-essential cookies will only be used after obtaining the appropriate consent.\nInformation about cookies and your preferences may be provided through our cookie-management mechanism.\n\n11. Children\'s data\n\nThe SOS Electricity service is intended for adults. We do not knowingly collect personal data from children for the purpose of creating accounts or ordering services.\n\n12. Changes to this Privacy Policy\n\nWe may update this Privacy Policy from time to time to reflect changes to our services, technology, legal requirements or data-processing practices.\nThe latest version will be made available through the SOS Electricity application or website.\n\n13. Contact\n\nFor any question concerning this Privacy Policy or the processing of your personal data:\n\nSOS Electricity SAS\n25 rue de Ponthieu 75 008 PARIS\ncontactsoselectricity@gmail.com\nSIREN: 109 421 057\nVAT number: en cours de validation\n',
      'fr':
          '\nDernière mise à jour : 16 septembre 2026\n\nSOS Electricity accorde une importance particulière à la protection de vos données personnelles. \nLa présente Politique de confidentialité explique quelles données personnelles nous collectons, pourquoi nous les utilisons, avec qui nous pouvons les partager et quels sont vos droits.\n\n1. Qui sommes-nous ?\n\nSOS Electricity est une société française constituée sous la forme d\'une Société par Actions Simplifiée (SAS).\nSiège social : 25 rue de Ponthieu 75 008 PARIS\nSIREN : 109 421 057\nN° TVA intracommunautaire : currently being validated\nE-mail : contactsoselectricity@gmail.com\n\nPour les traitements de données personnelles décrits dans la présente politique, SOS Electricity agit en principe en qualité de responsable du traitement, sauf indication contraire.\n\n2. Quelles données personnelles collectons-nous ?\n\nSelon votre utilisation de l\'application et de nos services, nous pouvons collecter les catégories de données suivantes.\n\nDonnées de compte\n\n-Nom et prénom\n-Adresse e-mail\n-Numéro de téléphone\n-Informations d\'authentification\n-Type et statut du compte\n\nDonnées relatives aux interventions\n\n-Adresse du lieu d\'intervention\n-Description de la panne ou du problème électrique\n-Informations relatives au rendez-vous\n-Heure de début et de fin de l\'intervention\n-Informations relatives à l\'intervention réalisée\n-Matériel utilisé\n-Photos et documents transmis dans le cadre de l\'intervention\n-Informations contenues dans les rapports, notes et recommandations\n\nDonnées relatives aux paiements\n\nLes paiements peuvent être traités par un prestataire de services de paiement, notamment Stripe lorsque cette solution est utilisée.\nSOS Electricity n\'a pas vocation à conserver elle-même les données complètes de votre carte bancaire.\nNous pouvons notamment recevoir :\n-l\'identifiant de transaction ;\n-le statut du paiement ;\n-le montant ;\n-la date du paiement.\n\nDonnées de localisation\n\nLorsque cela est nécessaire à la fourniture du service, nous pouvons traiter des informations de localisation, notamment l\'adresse d\'intervention et, lorsque cette fonctionnalité est activée et autorisée, des données permettant d\'estimer la distance parcourue ou de faciliter l\'intervention.\nNous ne demanderons l\'accès à la localisation de votre appareil que lorsqu\'il est nécessaire à une fonctionnalité déterminée et dans les conditions autorisées par la réglementation applicable.\n\nDonnées techniques\n\nNous pouvons également traiter certaines données techniques nécessaires au fonctionnement et à la sécurité de l\'application, notamment :\n-adresse IP ;\n-informations relatives à l\'appareil et au navigateur ;\n-journaux techniques ;\n-informations d\'authentification et de sécurité ;\n-informations relatives aux erreurs techniques.\n\n3. Pourquoi utilisons-nous vos données ?\n\nVos données peuvent notamment être utilisées afin de :\n-créer et gérer votre compte ;\n-fournir et administrer les services d\'intervention électrique ;\n-mettre en relation les clients avec des électriciens ;\n-organiser les rendez-vous et interventions ;\n-calculer les frais de déplacement, d\'intervention, de main-d\'œuvre et de matériel ;\n-traiter et confirmer les paiements ;\n-établir les factures et justificatifs ;\n-communiquer avec les clients et les électriciens ;\n-gérer les demandes d\'intervention ;\n-conserver les comptes rendus et rapports d\'intervention ;\n-prévenir la fraude, les abus et les incidents de sécurité ;\n-assurer le fonctionnement et améliorer l\'application ;\n-respecter nos obligations légales et réglementaires ;\n-gérer les litiges et faire valoir nos droits contractuels.\n\n4. Fondements juridiques des traitements\n\nSelon les circonstances, SOS Electricity peut traiter vos données sur les fondements juridiques suivants :\n\nExécution du contrat\n\nLorsque le traitement est nécessaire à la fourniture du service demandé, à la gestion d\'une intervention, aux communications nécessaires au service ou au traitement d\'une transaction.\n\nRespect d\'une obligation légale\n\nLorsque le traitement est nécessaire pour respecter nos obligations légales, comptables, fiscales ou réglementaires.\n\nIntérêt légitime\n\nLorsque le traitement est nécessaire à des fins légitimes telles que la sécurisation de nos services, la prévention de la fraude, la gestion des litiges, l\'amélioration de nos services ou la protection de nos intérêts, sous réserve du respect de vos droits et libertés.\n\nConsentement\n\nLorsque votre consentement est requis par la réglementation applicable, notamment pour certains traitements facultatifs ou certaines opérations de prospection ou de suivi.\n\nLorsque le traitement repose sur votre consentement, vous pouvez retirer celui-ci à tout moment.\n\n5. Avec qui vos données peuvent-elles être partagées ?\nSelon les circonstances, vos données peuvent être communiquées à :\n\n-l\'électricien ou aux électriciens partenaires chargés de l\'intervention ;\n-nos prestataires de paiement, notamment Stripe le cas échéant ;\n-nos prestataires d\'hébergement et de services cloud ;\n-nos prestataires techniques et logiciels ;\n-nos prestataires de support client ;\n-nos conseils professionnels lorsque cela est nécessaire ;\n-nos assureurs lorsque cela est nécessaire ;\n-les autorités compétentes lorsque la loi nous l\'impose.\n\nNous veillons à ne communiquer que les informations nécessaires à la réalisation de la finalité concernée.\n\n6. Transferts de données hors de l\'Union européenne\n\nCertains de nos prestataires peuvent traiter des données personnelles en dehors de la France ou de l\'Espace économique européen.\nLorsque des données sont transférées en dehors de l\'Espace économique européen, SOS Electricity met en œuvre les garanties appropriées exigées par la réglementation applicable en matière de protection des données personnelles.\n\n7. Durée de conservation\n\nSOS Electricity conserve vos données personnelles pendant la durée nécessaire aux finalités pour lesquelles elles ont été collectées, ainsi que, lorsque cela est nécessaire, pendant les durées imposées par les obligations légales, comptables et fiscales ou pour permettre la constatation, l\'exercice ou la défense de droits en justice.\nLes différentes catégories de données peuvent donc être conservées pendant des durées différentes.\nNous procédons régulièrement à la réévaluation des données conservées et supprimons ou anonymisons celles qui ne sont plus nécessaires.\n\n8. Vos droits\n\nSous réserve des conditions prévues par la réglementation, vous pouvez notamment disposer des droits suivants :\n\n-droit d\'accès à vos données ;\n-droit de rectification des données inexactes ou incomplètes ;\n-droit à l\'effacement ;\n-droit à la limitation du traitement ;\n-droit d\'opposition à certains traitements ;\n-droit à la portabilité de certaines données ;\n-droit de retirer votre consentement lorsque le traitement repose sur celui-ci.\n\nPour exercer vos droits, vous pouvez nous contacter à l\'adresse suivante :\n\ncontactsoselectricity@gmail.com\n\nNous pouvons vous demander de justifier votre identité lorsque cela est nécessaire.\nVous disposez également du droit d\'introduire une réclamation auprès de la Commission Nationale de l\'Informatique et des Libertés (CNIL).\n\n9. Sécurité\n\nSOS Electricity met en œuvre des mesures techniques et organisationnelles appropriées destinées à protéger vos données personnelles contre les accès non autorisés, la perte, la destruction, la modification ou la divulgation.\n\nToutefois, aucun système utilisant Internet ne peut être garanti comme totalement sécurisé.\n\n10. Cookies et technologies similaires\n\nLe site ou l\'application SOS Electricity peut utiliser des cookies ou technologies similaires.\n\nLorsque le consentement est requis, les cookies non nécessaires au fonctionnement du service ne seront utilisés qu\'après obtention du consentement approprié.\n\nLes modalités de gestion des cookies et de vos préférences peuvent être précisées dans notre mécanisme de gestion des cookies.\n\n11. Données des mineurs\n\nLes services SOS Electricity sont destinés aux adultes. \n\nNous ne collectons pas sciemment de données personnelles de mineurs dans le but de leur permettre de créer un compte ou de commander des services.\n\n12. Modification de la présente politique\n\nSOS Electricity peut modifier la présente Politique de confidentialité afin de tenir compte de l\'évolution de ses services, de ses technologies, de la réglementation ou de ses pratiques en matière de traitement des données.\nLa version la plus récente sera accessible depuis l\'application ou le site SOS Electricity.\n\n13. Contact\n\nPour toute question concernant la présente Politique de confidentialité ou le traitement de vos données personnelles :\n\nSOS Electricity SAS\n25 rue de Ponthieu\ncontactsoselectricity@gmail.com\n\nSIREN :  109 421 057\nN° TVA intracommunautaire : currently being validated\n\n\n\n\n',
    },
    '285xpg82': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // MyAccountPage
  {
    '6p2shggx': {
      'en': 'is available',
      'fr': 'Disponible',
    },
    'zo49q2f7': {
      'en': 'Edit Profile',
      'fr': 'Editer le profile',
    },
    'v8h6c9xq': {
      'en': 'Account Settings',
      'fr': 'Paramètres du compte',
    },
    'uvzp52vr': {
      'en': 'My requests',
      'fr': 'Mes demandes',
    },
    'vw196yfj': {
      'en': 'Log Out',
      'fr': 'Se déconnecter',
    },
    'an5adq47': {
      'en': '__',
      'fr': '',
    },
  },
  // EditProfileCustomer
  {
    'lpsne7pg': {
      'en': 'Name',
      'fr': 'Prénom et nom',
    },
    'zpm8i9cg': {
      'en': 'Phone',
      'fr': 'Téléphone',
    },
    'qvozbs94': {
      'en': 'Service area',
      'fr': 'zone d\'intervention',
    },
    'i5v22w5m': {
      'en': 'Save',
      'fr': 'Enregistrer',
    },
    '2zcph3ut': {
      'en': '__',
      'fr': '',
    },
  },
  // CancellationRefundPolicy
  {
    'yt0inv9e': {
      'en': 'Cancellation & Refund Policy',
      'fr': 'Politique d’annulation et de remboursement',
    },
    'lvtg27pq': {
      'en':
          'Last updated: 18th of September 2026\n\nThis Cancellation and Refund Policy applies to services provided by SOS Electricity SAS (“SOS Electricity”, “we”, “us” or “our”) through its application and digital platform.\n\nIt supplements our Terms and Conditions and other contractual information applicable to the service.\n\n1. Cancellation before the electrician departs\n\nThe customer may request cancellation of an intervention before the electrician assigned to the intervention has departed.\n\nWhere cancellation takes place before the electrician\'s departure and no service has started, amounts that have not yet become payable may be refunded in accordance with this policy and subject to applicable statutory rights.\n\nThe €45 SOS Electricity service fee may nevertheless remain payable where the intervention has already been confirmed and the fee relates to administrative, matching, scheduling or processing services already undertaken.\n\n2. Cancellation after the electrician has departed\n\nOnce the electrician assigned to the intervention has started travelling to the customer\'s address, the €35 travel fee is non-refundable, subject to mandatory statutory provisions.\n\nThe €45 SOS Electricity service fee is also non-refundable once the intervention has been confirmed and SOS Electricity has undertaken the necessary processing activities, subject to the customer\'s statutory rights.\n\n3. Electrician\'s arrival and start of diagnosis\n\nOnce the electrician has arrived at the intervention location and the diagnosis has started, the €100 diagnostic fee becomes payable in accordance with the applicable pricing terms.\n\nServices actually performed and any materials supplied or used may also be charged.\n\nHowever, mandatory statutory provisions relating to the right of withdrawal and emergency services remain applicable where relevant.\n\n4. Statutory rights\n\nNothing in this policy limits any mandatory rights granted to consumers under the French Consumer Code or other applicable legislation.\n\nWhere maintenance or repair services are expressly requested by a consumer because of an emergency at the consumer\'s home, the specific statutory rules applicable to such emergency interventions will be taken into account.\n\n5. Statutory right of withdrawal\n\nWhere legally applicable, consumers have a fourteen (14) day withdrawal period for distance contracts, subject to the applicable provisions of French consumer law.\n\nHowever, the right of withdrawal does not apply, in particular, to urgent maintenance or repair work carried out at the consumer\'s home where the work was expressly requested by the consumer, within the limits provided by applicable law.\n\nWhere a consumer expressly requests that a service begin before the expiry of the withdrawal period, the statutory rules concerning early performance of the service and the consequences of withdrawal will apply.\n\nWhere the right of withdrawal applies, the customer may exercise it in accordance with the procedure set out in our Terms and Conditions and/or the withdrawal form made available to the customer.\n\n6. Refunds\n\nWhere a refund is due, SOS Electricity will refund the relevant amount using the payment method used for the original payment, unless otherwise required by law or agreed with the customer.\n\nRefunds may be full or partial depending on the circumstances.\nThe time required for a refund to appear in the customer\'s account depends on the payment method and the customer\'s bank or payment provider. Refunds processed through Stripe may take several business days to appear in the customer\'s account.\n\n7. Non-conforming services or problems relating to an intervention\n\nThis policy does not limit the customer\'s statutory rights in the event of non-conforming services, breach of contract or any other circumstance giving rise to a legal remedy or refund.\n\nComplaints should be submitted to SOS Electricity as soon as reasonably possible, together with sufficient information to identify the relevant intervention.\n\n8. Materials and parts\n\nWhere a refund concerns an intervention involving materials or parts, the refundable amount may depend on the status of those materials, subject to the customer\'s statutory rights.\n\nMaterials specifically ordered, installed or used for the intervention may be subject to the rules applicable to the relevant service.\n\n9. Intervention unavailable or delayed\n\nIf SOS Electricity or the electrician assigned to an intervention is unable to provide the service for a reason attributable to SOS Electricity, the customer may be entitled to a refund of amounts relating to services not provided, subject to applicable law.\n\nIf a replacement intervention is offered and accepted by the customer, amounts already paid may, where appropriate, be retained and applied to the replacement intervention.\n\n10. Refunds relating to Stripe payments\n\nPayments made by card or another payment method supported by Stripe may be refunded through Stripe.\n\nA refund is made against the relevant transaction and may be full or partial.\n\nThe processing time and the time required for the refund to appear in the customer\'s account depend on the payment method and the customer\'s financial institution.\n\n11. Business customers\n\nConsumer protection rules applicable to individual consumers do not necessarily apply in the same way to business customers.\n\nCancellation, refund and termination terms applicable to business customers may be set out in their contract, subscription agreement or applicable commercial terms.\n\n12. Complaints\n\nCancellation, refund or complaint requests may be sent to:\n\ncontact@soselectricity.com\n\nWhere possible, the customer should provide the relevant service request or transaction number.\n\n13. Statutory rights\n\nNothing in this policy is intended to exclude, restrict or replace any rights that the customer is mandatorily entitled to under French or European Union law.\nWhere this policy conflicts with a mandatory legal provision applicable to the customer, the mandatory legal provision will prevail.\n\n14. Changes to this policy\n\nSOS Electricity may amend this Cancellation and Refund Policy to reflect changes to its services, procedures or applicable law.\nThe applicable version is the version published at the time the contract is entered into, unless applicable law requires otherwise.\n\n',
      'fr':
          'Dernière mise à jour : 18 septembre 2026\n\nLa présente Politique d’annulation et de remboursement s’applique aux prestations proposées par SOS Electricity SAS (« SOS Electricity », « nous », « notre » ou « nos ») via son application et sa plateforme numérique.\n\nElle complète les Conditions Générales de Vente et les autres informations contractuelles applicables à la prestation.\n\n 1. Annulation avant le départ de l\'électricien\n\nLe client peut demander l\'annulation d\'une intervention avant le départ de l\'électricien affecté à l\'intervention.\n\nLorsque l\'annulation intervient avant le départ de l\'électricien et qu\'aucune prestation n\'a commencé, les montants qui ne sont pas encore devenus exigibles peuvent être remboursés conformément à la présente politique et sous réserve des droits légaux applicables.\n\nLes frais de service SOS Electricity de 45 € peuvent toutefois rester dus lorsque l\'intervention a déjà été confirmée et que ces frais correspondent à des services administratifs, de mise en relation, de planification ou de traitement déjà engagés.\n\n2. Annulation après le départ de l\'électricien\n\nDès que l\'électricien affecté à l\'intervention a commencé son déplacement vers l\'adresse du client, les frais de déplacement de 35 € ne sont plus remboursables, sous réserve des dispositions légales impératives applicables.\n\nLes frais de service SOS Electricity de 45 € ne sont également pas remboursables lorsque l\'intervention a été confirmée et que SOS Electricity a engagé les opérations nécessaires à son traitement, sous réserve des droits légaux du consommateur.\n\n3. Arrivée de l\'électricien et début du diagnostic\n\nLorsque l\'électricien est arrivé sur le lieu de l\'intervention et que le diagnostic a commencé, le forfait diagnostic de 100 € devient payable conformément aux conditions tarifaires applicables.\nLes prestations effectivement réalisées, ainsi que les éventuels matériaux fournis ou utilisés, peuvent également être facturés.\n\nToutefois, les dispositions légales impératives relatives au droit de rétractation et aux prestations d\'urgence demeurent applicables lorsqu\'elles sont pertinentes.\n\n4. Droit de rétractation et dispositions impératives\n\nLes dispositions de la présente politique relatives aux frais non remboursables ne limitent pas les droits dont le consommateur bénéficie impérativement en vertu du Code de la consommation ou de toute autre réglementation applicable.\n\nLorsqu\'une prestation d\'entretien ou de réparation est sollicitée expressément par le consommateur en raison d\'une situation d\'urgence à son domicile, les règles particulières applicables à ces interventions sont notamment prises en compte.\n\n\n5. Droit de rétractation\n\nLorsqu’il est légalement applicable, le consommateur dispose d’un délai de rétractation de quatorze (14) jours pour les contrats conclus à distance, conformément aux dispositions applicables du Code de la consommation.\n\nToutefois, le droit de rétractation ne s’applique notamment pas aux travaux d’entretien ou de réparation à réaliser en urgence au domicile du consommateur lorsqu’ils ont été expressément sollicités par celui-ci, dans les limites prévues par la réglementation applicable.\n\nLorsqu’un consommateur demande expressément que l’exécution d’une prestation commence avant l’expiration du délai de rétractation, les règles légales relatives à l’exécution anticipée du service et aux conséquences d’une rétractation s’appliquent.\n\nLorsque le droit de rétractation est applicable, le client peut l’exercer selon les modalités communiquées dans les Conditions Générales de Vente et/ou le formulaire de rétractation mis à sa disposition.\n\n6. Remboursements\n\nLorsqu’un remboursement est dû, SOS Electricity procède au remboursement du montant concerné via le moyen de paiement utilisé lors du paiement initial, sauf disposition légale ou accord contraire.\n\nLes remboursements peuvent être totaux ou partiels selon les circonstances.\n\nLe délai d’apparition du remboursement sur le compte du client dépend notamment du moyen de paiement et de l’établissement bancaire. \n\nLes remboursements traités par Stripe peuvent notamment prendre plusieurs jours ouvrés avant d’apparaître sur le compte du client.\n\n7. Prestations non conformes ou problèmes liés à l’intervention\n\nLa présente politique ne limite pas les droits légaux du consommateur en cas de prestation non conforme, de manquement contractuel ou de toute autre situation ouvrant droit à un recours ou à un remboursement en vertu de la loi.\n\nToute réclamation doit être adressée à SOS Electricity dans les meilleurs délais, avec les informations permettant d’identifier l’intervention concernée.\n\n8. Matériaux et pièces\n\nLorsqu’un remboursement concerne une intervention comprenant des matériaux ou des pièces, le montant remboursable peut dépendre du statut des matériaux concernés et de leur utilisation, sous réserve des droits légaux du client.\n\nLes matériaux spécialement commandés, installés ou utilisés pour l’intervention peuvent être soumis aux règles applicables à la prestation concernée.\n\n9. Annulation d’une intervention impossible ou retardée\n\nSi SOS Electricity ou l’électricien affecté à l’intervention ne peut pas réaliser la prestation pour une raison imputable à SOS Electricity, le client pourra obtenir le remboursement des sommes correspondant aux prestations non réalisées, sous réserve des dispositions légales applicables.\n\nSi une nouvelle intervention est proposée et acceptée par le client, les sommes déjà payées pourront, lorsque cela est approprié, être conservées et affectées à la nouvelle intervention.\n\n10. Remboursements liés aux paiements Stripe\n\nLes paiements effectués par carte bancaire ou par un autre moyen de paiement pris en charge par Stripe peuvent être remboursés via Stripe.\n\nLe remboursement est effectué sur la transaction concernée et peut être total ou partiel.\n\nLes délais de traitement et d’apparition du remboursement dépendent du moyen de paiement utilisé et de l’établissement financier du client.\n\n11. Clients professionnels\n\nLes règles légales protectrices applicables aux consommateurs et aux particuliers ne s’appliquent pas nécessairement de la même manière aux clients professionnels.\n\nLes conditions d’annulation, de remboursement et de résiliation applicables aux clients professionnels peuvent être définies dans leur contrat, leur abonnement ou leurs conditions commerciales spécifiques.\n\n12. Réclamations\n\nToute demande d’annulation, de remboursement ou de réclamation peut être adressée à :\n\ncontact@soselectricity.com\n\nLe client doit, lorsque cela est possible, communiquer le numéro de la demande d’intervention ou de la transaction concernée.\n\n13. Droits légaux\n\nAucune disposition de la présente politique n\'a pour objet de supprimer, limiter ou remplacer les droits dont le client bénéficie impérativement en vertu du droit français ou du droit de l’Union européenne.\n\nEn cas de contradiction entre la présente politique et une disposition légale impérative applicable au client, cette disposition légale prévaut.\n\n14. Modification de la politique\n\nSOS Electricity peut modifier la présente Politique d’annulation et de remboursement afin de tenir compte de l’évolution de ses services, de ses procédures ou de la réglementation applicable.\n\nLa version applicable est celle publiée au moment de la conclusion du contrat, sauf lorsque la loi impose l’application d’une version différente.\n\n\n\n\n',
    },
    'w0fz0fra': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // RequestOptionsPage
  {
    'f40wn5ae': {
      'en': 'Request an electrician',
      'fr': 'Demander un électricien',
    },
    '39im8hq4': {
      'en': 'How would you like to continue?',
      'fr': 'Comment souhaitez-vous poursuivre ?',
    },
    'phdwa6th': {
      'en': 'Create an account',
      'fr': 'Créer un compte',
    },
    'j8x7ecwz': {
      'en': 'Save your details and easily manage your requests',
      'fr': 'Enregistrez vos informations et gérez facilement vos demandes.',
    },
    'czchko95': {
      'en': 'Continue as a guest',
      'fr': 'Continuer en tant qu\'invité',
    },
    'slydjdk0': {
      'en': 'Request an electrician without creating an account',
      'fr': 'Demander l\'intervention d\'un électricien sans créer de compte',
    },
    '17nvf7tm': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // ourprices
  {
    '6twg3ays': {
      'en': 'Our prices',
      'fr': 'Nos prix',
    },
    'mbxm9lrc': {
      'en': 'Clear, transparent pricing for common electrical services.',
      'fr':
          'Tarification claire et transparente pour les services électriques courants.',
    },
    '2gxm9grr': {
      'en': 'Electrical fault diagnosis  €100-€150',
      'fr': 'Diagnostic de panne électrique 100 € – 150 €',
    },
    'bz0xe5ec': {
      'en': 'Diagnosis and identification of common electrical faults',
      'fr': 'Diagnostic et identification des pannes électriques courantes',
    },
    '35o82pw2': {
      'en': 'Circuit breaker / Electrical fault €100-€250',
      'fr': 'Disjoncteur / Défaut électrique 100 € – 250 €',
    },
    'a20m1zf6': {
      'en': 'Diagnosis and repair of common circuit breaker and circuit faults',
      'fr':
          'Diagnostic et réparations des pannes courantes de disjoncteurs et de circuits',
    },
    'tj85rnkf': {
      'en': 'Emergency electrician call-out  €120- €250',
      'fr': 'Intervention d\'un électricien en urgence  120 € – 250 €',
    },
    '4p2et127': {
      'en': 'Emergency attendance for urgent electrical problems',
      'fr': 'Intervention d\'urgence pour des problèmes électriques urgents',
    },
    '3ueuhzd1': {
      'en': 'Everyday Electrical Services\n',
      'fr': 'Services d\'électricité courants\n',
    },
    '4doso44o': {
      'en':
          'Electrical safety inspection of an existing electrical installation. €100 – €250',
      'fr':
          'Inspection de sécurité  d\'une installation électrique existante. 100 € – 250 €',
    },
    '0cot3c2o': {
      'en': 'Installation of a new circuit where appropriate. €150 – €400',
      'fr': 'Installation d\'un nouveau circuit, le cas échéant. 150 € – 400 €',
    },
    'bgr944rj': {
      'en': 'Light fitting installation or replacement. €80 – €180\n',
      'fr':
          'Installation ou remplacement d\'un luminaire standard. 80 € – 180 €\n',
    },
    'hxuicd4o': {
      'en': 'Socket or switch replacement or installation. €80 – €150',
      'fr':
          'Remplacement ou installation de prise ou d\'interrupteur standard. 80 € – 150 €',
    },
    'ug1sef6q': {
      'en': 'Larger-scale electrical projects',
      'fr': 'Projets électriques de plus grande envergure ',
    },
    'qlyq8ehz': {
      'en': 'Electrical rewiring\n€1,500 – €5,000+',
      'fr':
          'Rénovation complète de l\'installation électrique\n1 500 € – 5 000 € et plus',
    },
    'zifvober': {
      'en':
          'EV charger installation\n€500 – €1,500+\nInstallation price depends on the charger, cable route and electrical installation.',
      'fr':
          'Installation de borne de recharge pour véhicule électrique\n500 € – 1 500 € et plus\nLe coût de l\'installation dépend du modèle de borne, du tracé des câbles et de l\'installation électrique.',
    },
    'cv8i1x2s': {
      'en':
          'Fuse board / electrical panel work\n€250 – €800+\nPrice depends on the existing installation and work required.',
      'fr':
          'Travaux sur tableau électrique\n250 € – 800 € et plus\nLe prix dépend de l\'installation existante et des travaux à réaliser.',
    },
    'f04uf3c9': {
      'en': 'Larger projects are assessed individually before work begins.',
      'fr':
          'Les projets de plus grande envergure font l\'objet d\'une évaluation individuelle avant le début des travaux.',
    },
    'hhtoxi7l': {
      'en':
          'Good to know\n\nThese prices are indicative ranges rather than fixed quotations.\nThe final cost can depend on labour time, materials, accessibility, the condition of the existing installation and any additional work required.\nWe will explain any significant additional work and its expected cost before proceeding whenever possible.\nEmergency, out-of-hours and other special call-outs may have different rates.',
      'fr':
          'Bon à savoir\n\nCes prix constituent des fourchettes indicatives plutôt que des devis fermes.\nLe coût final peut varier en fonction du temps de main-d\'œuvre, des matériaux, de l\'accessibilité, de l\'état de l\'installation existante et de tout travail supplémentaire nécessaire.\nDans la mesure du possible, nous vous informerons de tout travail supplémentaire important et de son coût estimé avant d\'intervenir.\nDes tarifs différents peuvent s\'appliquer aux interventions d\'urgence, aux interventions en dehors des horaires habituels et aux autres déplacements spécifiques.',
    },
    'pjn7hovy': {
      'en':
          'Need an electrician?\n\nTell us what you need and we\'ll help you get started',
      'fr':
          'Besoin d\'un électricien ?\n\nDites-nous ce dont vous avez besoin et nous vous aiderons à démarrer.',
    },
    '12yrzctn': {
      'en': 'Request an electrician',
      'fr': 'Demander un electricien',
    },
    'rn7s1v8u': {
      'en': 'Ask our AI assistant',
      'fr': 'Assistant IA',
    },
    '0m74p4q1': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // AIAssistantPageCopy
  {
    '8wcdym2c': {
      'en': 'AI Assistant Page',
      'fr': 'Page Assistant IA',
    },
    'dgcw31q0': {
      'en': 'Ask anything',
      'fr': 'Posez votre question',
    },
    'qb7x2gg4': {
      'en': 'Send',
      'fr': 'Envoyer',
    },
    'dmjffeyx': {
      'en': 'Our prices |',
      'fr': 'Nos prix |',
    },
    'rknhiyuh': {
      'en': 'Contact us |',
      'fr': 'Nous contacter | ',
    },
    '2yvhq5z6': {
      'en': ' Request an electrician',
      'fr': 'Demander une intervention',
    },
    '1x9417a6': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // ProfileCustomer
  {
    'cxkgu7zu': {
      'en': 'Edit Profile',
      'fr': 'Editer le profile',
    },
    'q1lgz1aa': {
      'en': 'My requests',
      'fr': 'Mes demandes',
    },
    'v0oc83wl': {
      'en': 'Log Out',
      'fr': 'Se déconnecter',
    },
    'g90p7rrq': {
      'en': '__',
      'fr': '',
    },
  },
  // ProfileElectricianCopy
  {
    'imx7gza1': {
      'en': 'is available',
      'fr': 'Disponible',
    },
    'gufhnbnh': {
      'en': 'Edit Profile',
      'fr': 'Editer le profile',
    },
    'lql5ven4': {
      'en': 'Account Settings',
      'fr': 'Paramètres du compte',
    },
    'l2lsnxgm': {
      'en': 'My requests',
      'fr': 'Mes interventions',
    },
    'mclnc0l3': {
      'en': 'Log Out',
      'fr': 'Se déconnecter',
    },
    'fee5wgl6': {
      'en': '__',
      'fr': '',
    },
  },
  // serviceRequestadmin
  {
    'lumd3zbc': {
      'en': 'Select level of urgency',
      'fr': 'Sélectionnez le niveau d\'urgence',
    },
    'kegh2k2s': {
      'en': 'Search...',
      'fr': 'Recherchez...',
    },
    'mku1jtlz': {
      'en': 'Haut (urgence) ',
      'fr': 'High',
    },
    'wu8vcj6f': {
      'en': 'Moyen ',
      'fr': 'Medium',
    },
    'an2ejor9': {
      'en': 'Bas ',
      'fr': 'Low',
    },
    'dnxjxjzw': {
      'en': 'Select...',
      'fr': 'Sélectionnez un électricien',
    },
    '9jhvywvz': {
      'en': 'Search...',
      'fr': '',
    },
    '0lwt6s4d': {
      'en': 'Option 1',
      'fr': '',
    },
    'pf6av5sg': {
      'en': 'Option 2',
      'fr': '',
    },
    '4m5urxpm': {
      'en': 'Option 3',
      'fr': '',
    },
    '7zktkh1k': {
      'en': 'The electrician has accepted the job.',
      'fr': 'L\'électricien a accepté l\'intervention.',
    },
    '93t6aqhk': {
      'en': '✅ Deposit received.',
      'fr': 'Acompte reçu.',
    },
    '6ycrjdfl': {
      'en': 'Assign electrician',
      'fr': 'Assigner un électricien',
    },
    'n5kpxsec': {
      'en': 'Cancel Job',
      'fr': 'Annuler l\'intervention',
    },
  },
  // CancelJobDialog
  {
    '7rpstpi9': {
      'en': 'Are you sure you want to cancel this job?',
      'fr': 'Êtes-vous sûr(e) de vouloir annuler cette intervention ?',
    },
    'vzplu2t8': {
      'en': 'Cancel',
      'fr': 'Annuler ',
    },
    '31o3iyeu': {
      'en': 'Reasons for cancellation:',
      'fr': 'Raison(s) de l\'annulation:',
    },
    'csj5h86g': {
      'en': 'Confirm',
      'fr': 'Confirmer',
    },
  },
  // serviceRequest_Electrician
  {
    'y5lod8ds': {
      'en': 'Select the job category',
      'fr': 'Sélectionnez la catégorie d\'intervention',
    },
    'kbsk4m4l': {
      'en': 'Search...',
      'fr': '',
    },
    'l5lf2u02': {
      'en': 'Panne  électrique urgente',
      'fr': 'Emergency fault',
    },
    '9i1pekmk': {
      'en': 'Éclairage',
      'fr': 'lighting',
    },
    'lmspruee': {
      'en': 'Réparation de prise électrique',
      'fr': 'socket repair',
    },
    '5l14bjxe': {
      'en': 'Tableau électrique ',
      'fr': 'fuse board',
    },
    'er2eitld': {
      'en': 'Chargeur pour véhicule électrique',
      'fr': 'EV charger',
    },
    'jziajk03': {
      'en': 'Recâblage ',
      'fr': 'Rewiring',
    },
    'u9g0gjxp': {
      'en': 'Inspection de sécurité électrique ',
      'fr': 'Electrical safety Inspection',
    },
    'ig1o9268': {
      'en':
          '✅ Deposit received.\nYou may now proceed to the customer location.',
      'fr': 'Acompte reçu.\nVous pouvez maintenant vous rendre chez le client.',
    },
    'ukhhe0u2': {
      'en':
          'Dispatch authorized.\nYou may now proceed to the customer location.',
      'fr':
          'Envoi électricien autorisé.\nVous pouvez maintenant vous rendre chez le client.',
    },
    'ier3enip': {
      'en': 'Accept',
      'fr': 'Accepter',
    },
    'om5l6cp9': {
      'en': 'Refuse',
      'fr': 'Refuser',
    },
    'rsjrksdk': {
      'en': 'Start journey',
      'fr': 'Commencer le trajet',
    },
    'nuwwbdue': {
      'en': 'Stop journey',
      'fr': 'Arrêter le trajet',
    },
    '1qp4w893': {
      'en': 'Start job',
      'fr': 'Commencer l\'intervention',
    },
    'x72no860': {
      'en': 'Mark complete',
      'fr': 'Marquer comme terminée',
    },
    '5hbkcq5o': {
      'en': 'Cancel Job',
      'fr': 'Annuler l\'intervention',
    },
  },
  // serviceRequest_Business
  {
    'tmtt23i5': {
      'en': 'Name',
      'fr': 'Nom et prénom',
    },
    'sxuv8xwc': {
      'en': 'Phone',
      'fr': 'Téléphone',
    },
    'vrx36i4v': {
      'en': 'Email',
      'fr': 'Email',
    },
    'p1utj03q': {
      'en': 'Address',
      'fr': 'Ajoutez une addresse',
    },
    'huum2bzu': {
      'en': 'TextField',
      'fr': 'Code postale',
    },
    'oy3ydmyw': {
      'en': 'TextField',
      'fr': 'Ville',
    },
    'edyhv4zz': {
      'en': 'Problem description',
      'fr': 'Description du problème',
    },
    'ebqub9mi': {
      'en': 'Button',
      'fr': 'Ajoutez une photo',
    },
    'mt1kudsd': {
      'en': 'Create request',
      'fr': 'Créer une demande d\'intervention',
    },
  },
  // payment
  {
    'mb4qhb9c': {
      'en': 'Checkout',
      'fr': 'Paiement',
    },
    'usqy0nfl': {
      'en': 'Fill in the information below to place your order.',
      'fr': 'Remplissez les champs ci-dessous pour passer votre commande.',
    },
    'bupxuuia': {
      'en': 'Price Breakdown',
      'fr': 'Details du prix',
    },
    '5ig4y8xe': {
      'en': 'Base Price',
      'fr': 'Prix ​​hors taxes',
    },
    '8byohl4j': {
      'en': '\$156.00',
      'fr': '€',
    },
    'a13ruzid': {
      'en': 'Taxes',
      'fr': 'TVA',
    },
    'y1eblj8z': {
      'en': '\$24.20',
      'fr': '€',
    },
    'katrvzo0': {
      'en': 'Cleaning Fee',
      'fr': '',
    },
    'k6duusyn': {
      'en': '\$40.00',
      'fr': '',
    },
    'o6sui1p5': {
      'en': 'Total',
      'fr': 'Total',
    },
    'kdnysfaf': {
      'en': '\$230.20',
      'fr': '€',
    },
    't0dqq512': {
      'en': 'Pay w/ Credit Card',
      'fr': 'Payer avec une carte bancaire',
    },
    'ao8wc0u1': {
      'en': 'Or use an option below',
      'fr': 'Ou payer avec l\'une des options suivantes',
    },
    'hkl94dgi': {
      'en': 'Apple Pay',
      'fr': 'Apple pay',
    },
    'wlvfruzu': {
      'en': 'Pay w/Paypal',
      'fr': 'Payer avec Paypal',
    },
  },
  // RefuseJobDialog
  {
    'kja46rh2': {
      'en': 'Are you sure you want to refuse this job?',
      'fr': 'Êtes-vous sûr(e) de vouloir refuser cette intervention ?',
    },
    'weog3k17': {
      'en': 'Refuse',
      'fr': 'Annuler',
    },
    'z42gmc7e': {
      'en': 'Reasons for refusing:',
      'fr': 'Raison(s) du refus:',
    },
    '8hjkz3mp': {
      'en': 'Confirm',
      'fr': 'Confirmer',
    },
  },
  // Miscellaneous
  {
    'rbkh2ugh': {
      'en': 'Select an electrician',
      'fr': '',
    },
    'keivnkb9': {
      'en': 'Search...',
      'fr': '',
    },
    '1bbko10c': {
      'en': 'Option 3',
      'fr': '',
    },
    'iijylz89': {
      'en': '',
      'fr': '',
    },
    'h15n824j': {
      'en': '',
      'fr': '',
    },
    '050iejpn': {
      'en':
          'Nous utilisons votre géolocalisation pour suivre votre trajet et fournir des mises à jour en temps réel à l\'administrateur.',
      'fr': '',
    },
    'maja1m6i': {
      'en': '',
      'fr': '',
    },
    'x3h2nzju': {
      'en': 'SOS Elec souhaite vous envoyer des notifications',
      'fr': '',
    },
    'xbetnexp': {
      'en': '',
      'fr': 'Erreur',
    },
    'vw5wvc1u': {
      'en': '',
      'fr': 'email de réinitialisation du mot de passe envoyé!',
    },
    'bkbrd75p': {
      'en': '',
      'fr': 'email requis',
    },
    '80d06rx1': {
      'en': '',
      'fr': 'Numéro de téléphone obligatoire commençant par +',
    },
    'vutl4yhq': {
      'en': '',
      'fr': 'Les mots de passe ne correspondent pas',
    },
    'nxtj31o3': {
      'en': '',
      'fr': 'Saisissez le code de vérification envoyé par SMS',
    },
    'ft8f2cyr': {
      'en': '',
      'fr': '',
    },
    'zcrp61wh': {
      'en': '',
      'fr':
          'Vous avez été déconnecté. Veuillez vous reconnecter avant de mettre à jour votre adresse e-mail.',
    },
    'j2ckpzhn': {
      'en': '',
      'fr': 'email de confirmation de changement envoyé!',
    },
    '3famx67y': {
      'en': '',
      'fr': 'Adresse e-mail déjà utilisée par un autre compte',
    },
    '2pzf6c5m': {
      'en': '',
      'fr':
          'Les informations d\'identification fournies sont incorrectes, ont expiré  ou sont malformées.',
    },
    '4oo7cjkv': {
      'en': '',
      'fr': '',
    },
    '45mvhjh6': {
      'en': '',
      'fr': 'format de fichier invalide',
    },
    '3vjyqiu8': {
      'en': '',
      'fr': 'téléchargement du fichier...',
    },
    'jkln8urc': {
      'en': '',
      'fr': 'téléchargement réussi!',
    },
    'd0ggbeep': {
      'en': '',
      'fr': 'échec du téléchargement des données',
    },
    'dcvh7oz2': {
      'en': '',
      'fr': '',
    },
    'jlrfpruy': {
      'en': '',
      'fr': 'choisir la source',
    },
    'ojji0uh9': {
      'en': '',
      'fr': 'Gallerie',
    },
    '2ijnm6d9': {
      'en': '',
      'fr': 'Gallerie (Photo)',
    },
    'b4xux2d1': {
      'en': '',
      'fr': 'Gallerie (Video)',
    },
    'kg9tm7lx': {
      'en': '',
      'fr': 'Camera',
    },
    'n63dd9f3': {
      'en': '',
      'fr': '',
    },
    'pmk51st1': {
      'en': '',
      'fr': '',
    },
    '0oee4rd8': {
      'en': '',
      'fr': '',
    },
    'l7gcn6jm': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
