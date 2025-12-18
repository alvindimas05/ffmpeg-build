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
    --enable-demuxer=image2        # For image extraction

    # Audio decoders
    --enable-decoder=flac
    --enable-decoder=aac
    --enable-decoder=alac
    --enable-decoder=mp3
    --enable-decoder=opus
    --enable-decoder=pcm_s16le
    --enable-decoder=pcm_s24le
    --enable-decoder=pcm_s32le
    --enable-decoder=vorbis
    
    # Image decoders (for cover art extraction)
    --enable-decoder=mjpeg
    --enable-decoder=png
    --enable-decoder=bmp

    # Parsers (needed for some input formats)
    --enable-parser=aac
    --enable-parser=flac
    --enable-parser=mpegaudio
    --enable-parser=vorbis

    # Output muxers - WAV for audio, image2pipe for cover art
    --enable-muxer=wav             # WAV PCM output (fast)
    --enable-muxer=image2          # For image extraction
    --enable-muxer=image2pipe      # For piping images to stdout
    
    # Output encoders - PCM WAV (fastest) and image encoders
    --enable-encoder=pcm_s16le     # 16-bit PCM WAV (very fast)
    --enable-encoder=pcm_s24le     # 24-bit PCM WAV
    --enable-encoder=pcm_s32le     # 32-bit PCM WAV
    --enable-encoder=png           # PNG encoder for cover art

    # Required filter
    --enable-filter=aresample
)
