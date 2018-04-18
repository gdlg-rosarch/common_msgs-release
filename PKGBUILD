# Script generated with Bloom
pkgdesc="ROS - common_msgs contains messages that are widely used by other ROS packages. These includes messages for actions (<a href="http://wiki.ros.org/actionlib_msgs">actionlib_msgs</a>), diagnostics (<a href="http://wiki.ros.org/diagnostic_msgs">diagnostic_msgs</a>), geometric primitives (<a href="http://wiki.ros.org/geometry_msgs">geometry_msgs</a>), robot navigation (<a href="http://wiki.ros.org/nav_msgs">nav_msgs</a>), and common sensors (<a href="http://wiki.ros.org/sensor_msgs">sensor_msgs</a>), such as laser range finders, cameras, point clouds."
url='http://wiki.ros.org/common_msgs'

pkgname='ros-kinetic-common-msgs'
pkgver='1.12.5_1'
pkgrel=1
arch=('any')
license=('BSD'
)

makedepends=('ros-kinetic-catkin'
)

depends=('ros-kinetic-actionlib-msgs'
'ros-kinetic-diagnostic-msgs'
'ros-kinetic-geometry-msgs'
'ros-kinetic-nav-msgs'
'ros-kinetic-sensor-msgs'
'ros-kinetic-shape-msgs'
'ros-kinetic-stereo-msgs'
'ros-kinetic-trajectory-msgs'
'ros-kinetic-visualization-msgs'
)

conflicts=()
replaces=()

_dir=common_msgs
source=()
md5sums=()

prepare() {
    cp -R $startdir/common_msgs $srcdir/common_msgs
}

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/kinetic/setup.bash ] && source /opt/ros/kinetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/kinetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

