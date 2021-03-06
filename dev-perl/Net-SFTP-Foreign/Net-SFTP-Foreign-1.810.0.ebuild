# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DIST_AUTHOR=SALVA
DIST_VERSION=1.81
inherit perl-module

DESCRIPTION="SSH File Transfer Protocol client"

SLOT="0"
KEYWORDS="~amd64 ~hppa ~sparc ~x86"
IUSE="test examples"

PATCHES=(
	# https://rt.cpan.org/Ticket/Display.html?id=112709
	"${FILESDIR}/${DIST_VERSION}-test-server-path.patch"
)
RDEPEND="
	virtual/perl-Scalar-List-Utils
	virtual/perl-Time-HiRes
	virtual/ssh
"
DEPEND="
	virtual/perl-ExtUtils-MakeMaker
	test? (
		virtual/perl-Test-Simple
	)
"

src_install() {
	perl-module_src_install
	if use examples; then
		docompress -x /usr/share/doc/${PF}/examples
		insinto usr/share/doc/${PF}/examples
		doins -r samples/*
	fi
}
