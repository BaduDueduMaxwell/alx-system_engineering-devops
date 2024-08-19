# 0x0D. Web Stack Debugging #0

## Description
This project is the first in a series of web stack debugging challenges. The goal of this project is to debug and fix a broken or bugged web stack. Specifically, you need to get Apache running on a Docker container and return a webpage containing the text "Hello Holberton" when querying the root.

### Background Context
In this debugging series, you'll be working on broken or bugged web stacks. The primary goal is to understand what is wrong with the stack and fix it. This project focuses on a simple example where Apache is not returning a page as expected.

### Tasks
#### Task 0: Give me a page!
- **Objective**: Get Apache to run on the container and return a page containing "Hello Holberton" when querying the root of the server.
- **Example**:
  ```bash
  vagrant@vagrant:~$ docker run -p 8080:80 -d -it holbertonschool/265-0
  47ca3994a4910bbc29d1d8925b1c70e1bdd799f5442040365a7cb9a0db218021
  vagrant@vagrant:~$ docker ps
  CONTAINER ID        IMAGE                   COMMAND             CREATED             STATUS              PORTS                  NAMES
  47ca3994a491        holbertonschool/265-0   "/bin/bash"         3 seconds ago       Up 2 seconds        0.0.0.0:8080->80/tcp   vigilant_tesla
  vagrant@vagrant:~$ curl 0:8080
  curl: (52) Empty reply from server
  vagrant@vagrant:~$
  vagrant@vagrant:~$ curl 0:8080
  Hello Holberton
  vagrant@vagrant:~$
