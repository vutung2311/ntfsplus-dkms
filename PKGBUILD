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
            '5f63d04bd17f0f99ef8247a0a0961a96005dfbce81cce9ab29f9a4d76f206c9e'
            '5e211fc3d06b6c28963f07b712795f290128ae981020f84ef03344f647350ad1'
            'c96217944e8957e12e8cfe11ecdbeaf88fa9b32f0d9505155af3a43062171a98'
            '3a9e11588d3350a27ed7166d458aa19ac46fd4b677f818474728859d4c9ca3c9'
            '324d4b31dab4ae81c30444580b45254908ab306cd20d99fc80e5fcd2678581f6'
            'ed58ca3a23cef07343ba40188509b9c2edd28607d57cb9b5ca116130a838bd6d'
            '56efa3e94b9b0756a052a33cb39757d81731ee4395d3f6079a3dfc39b9d13527'
            '0c032fe0842c77abc0b2ff38250f2ae4770c2e72b0fe4c56bc961660a8fb9005'
            'fe5fe5b6903f0a7ad11e7c95efb854783bdd133335616d1243c36aeaa315add1'
            '5cfb540fcb604454d6a5f22f65aac533211bf1a1ba58370802e9dbbf7b645fd8'
            'f8f5bb9b5e4dee9df9b471b2ee4d1589cb00481f05c3a98d2d46ab327a790e92'
            '2af09fa5e4a579ce648e09d275882007c13850358a3b3382f5876e86e150b645'
            '15a2a9ebdf934016c1c72ec747441612e8ea86ce97176c6a560304f30e1485ef'
            'f96f355ba50bd21193debdbb77242a1ce6c433660a9772d993befafae6e82884'
            'fa9a92cfdb8f47c3cc5244131acaa19a0d8ff3ffa21e04fa5a71237817229988'
            '14a3fec37e0f2d63e6b686c8cd4a272f6b67a0b7f10b6a4ab39493666df72e3b'
            'ae8beb5992d8e36221cff21066c2426f93a41ccb62a753fad52bcd7d9507bb70'
            '6896c79e07b486f9051dafa2186c0cf283739496e9c5573c78f5b74c3da1dc71'
            '5746f1c17b7a314359595f72466d03cc8e25241e84738d08ed6b4aaa3f9238d1'
            '43add754658b3f1cb74090a2dc14faa97fa76577c6a04d1456b9f716a20a0828'
            '91abc659762f385e8c1e92a55d8caa1eee8f45639ae80e21ddcd57f7a841d702'
            'c433145674e634a82c34a65e50ad4eade0541417492f3ad4d038146cd53d491c'
            '910e1bb9fc14a4ba6b8758f1ff133d7fba6a333dbe7b9985d7cfd8694492c0cc'
            'a9926e4192dcb6cfc80eae3023715fd3722fa4db4d966454b80798c56573b7fc'
            '0ecc9c2a483f60ac30c4542bfd5647179745fd972a8db46ab389a0abf6f666a4'
            'f3e835c058186304f5278408fb19ae7d377056c486f5eac8af6af19e1ce0f104'
            'b3c7c2538304e7ba2b206c7de174c6f96517c7b037c6bb7767c381d3b068f3fc'
            'c9469e0bc7cd370db3a10298b527f59b693a2441d63dd1d3176968a810dd991c'
            'd708494cadfc769ca5d7cd651d6bad170262803aab2cafe41a5228c042cbfe58'
            '2fe4aa15bdee3e0ebd08e7437dcd9ea267e6459cedfdb16f9b0aeceb28c7d8bf'
            'a5ed692bada562110ac4886d857f5f68d35d7c72fe9e5a8cfb32f6441ea30458'
            'ec0c6495efa57edc7e561431f296e9c85048c6bf520df76ca0c4af18c9786b97'
            'bd8b6e360f466f2acaaea2bfc59ca5741dcd35698d676a22cc2e3fac9a950a6d'
            '80b8cd247851e0e66d1ed1334be9ecdb01e7855b17cbb7da67d4dc2c56d56a35'
            '120ba5c8d52b8d08a3123962e16ff0e0bc2c7449f2c44aa396c8d3eeffaf0dce'
            '3a4b6dadda6a6e80863078a66599e0c73d7b8b01b0f43a6906eb3a1eddbd3cb3'
            'ae83aea04ea7085f586622292e148651ceeefaed800b8201ee04e0b2aa1d81e2'
            '99dce5665cb1f546be012df46e0f0dbc74de8072580b3101d0441ed5ed2a6dcc'
            'd51be5d4675775f4a298882d22d367ce876077d1256fdc72e9452ee664675af1'
            '84bb3475d914daf45c58a34509ce3e8bc5d539051232c1bcbca384ef2cb58f6f'
            '51701cdbbe34b2f8debca747f40fec9b3c9f435305c4dad8b44930e40b6c43d0'
            'efde50dee0b21a3431209588bae389a70b4811c2c0e8ccd4dcb1f5791ef19e92'
            '36a572c77962a2097c31ab965ec06f2f5cea4958e574de48f110d1ca839c091f'
            '7cfe313129cd0b9f5a7b53f626dfaa5b22c7791ec897315cdb4587582333eb76'
            '69fff40b696705b6f48d7a648b4fd9eb3a2f9820c7d63dbfcd38e332d295625a'
            'b7a32bff76818dfd09fa6b492b996082a25e2a4f8351f7cf53e06c4d9c8babab'
            '09fd17abfb901176614f41b1c23ef8132eb087e120885f931670c3c5e9dbcd20'
            '295a96c9bf8bf4917a8adc9b846a0b3986b51f3f6c154fc14ca12277df578744'
            'ff68228a1839f51581bde615f47cd12e268144eb5345b52986ada9f83b34f7e6'
            '7f7f7d4f974fea87759dfd8260086f65da558d3218b804108c4b8db4517cad15'
            '99706e632ecff0036e327b33c6c4a29235712c83960a39e7c4ef3aad4ed99bdb'
            '2e4de2ac978f905492dd505e938b949285251e1ec6dbff9da59002a4d7c86184'
            '09133d20747bcec4bfb8ab9e1861841309b11e11900f36a73bd4d9472d6dc9f3')

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


