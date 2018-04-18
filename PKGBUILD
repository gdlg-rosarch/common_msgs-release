# Script generated with Bloom
pkgdesc="ROS - visualization_msgs is a set of messages used by higher level packages, such as <a href="/wiki/rviz">rviz</a>, that deal in visualization-specific data. The main messages in visualization_msgs is <tt>visualization_msgs/Marker</tt>. The marker message is used to send visualization &quot;markers&quot; such as boxes, spheres, arrows, lines, etc. to a visualization environment such as <a href="http:///www.ros.org/wiki/rviz">rviz</a>. See the rviz tutorial <a href="http://www.ros.org/wiki/rviz/Tutorials">rviz tutorials</a> for more information."
url='http://ros.org/wiki/visualization_msgs'

pkgname='ros-kinetic-visualization-msgs'
pkgver='1.12.5_1'
pkgrel=1
arch=('any')
license=('BSD'
)

makedepends=('ros-kinetic-catkin'
'ros-kinetic-geometry-msgs'
'ros-kinetic-message-generation'
'ros-kinetic-std-msgs'
)

depends=('ros-kinetic-geometry-msgs'
'ros-kinetic-message-runtime'
'ros-kinetic-std-msgs'
)

conflicts=()
replaces=()

_dir=visualization_msgs
source=()
md5sums=()

prepare() {
    cp -R $startdir/visualization_msgs $srcdir/visualization_msgs
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

