FROM aaronsu11/vision:focal-gpu-noetic-tf

# Configure terminal formatting in bashrc
COPY bashrc /etc/bash.bashrc
RUN chmod a+rwx /etc/bash.bashrc

# Install jupyter notebook
RUN python3 -m pip install --no-cache-dir jupyter matplotlib

# Pin ipykernel and nbformat; see https://github.com/ipython/ipykernel/issues/422
RUN python3 -m pip install --no-cache-dir jupyter_http_over_ws ipykernel==5.1.1 nbformat==4.4.0
RUN jupyter serverextension enable --py jupyter_http_over_ws

# Some utility tools
RUN apt-get install -y --no-install-recommends \
    wget \
    git
RUN apt-get install -y vim

# Some common python packages for vision
RUN python3 -m pip install --no-cache-dir \
    lxml \
    tqdm \
    seaborn \
    easydict

# Expose port for jupyter
EXPOSE 8888

# Prepare permission for non-root ROS user
RUN mkdir -p /.ros && chmod a+rwx /.ros

# Prepare permission for non-root jupyter notebook user
RUN mkdir -p /notebooks && chmod -R a+rwx /notebooks/
RUN mkdir /.local && chmod a+rwx /.local
