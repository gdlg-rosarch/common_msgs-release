# Script generated with Bloom
pkgdesc="ROS - common_msgs contains messages that are widely used by other ROS packages. These includes messages for actions (<a href="http://wiki.ros.org/actionlib_msgs">actionlib_msgs</a>), diagnostics (<a href="http://wiki.ros.org/diagnostic_msgs">diagnostic_msgs</a>), geometric primitives (<a href="http://wiki.ros.org/geometry_msgs">geometry_msgs</a>), robot navigation (<a href="http://wiki.ros.org/nav_msgs">nav_msgs</a>), and common sensors (<a href="http://wiki.ros.org/sensor_msgs">sensor_msgs</a>), such as laser range finders, cameras, point clouds."
url='http://wiki.ros.org/common_msgs'

pkgname='ros-lunar-common-msgs'
pkgver='1.12.5_1'
pkgrel=1
arch=('any')
license=('BSD'
)

makedepends=('ros-lunar-catkin'
)

depends=('ros-lunar-actionlib-msgs'
'ros-lunar-diagnostic-msgs'
'ros-lunar-geometry-msgs'
'ros-lunar-nav-msgs'
'ros-lunar-sensor-msgs'
'ros-lunar-shape-msgs'
'ros-lunar-stereo-msgs'
'ros-lunar-trajectory-msgs'
'ros-lunar-visualization-msgs'
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
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/lunar \
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

