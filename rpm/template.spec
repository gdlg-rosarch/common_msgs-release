Name:           ros-jade-diagnostic-msgs
Version:        1.12.5
Release:        0%{?dist}
Summary:        ROS diagnostic_msgs package

Group:          Development/Libraries
License:        BSD
URL:            http://wiki.ros.org/diagnostic_msgs
Source0:        %{name}-%{version}.tar.gz

BuildArch:      noarch

Requires:       ros-jade-message-runtime
Requires:       ros-jade-std-msgs
BuildRequires:  ros-jade-catkin
BuildRequires:  ros-jade-message-generation
BuildRequires:  ros-jade-std-msgs

%description
This package holds the diagnostic messages which provide the standardized
interface for the diagnostic and runtime monitoring systems in ROS. These
messages are currently used by the diagnostics Stack, which provides libraries
for simple ways to set and access the messages, as well as automated ways to
process the diagnostic data. These messages are used for long term logging and
will not be changed unless there is a very important reason.

%prep
%setup -q

%build
# In case we're installing to a non-standard location, look for a setup.sh
# in the install tree that was dropped by catkin, and source it.  It will
# set things like CMAKE_PREFIX_PATH, PKG_CONFIG_PATH, and PYTHONPATH.
if [ -f "/opt/ros/jade/setup.sh" ]; then . "/opt/ros/jade/setup.sh"; fi
mkdir -p obj-%{_target_platform} && cd obj-%{_target_platform}
%cmake .. \
        -UINCLUDE_INSTALL_DIR \
        -ULIB_INSTALL_DIR \
        -USYSCONF_INSTALL_DIR \
        -USHARE_INSTALL_PREFIX \
        -ULIB_SUFFIX \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -DCMAKE_INSTALL_PREFIX="/opt/ros/jade" \
        -DCMAKE_PREFIX_PATH="/opt/ros/jade" \
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
        -DCATKIN_BUILD_BINARY_PACKAGE="1" \

make %{?_smp_mflags}

%install
# In case we're installing to a non-standard location, look for a setup.sh
# in the install tree that was dropped by catkin, and source it.  It will
# set things like CMAKE_PREFIX_PATH, PKG_CONFIG_PATH, and PYTHONPATH.
if [ -f "/opt/ros/jade/setup.sh" ]; then . "/opt/ros/jade/setup.sh"; fi
cd obj-%{_target_platform}
make %{?_smp_mflags} install DESTDIR=%{buildroot}

%files
/opt/ros/jade

%changelog
* Fri Sep 30 2016 Tully Foote <tfoote@osrfoundation.org> - 1.12.5-0
- Autogenerated by Bloom

* Mon Feb 22 2016 Tully Foote <tfoote@osrfoundation.org> - 1.12.4-0
- Autogenerated by Bloom

* Mon Apr 20 2015 Tully Foote <tfoote@osrfoundation.org> - 1.12.3-0
- Autogenerated by Bloom

* Sat Mar 21 2015 Tully Foote <tfoote@osrfoundation.org> - 1.12.2-0
- Autogenerated by Bloom

* Tue Mar 17 2015 Tully Foote <tfoote@osrfoundation.org> - 1.12.1-0
- Autogenerated by Bloom

* Mon Dec 29 2014 Tully Foote <tfoote@osrfoundation.org> - 1.12.0-0
- Autogenerated by Bloom

