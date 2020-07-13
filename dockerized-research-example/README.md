# Dockerized research example

## How to use it

To build this Docker image for sharing:

```
docker build -t <user>/<imagename>
```

To run this Docker image:

```
docker run -it <user>/<imagename>
```

You can expose Docker ports to connect to a Jupyter server instance like this:


```
docker run -it -p 127.0.0.1:8888:8888 <user>/<imagename>:<label>
                  #^host ip:port |^docker port

```

Inside Docker, `jupyter` must be run like this. IP needs to be `0.0.0.0`!

```
conda activate research
jupyter-lab --ip=0.0.0.0
```

Now, you can open your browser in your host machine and access http://localhost:8888 like usual.

### Some notes

* All work will be lost when you exit Docker. If you need to save something copy it _outside_ the Docker image _before_ shutting it down!

## How to build yours

Customize the contents of `devtools`. Mainly:

* `run_in_docker.sh` contains the main logic to render the contents _inside_ your Docker image. It relies on the accompanying environment file. Some lines at the top should _not_ be modified!