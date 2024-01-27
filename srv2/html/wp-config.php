<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress_db' );

/** Database username */
define( 'DB_USER', 'wordpress' );

/** Database password */
define( 'DB_PASSWORD', '2Z%Zv3W93%' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'OR&coTF=lP@*1`A.X.xXa$]ckh_R:t7-.RJV$Rk3=6,wJc`4,-1V#YKyO0|=3C!%' );
define( 'SECURE_AUTH_KEY',  'aUNM(Qm$<[>GX~8Z_sNIOC=pJulnOD^1@ bb*7}2Zde0lMGB%DIC0S/R[|_;Z2u,' );
define( 'LOGGED_IN_KEY',    'y[[2uo%`f4CGx~+}l</xFPBz{88J{fU7JHU-9-#R=<Uaun,u{H)c(M,} 1eG5kxm' );
define( 'NONCE_KEY',        '14pl[Rj^W=nHsRE[kE`9SL8iS,j2T?rOB_.T0Y)<X<i(Q.{/VjC?gRVM_bXQ1Sa=' );
define( 'AUTH_SALT',        'N9_I_sO+FSKDf|~Ct!`4obT!}b?)fPS3Q,~W%:`$$UvhhA(qSVRV8N]C}!EE.Hec' );
define( 'SECURE_AUTH_SALT', '0ksD!>3prlyaebX`Pn~]x-)sp!!cKbt4jWs`-zc9+GyN?nK-L9jJ]*j$7CCd+^(U' );
define( 'LOGGED_IN_SALT',   'gJ0xhPKl)19Fng9,Xk@,3Qw+=$1m))D-(/ h$L[uiNJbHg}Y?@=ZV?[5@{jrOYpx' );
define( 'NONCE_SALT',       'xJ[,}nN+XXz{Ty-EGHpCe?r;F-%zs+v.fJn.A;RQr^(H^+>9/h{&DQM2x. z%#=K' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
