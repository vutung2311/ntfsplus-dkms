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
        "quota.c"
        "quota.h"
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
            'ca212cb7552bafd6ef52ff7a821ff38ea62f058540aac432c2eb8a956161d06c'
            'b4c6773a5ffbb57977f97c8642fe14282a5e930b90d1064e96ed43655e3aa31e'
            'e96bfaa29d35c007398c9f60fe9b0faa5ba7276b78e4cb3f38a0b3c32427512a'
            '77d903b565544bc97b554a9d8e76af3af6610453f43ff3fb7c34abdd47ecaf5a'
            '98970fb2eeaf7ad97c9202a615ac3f61b0c4d778f73a104d42a445882da1a55d'
            '3ef1f57419dcbf3d8bb4ea7a54f345c335c991af577bcf340ec8c91b32f2c366'
            'd9816dcbe8d67de9cfb62b0a16fc2f53f1a1bb244acc057a76e35a8191404048'
            '0d6d5a2a234a797195c31c100ab4bc6189497a7cee50b6d381e26aca1d0978d5'
            'b72652f651f30dc3acb8304cd55aed2863dc3ab4b1403dd00a7ec712760d52d4'
            '0c032fe0842c77abc0b2ff38250f2ae4770c2e72b0fe4c56bc961660a8fb9005'
            '9bdf3063e097d0b06b468060cd3f1d8c7cabeab9cbb14039acd968aeb1747cbe'
            'c549e1e1f4d6508f6df3b9af2a8274b68a9b750fcb3f2c09b289058c4eca194b'
            'f8f5bb9b5e4dee9df9b471b2ee4d1589cb00481f05c3a98d2d46ab327a790e92'
            '2f944ce52d04526a7c2f1050da907948b6721c555173722778a6ad89c4f3956c'
            '15a2a9ebdf934016c1c72ec747441612e8ea86ce97176c6a560304f30e1485ef'
            'f4bee58e2f682655292be361e39acc0ce33ab8b20961c516a88cb1f01eb81bda'
            'fa9a92cfdb8f47c3cc5244131acaa19a0d8ff3ffa21e04fa5a71237817229988'
            '14a3fec37e0f2d63e6b686c8cd4a272f6b67a0b7f10b6a4ab39493666df72e3b'
            '962614367d1993643e426659e2e1e99a8dad404f8decf9e41faec31b7d7a1e92'
            '6896c79e07b486f9051dafa2186c0cf283739496e9c5573c78f5b74c3da1dc71'
            '9fd6b059163ca3f456140d8b574b4ba9fc9bbd35bb27b7daf7f20763df1fd293'
            '9db215a27ce2ea9ee582fae9b0fb058e1c8574f859d7d410e916a7d994a50f14'
            '91abc659762f385e8c1e92a55d8caa1eee8f45639ae80e21ddcd57f7a841d702'
            'bcd2ccb176049bbba2fd97c829fe2788e7dcfaf97c23465cc4febb39c79f7175'
            '04c5e07e5c0e28fd86da5422a3ff1adc48247db76373f9ba9db204ced6329616'
            '51b558913994d53651b871ddfa9edf50de50aa7cac84c842859b8ad1dcb45266'
            '9c2689e691f48365397e5c3aec0803b0c28df402d909e2d7afb15ff7bbd8e34c'
            '0ca5f5ae8a19b7f9dbcaa98299f5a0319141a4e96d8e4e2233b1dda203cbaaab'
            '043f0195048368f54440282cb56394f27e17f8ed9ed56796c9469810b0f78d84'
            '8f42ef1948fcbda734d6766fdd17b64143a123111fadec8e6e1632ff4a99ce3a'
            '474dbef47760a0f03446813465c551414df1a9457fb3342d8c3e4ed06a09daf3'
            '56857372b835ddbe3e07b69fc4d009a98f4d95b54e695056930cabb55330a665'
            'a5ed692bada562110ac4886d857f5f68d35d7c72fe9e5a8cfb32f6441ea30458'
            'd5c1275b8499925656b73bf38b5b172ee5f25b30231d52f426e35ce150f07cf2'
            'bd8b6e360f466f2acaaea2bfc59ca5741dcd35698d676a22cc2e3fac9a950a6d'
            '80b8cd247851e0e66d1ed1334be9ecdb01e7855b17cbb7da67d4dc2c56d56a35'
            'dc2b6d6432f3e0c2e4012e437c1894f398a4f8ba193f62767075afd50ad2325f'
            '1d6daf37ed338279d99da3aa34a1951a7f41bd95fe78715490a39aec3710ff76'
            'ae83aea04ea7085f586622292e148651ceeefaed800b8201ee04e0b2aa1d81e2'
            '5b3037e1813eb0729131b2ec28850dc377832d6447b128bd99f599c88804ee2a'
            '24b6aee28a91ad3fc4e8da7f0f398ce47e142eb3a8566cefa0928ad8c307113b'
            '84bb3475d914daf45c58a34509ce3e8bc5d539051232c1bcbca384ef2cb58f6f'
            '51701cdbbe34b2f8debca747f40fec9b3c9f435305c4dad8b44930e40b6c43d0'
            '2f0baa8449468749aea2fc38e0a0d938d6884c7024996ea9f1261e2fcde96218'
            'b7b15e2b6deef71809bc7651cd3bbf6b40aa0c326e06a5613ef8b20d9ffbe3a6'
            '30182014d1b4c3c40999ec61984d623f6718e575d5d24c9181d9678a84c793af'
            '5788d121279a76a5eb89b95e7b3065215b153339e6a8cbeb816138a9f92baf60'
            'b249e4eef87607ab120c0944f670160194e522557dfadf2737506eca6b707780'
            '69fff40b696705b6f48d7a648b4fd9eb3a2f9820c7d63dbfcd38e332d295625a'
            '21419f8ffeea10bff43e05acd68fc9f12feb34b21fea8ae4e6ca5d5085004b7b'
            '3ab83c7261e8ee91c251997bffe90eef4b4395f1f555d96a299856babd42b5e0'
            '295a96c9bf8bf4917a8adc9b846a0b3986b51f3f6c154fc14ca12277df578744'
            'ff68228a1839f51581bde615f47cd12e268144eb5345b52986ada9f83b34f7e6'
            '7f7f7d4f974fea87759dfd8260086f65da558d3218b804108c4b8db4517cad15'
            '99706e632ecff0036e327b33c6c4a29235712c83960a39e7c4ef3aad4ed99bdb'
            '2e4de2ac978f905492dd505e938b949285251e1ec6dbff9da59002a4d7c86184'
            'b7a7d532cc9be921e10291fb221e1095fb2df9b49a20edd591306f5e809bb164')

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
  install -Dm644 "$srcdir/quota.c" "$dest/quota.c"
  install -Dm644 "$srcdir/quota.h" "$dest/quota.h"
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


