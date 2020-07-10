# Use a very small linux
FROM python:3.8.3-slim-buster

# Copy installation requirements & expected versions
COPY ./requirements.txt /requirements.txt

# Install 
RUN pip install -r /requirements.txt

# Install customized theme
RUN pip install https://github.com/FAIRplus/sphinx-book-theme/archive/92f567867b43a3c7e6daf284bf31c5f24a674f90.tar.gz

# Document
RUN pip freeze > /pip_freeze_actual.txt

# Print
RUN cat /pip_freeze_actual.txt

# Copy expected pip freeze
COPY ./pip_freeze.txt /pip_freeze_expected.txt

# Compare ; would exit if files differ (because exit code -> 1)
RUN diff /pip_freeze_expected.txt /pip_freeze_actual.txt

# Set the working directory.
WORKDIR /app/

## Allows to mount the jupyter-book content into this directory
VOLUME /app/book

## Allows to access the build result
VOLUME /app/_build

CMD cp -rT /app/book /app/tmp && jupyter-book build /app/tmp/ && cp -rT /app/tmp/_build /app/_build





