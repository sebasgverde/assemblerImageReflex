practica organizacion de computadores

nasm with c library

http://myweb.lmu.edu/dondi/share/sp/nasm64.pdf

http://stackoverflow.com/questions/8523905/calling-c-io-functions-in-linux-nasm-assembly

http://forum.nasm.us/index.php?topic=1532.0

http://www.daniweb.com/software-development/assembly/threads/453853/calling-c-functions-in-x86_64-assembly-nasm

libreria imagenes
http://docs.opencv.org/doc/user_guide/ug_mat.html

http://opencv.wikispaces.com/3)+First+Sample+Programç

http://linux4research.blogspot.com/2007/06/compile-cpp-with-opencv.html

http://www.ozbotz.org/opencv-installation-2-3-1/

http://docs.opencv.org/doc/tutorials/introduction/linux_install/linux_install.html


combinar estos tutos
http://namhuy.net/1205/how-to-install-opencv-on-ubuntu.html

http://desarrollophpsenior.wordpress.com/2012/09/19/instalar-opencv-2-4-2-en-ubuntu-12-04-lts/


gdb
http://www.csee.umbc.edu/portal/help/nasm/nasm.shtml

http://myweb.lmu.edu/dondi/share/sp/nasm64.pdf

http://www.nasm.us/doc/nasmdo11.html

paso de parametros y llamadas a c en asm64
http://www.nasm.us/doc/nasmdo11.html

sudo apt-get install build-essential libgtk2.0-dev libjpeg-dev libtiff4-dev libjasper-dev libopenexr-dev cmake python-dev python-numpy python-tk libtbb-dev libeigen2-dev yasm libfaac-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev libqt4-dev libqt4-opengl-dev sphinx-common texlive-latex-extra libv4l-dev libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev

wget http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/2.4.2/OpenCV-2.4.2.tar.bz2
tar -xvf OpenCV-2.4.2.tar.bz2


gcc `pkg-config --cflags opencv` -o test logo1.c `pkg-config --libs opencv`


http://www.cs.iit.edu/~agam/cs512/lect-notes/opencv-intro/opencv-intro.html#SECTION00020000000000000000