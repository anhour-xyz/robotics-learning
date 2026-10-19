#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/ee545au26/mushr_ws/src/mushr545/introduction"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/ee545au26/mushr_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/ee545au26/mushr_ws/install/lib/python3/dist-packages:/home/ee545au26/mushr_ws/build/introduction/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/ee545au26/mushr_ws/build/introduction" \
    "/usr/bin/python3" \
    "/home/ee545au26/mushr_ws/src/mushr545/introduction/setup.py" \
    egg_info --egg-base /home/ee545au26/mushr_ws/build/introduction \
    build --build-base "/home/ee545au26/mushr_ws/build/introduction" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/ee545au26/mushr_ws/install" --install-scripts="/home/ee545au26/mushr_ws/install/bin"
