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
        "volume.h"
        "ntfs_codec.h"
        "wof.c"
        "decompress_common.c"
        "decompress_common.h"
        "lib.h"
        "lzx_decompress.c"
        "xpress_decompress.c")

sha256sums=('8cd1ac9cbc794a7733d2c59835127b89ac2a1bd660d17d21474507500f734815'
            '7c960030abd962f6beff9325dab1305abd1ef75c10da1ca80364879e445a993f'
            '65f6d5f8c9b66ccdf4e37eefdfcf9cc07ed88f8238c2e2d469a0d1484aaa0a45'
            '7a0608c4be196e166866b3af7a0c881902b46d9031335813dc729331dce536c2'
            'd69a856af3ee070c67931349f68592f8313647470ee2495332bf02a508caddd1'
            '5f63d04bd17f0f99ef8247a0a0961a96005dfbce81cce9ab29f9a4d76f206c9e'
            '5e211fc3d06b6c28963f07b712795f290128ae981020f84ef03344f647350ad1'
            'e95136824a40d2c1a8f8c1e7409d28b917aef1b8849a959549af4d34d4adf19d'
            '3a9e11588d3350a27ed7166d458aa19ac46fd4b677f818474728859d4c9ca3c9'
            'ce4ba7a163456bb2b59d8af3d1d9c6062e5a08482e6560a76492e1c3b7ab5de3'
            '805ceaab6dc82136c176caf66ae85c84711c55bb7c7e51025e118558f174aa70'
            '49856afb90ff1c77b8d50ffa6fbb203caf040b6608cb6ac6f3d44db85bbb8997'
            '0473b67f29374b811d98c8a5cdc761e761e591f56ae3f75c30c3ae0bfaaa619f'
            '64249bee6491fa18216dc81d435b75e9a66affc51cc1474480e18b375ecb8919'
            'ada88c7f82c491b3a20cb0dfd1ccdad8d6b6136bb33f9da6ff0d5050093b38e0'
            'f8f5bb9b5e4dee9df9b471b2ee4d1589cb00481f05c3a98d2d46ab327a790e92'
            '2af09fa5e4a579ce648e09d275882007c13850358a3b3382f5876e86e150b645'
            '15a2a9ebdf934016c1c72ec747441612e8ea86ce97176c6a560304f30e1485ef'
            '3bb716724dac87b9302bcb6cc9d8937e18bc488d5bfaa634fe5f4f6111f54028'
            'fa9a92cfdb8f47c3cc5244131acaa19a0d8ff3ffa21e04fa5a71237817229988'
            '14a3fec37e0f2d63e6b686c8cd4a272f6b67a0b7f10b6a4ab39493666df72e3b'
            'addb2f28f1c9899a9d1786a54eb96ad0b262ffc35c6c0c58595e22a55ee5003c'
            '6896c79e07b486f9051dafa2186c0cf283739496e9c5573c78f5b74c3da1dc71'
            'b876edf6b5779d1074586e2df6a658038456f30a74ad93da8bf4a332d335d1e9'
            '0f75cb7ebff35a747f62d0cd9592af6de041f01c39434beac81dce4c05f7222f'
            '91abc659762f385e8c1e92a55d8caa1eee8f45639ae80e21ddcd57f7a841d702'
            '41353324798a63ff876447a670297e107af460fdbf1385ce71eb7fedb45fdd0a'
            '24b561b2ff31c76965408c2f9ea76a08f70e38b8302abec02303e8ee794e4e1f'
            'a9926e4192dcb6cfc80eae3023715fd3722fa4db4d966454b80798c56573b7fc'
            '6bf56bba9dde681e3065166ee878c7b205865eb45b2c7c7b8712427b37400201'
            'a305a694d200063081e1e5c927fa63e48f5a3c981a97ebadca7f4ebd5c4cf34a'
            '8edd2b3e150f0dfcad5ccc8d32e0ae991f7ad3d4464134fe66c4e27e48d560ea'
            'c9469e0bc7cd370db3a10298b527f59b693a2441d63dd1d3176968a810dd991c'
            'd708494cadfc769ca5d7cd651d6bad170262803aab2cafe41a5228c042cbfe58'
            '01f1a3baf27ba67be3b7f7bfd364afe156147ed3fe11acbbcfd3e9a7b446f720'
            'a5ed692bada562110ac4886d857f5f68d35d7c72fe9e5a8cfb32f6441ea30458'
            'ec0c6495efa57edc7e561431f296e9c85048c6bf520df76ca0c4af18c9786b97'
            'bd8b6e360f466f2acaaea2bfc59ca5741dcd35698d676a22cc2e3fac9a950a6d'
            '80b8cd247851e0e66d1ed1334be9ecdb01e7855b17cbb7da67d4dc2c56d56a35'
            'b5dbe18b062d761f7d7e96aeb8a681b5b38ce6025ae3202c8205c90c947291a4'
            '88c474bba619a16bca0f163a0cdbdd0ff2f8432cb93eb6b8bedf7e396d634743'
            'ae83aea04ea7085f586622292e148651ceeefaed800b8201ee04e0b2aa1d81e2'
            '81bc49583d36206f17f53f7e3c997f211b9f5dabe7f38528eab5c3f6fb610ea2'
            '5be22a305ddf2e38d2bdffc7c64688ea0943a6c6a5bb75fdb0f5d6a3f4923a3f'
            '84bb3475d914daf45c58a34509ce3e8bc5d539051232c1bcbca384ef2cb58f6f'
            '51701cdbbe34b2f8debca747f40fec9b3c9f435305c4dad8b44930e40b6c43d0'
            'b980263014fc6791e2a8d0fdd6fb814ffc6083cb23391d532182b31b95a1d8e6'
            '9527ef9ac5d4d60f94a42d6db21b60a605f968a75023093df6e75ce78ccf7f64'
            '8fab54ec273fb5482eda362a0c9605a6da6a2e252c3ca8f60864d950377a268f'
            '69fff40b696705b6f48d7a648b4fd9eb3a2f9820c7d63dbfcd38e332d295625a'
            '8b125a3db2a7b09bde695d659428b55656fef95cf1de1f0e0c40b0cce895053a'
            '09fd17abfb901176614f41b1c23ef8132eb087e120885f931670c3c5e9dbcd20'
            '295a96c9bf8bf4917a8adc9b846a0b3986b51f3f6c154fc14ca12277df578744'
            'ff68228a1839f51581bde615f47cd12e268144eb5345b52986ada9f83b34f7e6'
            '7f7f7d4f974fea87759dfd8260086f65da558d3218b804108c4b8db4517cad15'
            '99706e632ecff0036e327b33c6c4a29235712c83960a39e7c4ef3aad4ed99bdb'
            '2e4de2ac978f905492dd505e938b949285251e1ec6dbff9da59002a4d7c86184'
            '44123757f5040eff9bc86b46c31b6b93962e4e64179bbce26fd7a5bff00779c9'
            '52b69e6676a12394583bd7e1079c73a0ac2f4e55040e4c3ccdc428024b80cfa9'
            'faa579bfe66744821216025a12de4b5332ea6bd314e199459ca2ef690b88ca6c'
            '01f6b2f3b20c69fea541fe1e4798ee8ea17d02d63e8bac0c10adf5434977446d'
            'c1d3f3adae3e03274111ad2b3302fa25e083d0314cbeda8b60b2d66cae93833b'
            '83acad9ce4759fd545398c74471011dab34a4c9d9f0c90db8b460024fde03d5c'
            'e31167624a50d7094365f32a27f2edce22ccecf861fd0e17861ac4676322be30'
            '32d95549d820f9b5020850803eff19cc26801497912d8c38a33ede5b33d18ab7')

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
  install -Dm644 "$srcdir/ntfs_codec.h" "$dest/ntfs_codec.h"
  install -Dm644 "$srcdir/wof.c" "$dest/wof.c"
  install -Dm644 "$srcdir/decompress_common.c" "$dest/decompress_common.c"
  install -Dm644 "$srcdir/decompress_common.h" "$dest/decompress_common.h"
  install -Dm644 "$srcdir/lib.h" "$dest/lib.h"
  install -Dm644 "$srcdir/lzx_decompress.c" "$dest/lzx_decompress.c"
  install -Dm644 "$srcdir/xpress_decompress.c" "$dest/xpress_decompress.c"
}


