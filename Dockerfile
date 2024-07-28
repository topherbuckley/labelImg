FROM ubuntu:focal

# Install dependencies
RUN apt-get update && apt-get install -y \
	python3 \
	python3-pip 

# Set the timezone noninteractively
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata	pyqt5-dev-tools

# Install Python dependencies
COPY requirements/requirements-linux-python3.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

# Copy the application
COPY . /labelImg

# Set the working directory
WORKDIR /labelImg
RUN make qt5py3
CMD ["python3", "labelImg.py"]
