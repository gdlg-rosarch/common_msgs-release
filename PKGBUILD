# Script generated with Bloom
pkgdesc="ROS - This package defines messages for defining robot trajectories. These messages are also the building blocks of most of the <a href="http://wiki.ros.org/control_msgs">control_msgs</a> actions."
url='http://wiki.ros.org/trajectory_msgs'

pkgname='ros-lunar-trajectory-msgs'
pkgver='1.12.5_1'
pkgrel=1
arch=('any')
license=('BSD'
)

makedepends=('ros-lunar-catkin'
'ros-lunar-geometry-msgs'
'ros-lunar-message-generation'
'ros-lunar-std-msgs'
)

depends=('ros-lunar-geometry-msgs'
'ros-lunar-message-runtime'
'ros-lunar-rosbag-migration-rule'
'ros-lunar-std-msgs'
)

conflicts=()
replaces=()

_dir=trajectory_msgs
source=()
md5sums=()

prepare() {
    cp -R $startdir/trajectory_msgs $srcdir/trajectory_msgs
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

