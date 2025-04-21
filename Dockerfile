FROM ros:humble AS base

RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-dev \
    git \
    build-essential \
    wget \
    cmake \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-libav \
    gstreamer1.0-gl \
    libfuse2 \
    libxcb-xinerama0 \
    libxkbcommon-x11-0 \
    libxcb-cursor-dev \
    libopencv-dev \
    ros-dev-tools \
    ros-humble-xacro \
    ros-humble-gazebo-ros \
    ros-humble-rviz2 \
    ros-humble-joint-state-publisher-gui \
    ros-humble-cv-bridge \
    ros-humble-camera-calibration \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create the directories where the volumes will be mounted
RUN mkdir -p /workspace/src /workspace/notebooks /workspace/scripts

WORKDIR /workspace

COPY requirements.txt .

RUN pip3 install --no-cache-dir -r ./requirements.txt

COPY entrypoint.sh .

CMD [ "./entrypoint.sh" ]
