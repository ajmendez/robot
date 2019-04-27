FROM ros:kinetic-robot



RUN apt-get update && apt-get install -y sudo wget 
WORKDIR ~/catkin_ws/src/
RUN wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh && chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh

RUN apt-get install -y ros-kinetic-joy ros-kinetic-teleop-twist-joy ros-kinetic-teleop-twist-keyboard ros-kinetic-laser-proc ros-kinetic-rgbd-launch ros-kinetic-depthimage-to-laserscan ros-kinetic-rosserial-arduino ros-kinetic-rosserial-python ros-kinetic-rosserial-server ros-kinetic-rosserial-client ros-kinetic-rosserial-msgs ros-kinetic-amcl ros-kinetic-map-server ros-kinetic-move-base ros-kinetic-urdf ros-kinetic-xacro ros-kinetic-compressed-image-transport ros-kinetic-rqt-image-view ros-kinetic-gmapping ros-kinetic-navigation ros-kinetic-interactive-markers

RUN git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
RUN git clone https://github.com/ROBOTIS-GIT/turtlebot3.git


RUN /bin/bash -c "bash /ros_entrypoint.sh"
# RUN mkdir -p ~/catkin_ws/src/


# RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash ;\
#                   catkin init ;\
#                   catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release ;\
#                   catkin build --no-status --no-summary --no-notify"


# RUN cd ~/catkin_ws/ && \
#     /bin/bash -c "bash /ros_entrypoint.sh && /opt/ros/kinetic/bin/catkin_make"
    # catkin_make
# cd ~/catkin_ws && catkin_make


WORKDIR /

