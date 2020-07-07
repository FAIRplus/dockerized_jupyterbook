## dockerized jupyter book

This repo allows you to build a dockerized jupyter-book static site generator. You can use it to convert a collection of markdown files and jupyter notebooks into a static site, i.e. a collection of html files. You can host this static site then e.g. via GitHub pages.


### The stack

The current version of jupyter-book is 0.7.1.


### How to build the Docker image 

This assumes you have (docker installed)[https://docs.docker.com/get-started/]. 

Clone this repo. Enter it:

```
$ git clone git@github.com:FAIRplus/dockerized_jupyterbook.git
$ cd dockerized_jupyterbook
```

Execute this to build a Docker image (tagged `jupyterbook`) including the jupyter book executable:

`$ docker build -t jupyterbook .`

To understand what just happened there, you might want to have a look in the file called `Dockerfile`.


###  How to start the container

Navigate to where your content sits (the `.md` files). If you want to build the FAIR cookbook, this means:

````
$ git clone git@github.com:FAIRplus/the-fair-cookbook.git
$ cd the-fair-cookbook
```

Create an extra folder called `_build` somewhere else. We recommend to create it one level above:

`$ mkdir ../_build`

Note down your current working directory:

`$ pwd`

This command will yield your current working directory, e.g. `/Users/robert/git/experimental`. You have to replace this with your own value.

The following command starts the Docker image tagged `jupyterbook`, and names the resulting container with `jb`.

`docker run --mount type=bind,source=/Users/robert/git/experimental/_build,target=/app/_build --mount type=bind,readonly,source=/Users/robert/git/experimental/the-fair-cookbook/book,target=/app/book --name jb --rm -it jupyterbook`

Executed like this, the command above starts a build. The command executed within the docker container (i.e. its `CMD` argument (see Dockerfile from previous step)) is set to `jupyter-book build /content/`.


### Publishing the built docker images

```
docker tag jupyterbook rgiessmann/jupyterbook
docker push rgiessmann/jupyterbook
```

