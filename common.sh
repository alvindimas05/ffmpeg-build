#!/usr/bin/env bash

FFMPEG_VERSION=8.0
FFMPEG_TARBALL=ffmpeg-$FFMPEG_VERSION.tar.gz
FFMPEG_TARBALL_URL=http://ffmpeg.org/releases/$FFMPEG_TARBALL

FFMPEG_CONFIGURE_FLAGS=(
    --disable-shared
    --enable-static
    --enable-pic

    --disable-doc
    --disable-debug
    --disable-avdevice
    --disable-swscale
    --disable-programs
    --enable-ffmpeg
    --enable-ffprobe
    --disable-network
    --disable-muxers
    --disable-demuxers
    --disable-zlib
    --disable-lzma
    --disable-bzlib
    --disable-iconv
    --disable-libxcb
    --disable-bsfs
    --disable-filters
    --disable-parsers
    --disable-indevs
    --disable-outdevs
    --disable-encoders
    --disable-decoders
    --disable-hwaccels
    --disable-nvenc
    --disable-videotoolbox
    --disable-audiotoolbox

    --disable-filters
    --enable-filter=aformat
    --enable-filter=anull
    --enable-filter=atrim
    --enable-filter=format
    --enable-filter=null
    --enable-filter=setpts
    --enable-filter=trim

    --disable-protocols
    --enable-protocol=file
    --enable-protocol=pipe

    # Input demuxers (only what Fluyer supports)
    --enable-demuxer=flac
    --enable-demuxer=aac
    --enable-demuxer=mov
    --enable-demuxer=wav
    --enable-demuxer=ogg
    --enable-demuxer=mp3
    --enable-demuxer=alac
    --enable-demuxer=opus

    # Decoders for those demuxers
    --enable-decoder=flac
    --enable-decoder=aac
    --enable-decoder=alac
    --enable-decoder=mp3
    --enable-decoder=opus
    --enable-decoder=pcm_s16le
    --enable-decoder=pcm_s24le
    --enable-decoder=pcm_s32le
    --enable-decoder=vorbis

    # Parsers (needed for some input formats)
    --enable-parser=aac
    --enable-parser=flac
    --enable-parser=mpegaudio
    --enable-parser=vorbis

    # Output encoder (ONLY libmp3lame)
    --enable-muxer=mp3
    --enable-encoder=libmp3lame
    --enable-libmp3lame

    # Required filter
    --enable-filter=aresample
)
