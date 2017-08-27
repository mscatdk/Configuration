# ffmpeg

## Transcode video e.g. from hevc (h265) to h264
```bash
ffmpeg -i inputfile -map 0 -c:a copy -c:s copy -c:v libx264 output.mkv
```
