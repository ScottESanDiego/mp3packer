# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs
MY_PV="26cef03"
EGIT_REPO_URI="https://github.com/ScottESanDiego/mp3packer"
EGIT_BRANCH="master"
inherit git-r3

KEYWORDS="~amd64 ~x86"

DESCRIPTION="An MP3 reorganizer"
HOMEPAGE="https://hydrogenaud.io/index.php/topic,32379.575.html"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="
	dev-lang/ocaml[ocamlopt]
	dev-ml/ocaml-make
"
RDEPEND=""

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}"
}

src_install() {
	dobin ${PN}
}
