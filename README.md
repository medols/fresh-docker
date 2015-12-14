fresh-docker
============

Docker container for using **[Fresh](http://github.com/medols/fresh)** to develop many-core applications.

## Usage

1. **[Install docker](https://docs.docker.com/installation/)**.

2. **Run an instance of the container**.
If this is the first time you're running it, docker will automatically download the stack of images that make up the container from 
[the automated build of this repository](https://registry.hub.docker.com/u/fresh/fresh-mc/).  
The following command will run the container and start the interactive rubinius shell with the fresh-mc..

    ```shell
      docker run -it fresh/fresh-mc
    ```

3. **Run your application** with Fresh configured to use the input/output from the terminal.

    ```shell
      cat test/freshtest.rb | docker run -i fresh/fresh-mc
    ```

