# nginx-rtmp-streaming-rpi

### OBS Studio Configuration
File -> Settings -> Stream:
```
Streaming Service: Custom streaming server
Server: rtmp://<Server IP>/live
Stream Key: <Stream key>
```

Example: rtmp://192.168.81.52/live/boo

### Streaming URL

http://&lt;Server ip&gt;

Example: http://192.168.81.52/


### Technical Details
1. RTMP Stream arrives at streaming server at well-known RTMP port (1935)

2. The stream is encoded as H.264/AAC, then encapsulated as MPEG2-TS

3. This MPEG2-TS file is then divided into fragments of equal length, kept as .ts files. It also creates an index file(playlist) that references the fragments, with file extension .m3u8
 (once you "build" this project, these files are located at /tmp/hls/<stream name>)

4. The index.html then references the playlist file in a video tag.

5. Reference: https://en.wikipedia.org/wiki/HTTP_Live_Streaming




