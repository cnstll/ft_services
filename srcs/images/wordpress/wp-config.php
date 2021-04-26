<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en « wp-config.php » et remplir les
 * valeurs.
 *
 * Ce fichier contient les réglages de configuration suivants :
 *
 * Réglages MySQL
 * Préfixe de table
 * Clés secrètes
 * Langue utilisée
 * ABSPATH
 *
 * @link https://fr.wordpress.org/support/article/editing-wp-config-php/.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', 'wordpress' );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'wordpress' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', 'password' );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', 'localhost' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8' );

/**
 * Type de collation de la base de données.
 * N’y touchez que si vous savez ce que vous faites.
 */
define( 'DB_COLLATE', '' );

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clés secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '-#@9QOQq|%6-3|sumSX+@/](2n0[f{mHzAbBhB1$iqZGn7hiN|`Un+m_OW&+bl-t');
define('SECURE_AUTH_KEY',  'z}g5=eSF34tDp>6dCYU,LWDkwkU )ax,vJ`U?[,A6/GyAcVQe$M+TqCShRt;^ka;');
define('LOGGED_IN_KEY',    '#RTz~)lBzM< !/NQ;#0So5-}QxEU5H&Fv~bt^9W4we$uU;_0>|y+rXv!VP53[1>@');
define('NONCE_KEY',        'vr%G+.iUxhrd1)<zgQXACp6J52W$VT!-BFtr6TLI6ja,R|kJV%DHiob{yKNEToRt');
define('AUTH_SALT',        '4dyAP|Mpf{VO*#/yH1D2f~Q#:YekNol80EP,z6csD<,.+<M7M+~cG`p`8##?.e+B');
define('SECURE_AUTH_SALT', ')f=-Hfl6JkHISmX/m=*9>04rJi/QImx.s D3xb8]N+`eUq+x^|c$VHT&jZPJh22O');
define('LOGGED_IN_SALT',   'v<I6LmgEE)+mC)@Vp<i/J5acDF_Bc((!Bp5K[*&<iv/yZI/qH_7<64Z_Om%3=e^>');
define('NONCE_SALT',       'vPGf)^28q=u)r@`U&*;+] ]-4|P-8(<h<Dg-V$RU)MNvh{MC&l3?|VVkqU4Sb7Vt');

/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortement recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://fr.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( ! defined( 'ABSPATH' ) )
  define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once( ABSPATH . 'wp-settings.php' );

