name="libcutefish-git"
gives="libcutefish"
version="0.2-1"
url="https://github.com/cutefishos/libcutefish.git"
license="GPL-3.0"
build_depends="extra-cmake-modules ninja-build qttools5-dev-tools qtbase5-dev qtdeclarative5-dev qtquickcontrols2-5-dev qttools5-dev"
depends="kscreen modemmanager-qt-dev libkf5networkmanagerqt-dev libqt5quickcontrols2-5 libkf5screen-dev libkf5kio-dev libqt5sensors5-dev accountsservice bluez"
description="Cutefish System Library."

pkgver() {
    git ls-remote "${url}" main | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
    mkdir build
    cd build
}

build() {
    cmake ..
    make -j$(nproc)
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/libcutefish-git
}
