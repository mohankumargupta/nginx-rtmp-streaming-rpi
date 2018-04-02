# nginx-rtmp-streaming-rpi

### What does it do?
Turn your raspberry pi into a live streaming server. You can a streaming application like OBStudio or XSplit to record the live event, then push the audio/video stream to the streaming server.

### Features
- provide a webpage to view the live 
  stream.
- upload the stream to a service like
  Youtube, twitch etc.
- record live stream as an flv file for  
  later viewing in VLC

### Prerequisites
- You need a machine with Ubuntu or Linux mint (can use a live USB/CD). 
    * It needs to be on the same network 
      as the pi.
    * You have to remember the SUDO 
      password
- Raspberry Pi with SSH enabled

# INSTALLATION

##### First-time setup
On the Ubuntu machine:

```
sudo apt install git
git clone https://github.com/mohankumargupta/nginx-rtmp-streaming-rpi
cd nginx-rtmp-streaming-rpi
bash install.sh
```

##### Change config files
**hosts**: 
 - change the IP address to that of the
   Raspberry Pi


##### Turn Pi into Streaming Server
Then run the following:

```
make
```

It can take up to 40min, so be patient.

# Post-Installation

##### OBS Studio Configuration
File -> Settings -> Stream:
```
Streaming Service: Custom streaming server
Server: rtmp://<Server IP>/live
Stream Key: <Stream key>
```

##### Streaming URL

```
http://<Server IP>
```

##### Raspberry Pi file locations
| File Location | Description |
| ------------- | -----------:|
| **/usr/local/nginx/conf/nginx.conf** | Nginx configuration file |
| **/usr/local/nginx/html/index.html** | Webpage | 
| **/tmp/hls/&lt;stream name&gt;** | MPEG2 streaming file location | 



### Technical Details
The software that is installed is called Nginx, which is a webserver. There is RTMP module for Nginx also installed. Here is what happens when you push an RTMP stream to the raspberry pi.

1. RTMP Stream arrives at streaming server at well-known RTMP port (1935)

2. The stream is encoded as H.264/AAC, then encapsulated as MPEG2-TS

3. This MPEG2-TS file is then divided into fragments of equal length, kept as .ts files. It also creates an index file(playlist) that references the fragments, with file extension .m3u8
 (once you "build" this project, these files are located at /tmp/hls/<stream name>)

4. The index.html then references the playlist file in a video tag.

5. Reference: https://en.wikipedia.org/wiki/HTTP_Live_Streaming




