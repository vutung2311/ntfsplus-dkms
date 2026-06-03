# Maintainer: Tung Vu <vutung2311 at gmail dot com>

_pkgname=ntfsplus
pkgname=$_pkgname-dkms
pkgver=1.0
pkgrel=1
pkgdesc='NTFS+ filesystem driver with write support using iomap (DKMS module for kernel 6.18+)'
arch=('x86_64' 'i686')
url='https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git'
license=('GPL2')
depends=('dkms')
provides=('ntfsplus-dkms')
conflicts=('ntfsplus')

source=("dkms.conf.in"
        "pre-build.sh"
        "post-build.sh"
        "Makefile"
        "Kconfig"
        "uapi_ntfs.h"
        "compat.h"
        "aops.c"
        "aops.h"
        "attrib.c"
        "attrib.h"
        "attrlist.c"
        "attrlist.h"
        "bitmap.c"
        "bdev-io.c"
        "bitmap.h"
        "collate.c"
        "collate.h"
        "compress.c"
        "debug.c"
        "debug.h"
        "dir.c"
        "dir.h"
        "ea.c"
        "ea.h"
        "endian.h"
        "file.c"
        "index.c"
        "index.h"
        "inode.c"
        "inode.h"
        "iomap.c"
        "iomap.h"
        "layout.h"
        "lcnalloc.c"
        "lcnalloc.h"
        "logfile.c"
        "logfile.h"
        "malloc.h"
        "mft.c"
        "mft.h"
        "mst.c"
        "namei.c"
        "ntfs.h"
        "object_id.c"
        "object_id.h"
        "reparse.c"
        "reparse.h"
        "runlist.c"
        "runlist.h"
        "super.c"
        "sysctl.c"
        "sysctl.h"
        "time.h"
        "types.h"
        "unistr.c"
        "upcase.c"
        "volume.h")

sha256sums=('8cd1ac9cbc794a7733d2c59835127b89ac2a1bd660d17d21474507500f734815'
            '7c960030abd962f6beff9325dab1305abd1ef75c10da1ca80364879e445a993f'
            '65f6d5f8c9b66ccdf4e37eefdfcf9cc07ed88f8238c2e2d469a0d1484aaa0a45'
            '0ef763ab4ec3673011713a6984e02e0471f9777af19b83448e3a3db953277296'
            '8b1eca9c7084181c39928926aa6c7fe1a87cbe82c9b44b17465079c7fb0f29be'
            'e96bfaa29d35c007398c9f60fe9b0faa5ba7276b78e4cb3f38a0b3c32427512a'
            '5e211fc3d06b6c28963f07b712795f290128ae981020f84ef03344f647350ad1'
            'a64d2aa9fd5cefccd286f3141a37fa08075efda8831c8a820bb34de841adc3e8'
            '3ef1f57419dcbf3d8bb4ea7a54f345c335c991af577bcf340ec8c91b32f2c366'
            '2e7776127930f4f0f91afd7d7c7ec96417eb9eb7210c664ce4e99034b97be7ce'
            '0d6d5a2a234a797195c31c100ab4bc6189497a7cee50b6d381e26aca1d0978d5'
            '416b21932b92bf796423dbfac7950b9df5ffbe43c566fdcf594099d591bfa7c0'
            '0c032fe0842c77abc0b2ff38250f2ae4770c2e72b0fe4c56bc961660a8fb9005'
            'd1ad38df42107596ded9500239fc01f1f907db5a65976e4e669951d5c5e8e7ea'
            '736f4e0c6299a03f0d3399aeeb61f2d869de7c37cb2ee4d8bdbd2bb513caa8c0'
            'f8f5bb9b5e4dee9df9b471b2ee4d1589cb00481f05c3a98d2d46ab327a790e92'
            '2f944ce52d04526a7c2f1050da907948b6721c555173722778a6ad89c4f3956c'
            '15a2a9ebdf934016c1c72ec747441612e8ea86ce97176c6a560304f30e1485ef'
            'e3ed192ad94f75812dc6243eca2eb9376b8b6e224a81e0c60d75b0470098c347'
            'fa9a92cfdb8f47c3cc5244131acaa19a0d8ff3ffa21e04fa5a71237817229988'
            '14a3fec37e0f2d63e6b686c8cd4a272f6b67a0b7f10b6a4ab39493666df72e3b'
            '5756f1649b2c35491de76148b1cd38c60503b534135fcc46fb77b98002599ac7'
            '6896c79e07b486f9051dafa2186c0cf283739496e9c5573c78f5b74c3da1dc71'
            'd38bcb6668f18b0da6a20a96f0220b2fafd439f3e20434e1e6956433d35ac400'
            '9db215a27ce2ea9ee582fae9b0fb058e1c8574f859d7d410e916a7d994a50f14'
            '91abc659762f385e8c1e92a55d8caa1eee8f45639ae80e21ddcd57f7a841d702'
            'a7dcb56b46928f215ebb01b7313333d5aad13842fd594268ff9c52a23cb2f2c1'
            'ec9a8371fd9e5675ea81c04aae075f2cfcdb2a857b70dc0eb7b6fcb117c19490'
            'a9926e4192dcb6cfc80eae3023715fd3722fa4db4d966454b80798c56573b7fc'
            '2cb5c961fa2ff3d5db5c92a4f8be6eec3318c9d2406fe550a5fab0a410c28c39'
            '46863440a2ea0095eab01eea2c10657c05f32a168e42d79ea4a4cde1f5b57894'
            'e07ef8180a60a286bddc66e4b646c2b31a1bf712fc54c8003df420fe56006ba9'
            '8f42ef1948fcbda734d6766fdd17b64143a123111fadec8e6e1632ff4a99ce3a'
            '474dbef47760a0f03446813465c551414df1a9457fb3342d8c3e4ed06a09daf3'
            '5b546be6ea1bea113fa00718c0ad94ec984f7ab354d3e9ddd3e49475ad4ec2b9'
            'a5ed692bada562110ac4886d857f5f68d35d7c72fe9e5a8cfb32f6441ea30458'
            '5cd297f35f6a070dd44602e97a729b0860504544df85ea9f87b0e24e46b75855'
            'bd8b6e360f466f2acaaea2bfc59ca5741dcd35698d676a22cc2e3fac9a950a6d'
            '80b8cd247851e0e66d1ed1334be9ecdb01e7855b17cbb7da67d4dc2c56d56a35'
            '490f55245d7a30cb0b29f312a8a8fbb5b212595c767b4f55467a339c5ab903d2'
            'e882fdd425911668c8775b40023791b714bd3b46a1694d710acb1fd7b53f0027'
            'ae83aea04ea7085f586622292e148651ceeefaed800b8201ee04e0b2aa1d81e2'
            '371e9f06c318241cea313b55a143b642d1104e236f61115e33195b00d408a1a1'
            '24b6aee28a91ad3fc4e8da7f0f398ce47e142eb3a8566cefa0928ad8c307113b'
            '84bb3475d914daf45c58a34509ce3e8bc5d539051232c1bcbca384ef2cb58f6f'
            '51701cdbbe34b2f8debca747f40fec9b3c9f435305c4dad8b44930e40b6c43d0'
            '9b9ed094a5ef604492ff914ef2e3fa0206b74adef96390f8680c2f53ff12c848'
            '5788d121279a76a5eb89b95e7b3065215b153339e6a8cbeb816138a9f92baf60'
            '1df9f1cf835c49c27b777e0529a161cb099e54f84044b90dda2cb5c7875ae665'
            '69fff40b696705b6f48d7a648b4fd9eb3a2f9820c7d63dbfcd38e332d295625a'
            '8c932f7e71e69879519e7594bf096d0deb638714b55500b098f2b5eb32a1721f'
            'e7fe4da3ee1c7e068c300c65f6a32ce9526f885dbca843644db693b0dee362a6'
            '295a96c9bf8bf4917a8adc9b846a0b3986b51f3f6c154fc14ca12277df578744'
            'ff68228a1839f51581bde615f47cd12e268144eb5345b52986ada9f83b34f7e6'
            '7f7f7d4f974fea87759dfd8260086f65da558d3218b804108c4b8db4517cad15'
            '99706e632ecff0036e327b33c6c4a29235712c83960a39e7c4ef3aad4ed99bdb'
            '2e4de2ac978f905492dd505e938b949285251e1ec6dbff9da59002a4d7c86184'
            '71687317c6393e847906d918cd01531f873dcab8014bdc99dddbec3f80e87a90')

prepare() {
  sed -e "s/@VERSION@/$pkgver/" \
      -i "$srcdir/dkms.conf.in"
}

package() {
  local dest="$pkgdir/usr/src/$_pkgname-$pkgver"
  
  install -Dm644 "$srcdir/dkms.conf.in" "$dest/dkms.conf"
  install -Dm755 "$srcdir/pre-build.sh" "$dest/pre-build.sh"
  install -Dm755 "$srcdir/post-build.sh" "$dest/post-build.sh"
  install -Dm644 "$srcdir/Makefile" "$dest/Makefile"
  install -Dm644 "$srcdir/Kconfig" "$dest/Kconfig"
  install -Dm644 "$srcdir/uapi_ntfs.h" "$dest/uapi_ntfs.h"
  install -Dm644 "$srcdir/compat.h" "$dest/compat.h"
  
  install -Dm644 "$srcdir/aops.c" "$dest/aops.c"
  install -Dm644 "$srcdir/aops.h" "$dest/aops.h"
  install -Dm644 "$srcdir/attrib.c" "$dest/attrib.c"
  install -Dm644 "$srcdir/attrib.h" "$dest/attrib.h"
  install -Dm644 "$srcdir/attrlist.c" "$dest/attrlist.c"
  install -Dm644 "$srcdir/attrlist.h" "$dest/attrlist.h"
  install -Dm644 "$srcdir/bitmap.c" "$dest/bitmap.c"
  install -Dm644 "$srcdir/bdev-io.c" "$dest/bdev-io.c"
  install -Dm644 "$srcdir/bitmap.h" "$dest/bitmap.h"
  install -Dm644 "$srcdir/collate.c" "$dest/collate.c"
  install -Dm644 "$srcdir/collate.h" "$dest/collate.h"
  install -Dm644 "$srcdir/compress.c" "$dest/compress.c"
  install -Dm644 "$srcdir/debug.c" "$dest/debug.c"
  install -Dm644 "$srcdir/debug.h" "$dest/debug.h"
  install -Dm644 "$srcdir/dir.c" "$dest/dir.c"
  install -Dm644 "$srcdir/dir.h" "$dest/dir.h"
  install -Dm644 "$srcdir/ea.c" "$dest/ea.c"
  install -Dm644 "$srcdir/ea.h" "$dest/ea.h"
  install -Dm644 "$srcdir/endian.h" "$dest/endian.h"
  install -Dm644 "$srcdir/file.c" "$dest/file.c"
  install -Dm644 "$srcdir/index.c" "$dest/index.c"
  install -Dm644 "$srcdir/index.h" "$dest/index.h"
  install -Dm644 "$srcdir/inode.c" "$dest/inode.c"
  install -Dm644 "$srcdir/inode.h" "$dest/inode.h"
  install -Dm644 "$srcdir/iomap.c" "$dest/iomap.c"
  install -Dm644 "$srcdir/iomap.h" "$dest/iomap.h"
  install -Dm644 "$srcdir/layout.h" "$dest/layout.h"
  install -Dm644 "$srcdir/lcnalloc.c" "$dest/lcnalloc.c"
  install -Dm644 "$srcdir/lcnalloc.h" "$dest/lcnalloc.h"
  install -Dm644 "$srcdir/logfile.c" "$dest/logfile.c"
  install -Dm644 "$srcdir/logfile.h" "$dest/logfile.h"
  install -Dm644 "$srcdir/malloc.h" "$dest/malloc.h"
  install -Dm644 "$srcdir/mft.c" "$dest/mft.c"
  install -Dm644 "$srcdir/mft.h" "$dest/mft.h"
  install -Dm644 "$srcdir/mst.c" "$dest/mst.c"
  install -Dm644 "$srcdir/namei.c" "$dest/namei.c"
  install -Dm644 "$srcdir/ntfs.h" "$dest/ntfs.h"
  install -Dm644 "$srcdir/object_id.c" "$dest/object_id.c"
  install -Dm644 "$srcdir/object_id.h" "$dest/object_id.h"
  install -Dm644 "$srcdir/reparse.c" "$dest/reparse.c"
  install -Dm644 "$srcdir/reparse.h" "$dest/reparse.h"
  install -Dm644 "$srcdir/runlist.c" "$dest/runlist.c"
  install -Dm644 "$srcdir/runlist.h" "$dest/runlist.h"
  install -Dm644 "$srcdir/super.c" "$dest/super.c"
  install -Dm644 "$srcdir/sysctl.c" "$dest/sysctl.c"
  install -Dm644 "$srcdir/sysctl.h" "$dest/sysctl.h"
  install -Dm644 "$srcdir/time.h" "$dest/time.h"
  install -Dm644 "$srcdir/types.h" "$dest/types.h"
  install -Dm644 "$srcdir/unistr.c" "$dest/unistr.c"
  install -Dm644 "$srcdir/upcase.c" "$dest/upcase.c"
  install -Dm644 "$srcdir/volume.h" "$dest/volume.h"
}


