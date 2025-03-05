# Docker Virtual XVFB & Pipewire

This Dockerfile sets up a virtual display (XVFB) and a virtual audio device (Pipewire) within a Docker container. This setup is particularly useful for processing video and audio in a containerized environment, especially when running on cloud infrastructure where no physical display or audio devices are available.

Initially, I used PulseAudio for audio processing, but it resulted in crackling sounds issues. Switching to Pipewire resolved these audio issues. Configuring a virtual sink in Pipewire was challenging due to the lack of online examples, so this setup is shared to help others facing similar challenges.

## Features
- **XVFB (X Virtual Framebuffer):** Provides a virtual display for running graphical applications without a physical display.
- **Pipewire:** Handles audio processing with a virtual audio sink, ensuring smooth audio playback without crackling.
- **VLC example:** Showing a minimal setup example with playing a small video with VLC.
- **VNC Support:** Optional VNC server setup to view the virtual display remotely.

## Prerequisites
- Docker installed on your system.

## Build the Docker Image
To build the Docker image, run the following command:

```bash
docker build -t docker-virtual-xvfb-pipewire .
```

## Run the Docker Container
To run the container, use the following command:

```bash
docker run -it --rm docker-virtual-xvfb-pipewire
```

## Optional: VNC Access
If you want to access the virtual display using a VNC client, make sure to map port 5900 when running the container (`-p 5900:5900`). You can connect to the VNC server using a VNC client at `localhost:5900`.

## Usage
This setup is ideal for scenarios where you need to process video and audio in a headless environment, such as:

- Automated video rendering.
- Audio processing tasks.
- Running GUI-based applications in the cloud.
- Streaming GUI's applications through network (using ffmpeg)

## Troubleshooting
- **Crackling Audio:** If you encounter crackling audio, ensure that Pipewire is properly configured as the audio backend (and not pulseaudio).
- **VNC Connection Issues:** Verify that port 5900 is correctly mapped and accessible.

## Contributing
If you have any improvements or suggestions, feel free to open an issue or submit a pull request. Your contributions are welcome!

## License
This project is licensed under the MIT License.

## Acknowledgments
Thanks to the Pipewire and XVFB communities.

