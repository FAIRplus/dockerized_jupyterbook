## dockerized jupyter book


### How to build the Docker image 

Clone this repo. Enter it.

Execute this to build a Docker image (tagged `jupyterbook`) including the jupyter book executable:

`docker build -t jupyterbook .`


###  How to start the container

Navigate to where your content sits (the `.md` files).

This starts the Docker image tagged `jupyterbook`, and names the resulting container with `jb`.

`docker run --name jb --rm -it jupyterbook`

Executed like this, the command above starts a build. The command executed within the docker container (i.e. its `CMD` argument (see Dockerfile from previous step)) is set to `jupyter-book build /content/`.


### Further commands


`docker run --mount type=bind,source=/Users/robert/git/experimental/_build,target=/app/_build --mount type=bind,readonly,source=/Users/robert/git/experimental/the-fair-cookbook/book,target=/app/book --name jb --rm -it jupyterbook`


0.6.4 :

cp -r /app/book/ /app/tmp/ && jupyter-book build /app/tmp/ && mv /app/tmp/_build/* /app/_build/

- book
  - _config.yml
  - content/
  - _data/toc.yml

---


$ docker run -it --rm -v "$PWD":/usr/src/app -p "4000:4000" starefossen/github-pages


OR


Gemfile
.bundle/config

$ cat Gemfile
# frozen_string_literal: true
source "https://rubygems.org"
gem 'github-pages', group: :jekyll_plugins

$ bundle config set path 'vendor/bundle'

$ bundle install


