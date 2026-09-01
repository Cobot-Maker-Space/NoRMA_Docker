FROM ros:noetic-ros-base

# Install all dependencies
RUN apt-get update && apt-get install -y \
    python3-catkin-tools \
    python3-rosdep \
    python3-pip \
    python-is-python3 \
    build-essential \
    git \
    ros-noetic-rosbridge-server \
    ros-noetic-joy \
    ros-noetic-urg-node \
    && rm -rf /var/lib/apt/lists/*

# Initialise rosdep
RUN rosdep init && rosdep update

# Clone NoRMA repo
RUN mkdir -p /root/norma_ws/src && \
    cd /root/norma_ws/src && \
    git clone https://github.com/lew101/NoRMA.git

# Build workspace
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && \
    cd /root/norma_ws && \
    catkin_make"

# Source everything on startup
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc && \
    echo "source /root/norma_ws/devel/setup.bash" >> ~/.bashrc

CMD ["bash"]
