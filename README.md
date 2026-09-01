# NoRMA ROS Docker

ROS Noetic environment for the NoRMA wheelchair control system.
Tested on Raspberry Pi 5 with Ubuntu 24.04.

## Setup

### Prerequisites
- Docker installed
- Raspberry Pi 5
- Supported host OS Ubuntu (24.04 preferred)

### Run
```bash
docker compose up -d
docker exec -it norma_ros bash
roslaunch wheelchair_virtual_joystick_driver norma.launch
```

### Access web interface
- Connect to NoRMA-Wheelchair Hotspot
- Open browser at `http://10.42.0.1:8000`
