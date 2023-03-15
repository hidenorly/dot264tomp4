#/bin/bash

#  Copyright (C) 2023 hidenorly
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

split264 $1
FILENAME=`echo $1 | sed -E 's/\.264//'`
FILENAME_H264=$FILENAME.h264
FILENAME_WAV=$FILENAME.wav
FILENAME_TMP_MP4=$FILENAME_tmp.mp4
FILENAME_MP4=$FILENAME.mp4
if [ -f "$FILENAME_H264" ]; then
	x264 $FILENAME_H264 -o $FILENAME_TMP_MP4
	if [ -f "$FILENAME_TMP_MP4" ]; then
		ffmpeg -y -i $FILENAME_TMP_MP4 -i $FILENAME_WAV -c:v copy -c:a aac -map 0:v:0 -map 1:a:0 $FILENAME_MP4
		rm $FILENAME_TMP_MP4
		rm $FILENAME_WAV
		rm $FILENAME_H264
		rm $FILENAME.audio.ts.txt
		rm $FILENAME.video.ts.txt
	fi
fi
