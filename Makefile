# https://github.com/alecGraves/wiki/wiki/How-to-use-Docker-(with-ROS)


build:
	docker build -t ajmendez:roboto .

run:
	docker run --rm -it --name robot \
		-v $(PWD)/app:/app \
		-v $(PWD)/catkin_ws/src:/root/catkin_ws/src \
		roboto 

shell:
	docker exec -it robot bash
	
clean:
	docker rm robot


# Clean catkin_make, removes build && devel
ccm:
	docker run --rm -itv ./catkin_ws:/root/catkin_ws $(MY_ROS_IMAGE) \
			sh -c "cd /root/catkin_ws && mkdir src || : && rm -rf build/ devel/ && catkin_make"

# Regular catkin_make
cm:
	docker run --rm -itv ./catkin_ws:/root/catkin_ws $(MY_ROS_IMAGE) \
			sh -c "cd /root/catkin_ws && catkin_make"

env:
	docker run --rm -itv ./catkin_ws:/root/catkin_ws -w="/root/catkin_ws/" $(MY_ROS_IMAGE)
