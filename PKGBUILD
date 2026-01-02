# Maintainer: Tung Vu <vutung2311 at gmail dot com>

_pkgname=ntfsplus
pkgname=$_pkgname-dkms
pkgver=6.18.0
pkgrel=1
pkgdesc='NTFS+ filesystem driver with write support using iomap (DKMS module for kernel 6.18+)'
arch=('x86_64' 'i686')
url='https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git'
license=('GPL2')
depends=('dkms')
provides=('ntfsplus-dkms')
conflicts=('ntfsplus')

source=("dkms.conf.in"
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

sha256sums=('025ff9c679cb23ced8f09a1d7f12402b608950ec4ab863062b9439ba56c23c11'
            '02b237a25d3fc4ab3a27633a1c8ca4d9413bacad8bb722798c2de5336ae4f495'
            '0e9624a424d7d78ff45aa963a15cac5b1f701738832f191c0fbeb8e3f9a2bf4d'
            'e96bfaa29d35c007398c9f60fe9b0faa5ba7276b78e4cb3f38a0b3c32427512a'
            'fec03d652451a300589b5ba8dfeb81c2b9a71dde6d4fb119a59ce0ecb7e67107'
            'adb588d79257c74c7a455e597b832f968f3599ddabce889aa2550f627c4ed3b9'
            '3f9e63668700bcedb423dd9cc36c683713d328b863c9a511b9d6222db350a77e'
            'e0ea8fbe3a6d090897e59369b264d574635e7b3f40a9689327bca338e3facd0c'
            '52b17f78ba4cc9bfd3e7bf04ecd24caaf21927022dc6ecd63079f8bd4d1eec6f'
            '49487b8dac427e46b1b0618c1812c4f5fec7482ab918bb99f5b8e2bb0bc33abf'
            '54bf4af560002044825754540d1bc9df4ad8c327f4954544969765c0fae8aae8'
            '9484fff8df750446441b7604de27e9856c13ce3e95e21ba4f24a22c561b87ee7'
            '048196a7ece08fe1ec4dc772ee7293458f0b246be6ef26cb8ea031124f095610'
            '31a8d66c5653e4a31b05a36888cb96fa572c2762f82bfd31e4d4b9d65b65678b'
            '3b7f0c6b274427336c74e281ff605ab47cf665692898d22ec00224008b7ea884'
            'b2ed676eb945d11ac952d0eaf3e57e1c128a09772cfb0c2da522fd09e88e7e8b'
            'cdaf8577c0c0a244ee90da4d01c3824b6b83fd338305ebf52d31027471a033e3'
            '0c131b4466fa8c9598ce2ee30086633992b915ed98b613b9e8a509a3546e5b74'
            'bd50336d3c02bd92009b836bde493b9f90a739b8e87d2a0282f2459c2abffd16'
            'de2c64a3ef545e95152c23bccfaf2bfb0d39302c8a37c8ce3fb6f43bf3e29275'
            '6e9e509ef9d7d56079a9d2c22dff86ffd4607654f2718e475cdcb5170cbfe20d'
            '225f6a653dd2cad8a5d8b654452f1c059b1e39474a491d94ab6a782cff1b2c6d'
            '91abc659762f385e8c1e92a55d8caa1eee8f45639ae80e21ddcd57f7a841d702'
            'a48f54eae8e1b555c1d3a6506c015da3c1a21135838fcf144e79981abb3d7f17'
            'a79548cf12a19983f788bc9f2d5975ea488376442cfe8f25f07a921fb26e6d43'
            'b6aa2c49b9bb2952917deae8b5978ed950da615bae4b16ffe9576d33e8f5e822'
            'd73ae105130d2f622344e97d7d83c0efa5816b30eee9d39c74c92e15e350e8e2'
            'd75c67e9c1953bdc574d0808e5524bc0c3d5ba7981f0ebffd6346998e0ea123e'
            'ffa9c56a21f8c22b3daefa183db05f5858ad919da125a3d8ef7788fff2bfbf45'
            '84af9f5ba5219579e2132de72102eccd9829372dd4c563700586516ba3478ae2'
            '1f253f90cc33783554f1840b53c57a2049956ab1ca2d3917cd5386c14d58b159'
            '4ddd2f80955c178ef39a5e4ed3258b2cdf54259678eef194d2cf979bd49695dc'
            'bf2fd68d14d1fdd58749d41ebc9387c40d1c6db6a64a5b4b4c946c1c7892fcde'
            '3c78637926780cacca469e6795421d5727ac20b91cc804640dcb455182ca8386'
            '1b89ed72cda37099fb6ff22f9b7f917d8cbad1f52b4ef6b89f189fcee5a3c29e'
            'b47be257e7e8e0dbde847aa42978b22946f198f8dba35023cdc59ceae80a2754'
            '113485e5b8cf7cc0526d025690e9acd75382207acf3e809c3d1ccb4db8ef047d'
            'd1cc7b180ef7790c255a7d363f6a77ef865b2cda4e2b3512de1dfa61ac817a0a'
            '3068d56ff110e5460a5b3da2792a0c61ea81067fb24f02af8cf96529ea38160d'
            'cfaba04c69835e94caa625ba71805eedc672c36af428bc2c650ef374197f31fc'
            '1a1e0b27dc86ffc94d5a5e9e4ab3ea5cc57c55577a7d12fb323ccb1fdcadd5e3'
            '0b87c784edc60f9d74ec7dd61737467bf085aa2e9445616a973b432cd0696f3d'
            'ef79a6aa547456d1453648f136ed34537315f4a9fc1f00d5ab2cc0037a0ad555'
            '24fb9bfb3809a894a1271d3ca0db50412afebac333ca0367290e02cb200172bf'
            '87003425775e53050bf594db27dee97b8f20439a2a3cb95a5b025f19561d47bd'
            '1e3f7c603739d8cb19c764f4e8fcd98cbddf4ad63692548878a9f2cc3a348db4'
            '34f0340c1081c67a0bb7fa11c0a6e7afca7ecb920f41c87f62ff82c38ec72f0c'
            '3f768a5a10995b9ba495b203d895ac8394f6542fa6af61df10c7184cbf477b95'
            'c7cf727deae435f91adb41b272ced6ac6074f4f08202d4657fc7674fc3d40492'
            '5c9dfd67a18bb862da6a0777d1c0f7627c130cba3fc9913f40d8c60eaede71ca'
            '58d06640934996a7f2edcf328a002995bb7fa97572c32b6ce4b2259806fcd41f'
            '7f7f7d4f974fea87759dfd8260086f65da558d3218b804108c4b8db4517cad15'
            '3d2a85a892958c77723b7556e1a9010c301d0bf3f37e68d4f9b7e81647202e1f'
            '5e6733c35504cb7c1a00cc0decc243af8cb91a9f4b47533de51ec6a7e36a89a2'
            '675324d08415aad66361f00e506cecc2c9a4a525136cc0f34ae821024b64801c')

prepare() {
  sed -e "s/@VERSION@/$pkgver/" \
      -i "$srcdir/dkms.conf.in"
}

package() {
  local dest="$pkgdir/usr/src/$_pkgname-$pkgver"
  
  install -Dm644 "$srcdir/dkms.conf.in" "$dest/dkms.conf"
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


