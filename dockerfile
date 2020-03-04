FROM amd64/ubuntu
LABEL MAINTAINER deleyva <jesuslopezdeleyva@gmail.com>

RUN apt-get update && \
	apt-get install -y software-properties-common && \
	apt-get install python3-pip -y && \
	pip3 install --upgrade pip

RUN mkdir /home/code
WORKDIR /home/code
ADD requirements.txt .
RUN pip install -r requirements.txt
ENTRYPOINT [ "jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

#	apt-get install r-base -y
