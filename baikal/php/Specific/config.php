<?php
##############################################################################
# Required configuration
# You *have* to review these settings for Baïkal to run properly
#
function getAdminPasswordHash() {
    return md5('admin:' . $_ENV["BAIKAL_AUTH_REALM"] . ':' . $_ENV["BAIKAL_ADMIN_PASSWORD"]);
}

# Timezone of your users, if unsure, check http://en.wikipedia.org/wiki/List_of_tz_database_time_zones
define("PROJECT_TIMEZONE", $_ENV["PROJECT_TIMEZONE"]);

# CardDAV ON/OFF switch; default TRUE
define("BAIKAL_CARD_ENABLED", filter_var($_ENV["BAIKAL_CARD_ENABLED"], FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE));

# CalDAV ON/OFF switch; default TRUE
define("BAIKAL_CAL_ENABLED", filter_var($_ENV["BAIKAL_CAL_ENABLED"], FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE));

# WebDAV authentication type; default Digest
define("BAIKAL_DAV_AUTH_TYPE", 'Basic');

# Baïkal Web admin password hash; Set via Baïkal Web Admin
define("BAIKAL_ADMIN_PASSWORDHASH", getAdminPasswordHash());
