# ROS2 basic development workspace

Simply run:
```docker
docker compose up
```

from root folder and wait for image build and container creation. When it's done, run:

```docker
docker exec -it ros2_kickstart bash
```

and start developing ros2 applications in an isolated environment. 

:memo: Note: the root folder is shared, so you can code using your preferred text editor and changes are mirrored inside the container.