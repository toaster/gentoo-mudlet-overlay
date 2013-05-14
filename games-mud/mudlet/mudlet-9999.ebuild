# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit games git-2 qt4-r2

DESCRIPTION="Mudlet is a quality MUD client, designed to take mudding to a new level."
HOMEPAGE="http://www.mudlet.org"
SRC_URI=""
EGIT_REPO_URI="git://mudlet.git.sourceforge.net/gitroot/mudlet/mudlet"
EGIT_SOURCEDIR="${S}"

LICENSE=""
SLOT="0"
KEYWORDS="~x86"
IUSE=""

# FIXME missing qt4 dependencies
DEPEND="
	dev-lang/lua
	dev-libs/quazip
	dev-libs/yajl
	dev-libs/zziplib
"
RDEPEND="${DEPEND}
	dev-lua/lrexlib[pcre]
	dev-lua/luazip
"

src_unpack() {
	git-2_src_unpack

	cd "${S}"
	epatch "${FILESDIR}/lua.patch"
}

src_configure() {
    eqmake4 "${S}/src/src.pro"
}
