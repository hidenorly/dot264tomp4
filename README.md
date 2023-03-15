# dot264tomp4

Convert .264 to .mp4

# Preparation

The following steps are for Mac OS X.

## Install ffmpeg

```
$ brew install ffmpeg
```

## Build x264 with mp4 file support

```
$ brew install gpac
```

```
$ cd ~/work
$ git clone https://github.com/l-smash/l-smash.git
$ cd l-smash
$ sudo make install
```

```
$ cd ~/work
$ git clone https://code.videolan.org/videolan/x264.git 
$ cd x264
$ ./configure
$ make -j 10
```

Note that you need to add PATH to the built x264.


## split264

https://www.spitzner.org/kkmoon.html
The 2nd code is needed to save as "split264.c"

```
$ clang split264.c
$ mv a.out split264
```

Note that you need to add PATH to the built split264.


# How to convert .264 to .mp4

```
$ conv-264-mp4.sh P230311_155008_155523.264
```

Convert all of .264 to .mp4

```
$ find . -type f | grep -E "\.264$" | xargs -n 1 conv-264-mp4.sh
```


# Reference

* https://code.videolan.org/videolan/x264
* http://l-smash.github.io/l-smash/
* https://www.spitzner.org/kkmoon.html
