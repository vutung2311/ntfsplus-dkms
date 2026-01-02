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

sha256sums=('166cf7af87d5d0ded0387e1a5e5c145fc4c5ad6df9abc5796074f8617493715f'
            '5883813df96dcbed084fead2ac7ec79af6c4f5bb0d034be26e1b0e059da18da0'
            '396badb51c657562a14c9ee8d443366db88d5e0d978e12ee1f3e7e4f3ebe2f70'
            'e96bfaa29d35c007398c9f60fe9b0faa5ba7276b78e4cb3f38a0b3c32427512a'
            '5412d69c98063bb7e0291bbdfe84f30b1fd18a45f7e7b3d1dfed2ef424cb2eca'
            '0c08c3d7d89bd45de4296f504fd8a94644e3aef780ec0f665186dceaa7378c07'
            '3ef1f57419dcbf3d8bb4ea7a54f345c335c991af577bcf340ec8c91b32f2c366'
            '07fc4cb1597b186460a1e6aa08dde5da9077424fdb7315341b3fc478e502c213'
            '52b17f78ba4cc9bfd3e7bf04ecd24caaf21927022dc6ecd63079f8bd4d1eec6f'
            '49487b8dac427e46b1b0618c1812c4f5fec7482ab918bb99f5b8e2bb0bc33abf'
            '54bf4af560002044825754540d1bc9df4ad8c327f4954544969765c0fae8aae8'
            '378fdef0229ecaea82c8c52088da4a8084de6d1c9d1a7d0673da27971edb4537'
            'f11227f550b25d5d131979582506626c12a5c13b55c91ac6c956b57dd4bc869a'
            '31a8d66c5653e4a31b05a36888cb96fa572c2762f82bfd31e4d4b9d65b65678b'
            '3b7f0c6b274427336c74e281ff605ab47cf665692898d22ec00224008b7ea884'
            '51dfd7a0afee760131fce9eb613edc63a47fd40deef407b1c7daa989e078c825'
            'cdaf8577c0c0a244ee90da4d01c3824b6b83fd338305ebf52d31027471a033e3'
            '0c131b4466fa8c9598ce2ee30086633992b915ed98b613b9e8a509a3546e5b74'
            '9809e3ce76bd5a4f29f37127fbb6d3e183e46e4a47a5f5be8154f05f26a6bee7'
            'de2c64a3ef545e95152c23bccfaf2bfb0d39302c8a37c8ce3fb6f43bf3e29275'
            '4e30da118c22e6fb22544d7c2994ece56c3759157f5d35671e8e313d717771c6'
            '0cc9c350d14cc0e243f153199601d1f5f43114768015bfe4085c29436c1a6c59'
            '91abc659762f385e8c1e92a55d8caa1eee8f45639ae80e21ddcd57f7a841d702'
            '046735a43936d60c5e05681286d9a4e6ecad1afa1d7f9aed8ea0d8de291e4be2'
            'a79548cf12a19983f788bc9f2d5975ea488376442cfe8f25f07a921fb26e6d43'
            'b6aa2c49b9bb2952917deae8b5978ed950da615bae4b16ffe9576d33e8f5e822'
            '657d5a2e91f11154e06246f40ac2469ea502ad4c8466794e13c3313a96865663'
            '2316ab6039b98f89e938ff4c06e9b7ae5bb55c29238156042337145102187a01'
            '25e1951f7ca60c8619216fd90bb2c326e67cc0ef4088944236755d52ffe493e1'
            'a71d5f58c959413e0f2953673ccdb2867727b183e7252130fbbde9cb30c56b88'
            '1f253f90cc33783554f1840b53c57a2049956ab1ca2d3917cd5386c14d58b159'
            '3b3296a5a862bc981ae3e588c684cec61db0da04a620348778992bfab6813e90'
            'bf2fd68d14d1fdd58749d41ebc9387c40d1c6db6a64a5b4b4c946c1c7892fcde'
            '3c78637926780cacca469e6795421d5727ac20b91cc804640dcb455182ca8386'
            '1b89ed72cda37099fb6ff22f9b7f917d8cbad1f52b4ef6b89f189fcee5a3c29e'
            'b47be257e7e8e0dbde847aa42978b22946f198f8dba35023cdc59ceae80a2754'
            '4b4ffd43f9b40a0081433fff0fc8b909150cbfbbb6c2efae6aeea49dbefdfe10'
            'd1cc7b180ef7790c255a7d363f6a77ef865b2cda4e2b3512de1dfa61ac817a0a'
            '3068d56ff110e5460a5b3da2792a0c61ea81067fb24f02af8cf96529ea38160d'
            '47d26633ce68a51afae3dfc9c7033500d588b013b1f40ca254e0ea5161623eb0'
            '2370ca72020641ac4ecaf1c09d55a19f0df426789944eb2fda85dd4adfd63851'
            '0b87c784edc60f9d74ec7dd61737467bf085aa2e9445616a973b432cd0696f3d'
            'ef79a6aa547456d1453648f136ed34537315f4a9fc1f00d5ab2cc0037a0ad555'
            '5dfbe2a42433ee9de8aca32bb709b9af452b8cdd5a4032d4f142a317fb6876de'
            '9029a5263176b5705613fe7c01cf1bf2bc4f3f65ba04f417b9616048e6b664a2'
            '92bdc52122b32d230f06817b8036623ea3c520bdc6d42f2a5f2cd2a7ef4af3fa'
            '34f0340c1081c67a0bb7fa11c0a6e7afca7ecb920f41c87f62ff82c38ec72f0c'
            'a82b8640683ee4d39244eb81509ba10f883dcfd7246a78a44f4473cca8436ccf'
            'c7cf727deae435f91adb41b272ced6ac6074f4f08202d4657fc7674fc3d40492'
            '5c9dfd67a18bb862da6a0777d1c0f7627c130cba3fc9913f40d8c60eaede71ca'
            'b32fc8d06580257d97b164f6b07e38e3549e7777f97c2ac6b6110166418e60b4'
            '7f7f7d4f974fea87759dfd8260086f65da558d3218b804108c4b8db4517cad15'
            '1c93f88f567c9a9228a2d577a2bbba836c3a39781f1b99eee149de7e68866dbd'
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


