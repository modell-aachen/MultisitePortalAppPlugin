# See bottom of file for default license and copyright information
package Foswiki::Plugins::MultisitePortalAppPlugin;
use strict;
use warnings;

our $VERSION = '1';
our $RELEASE = "1";

our $SHORTDESCRIPTION = 'Modell Aachen Portal WikiApp Plugin';

sub initPlugin {
    Foswiki::Func::registerTagHandler(
        'PORTALTOKEN', \&_tagPortalToken );
    return 1;
}

sub _tagPortalToken {
    my ( $session, $attributes, $topic, $web, $meta ) = @_;

    my $clientToken = Foswiki::Plugins::VueJSPlugin::getClientToken();
    Foswiki::Func::addToZone( 'script', 'MULTISITEPORTALAPPPLUGIN::SCRIPTS',
        "<script type='text/javascript' src='%PUBURLPATH%/System/MultisitePortalAppPlugin/portal.js?v=$RELEASE'></script>","VUEJSPLUGIN,JQUERYPLUGIN"
    );
    # Specialcase for multisitePortalApp: only generate a required token
    return "data-vue-client-token='$clientToken'"
}

1;

__END__
Foswiki - The Free and Open Source Wiki, http://foswiki.org/

Author: Marco Moscher <moscher@modell-aachen.de>

Copyright (C) 2008-2011 Foswiki Contributors. Foswiki Contributors
are listed in the AUTHORS file in the root of this distribution.
NOTE: Please extend that file, not this notice.

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version. For
more details read LICENSE in the root of this distribution.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

As per the GPL, removal of this notice is prohibited.
