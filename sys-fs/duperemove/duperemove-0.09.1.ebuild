# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils
DESCRIPTION="Btrfs deduplication utility."

HOMEPAGE="https://github.com/markfasheh/duperemove"

SRC_URI="https://github.com/markfasheh/duperemove/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"

SLOT="0"

KEYWORDS="~amd64"

DEPEND="dev-libs/glib:2="

RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
}
