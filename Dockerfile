# magenta-session Dockerfile

# base image
FROM nvcr.io/nvidia/tensorflow:20.07-tf2-py3

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
ENV TF_FORCE_GPU_ALLOW_GROWTH true

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential libasound2-dev libjack-dev portaudio19-dev libsndfile1  \
  && apt-get clean

COPY ./requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt

COPY . /src/

WORKDIR /src/
