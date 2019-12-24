FROM python:3.7

MAINTAINER hankail05 hankail0582@gmail.com

WORKDIR /home/user

COPY requirements.txt .
RUN pip install --no-cache -r requirements.txt

RUN jupyter notebook --generate-config --allow-root

RUN echo "c.NotebookApp.password = u'sha1:6a3f528eec40:6e896b6e4828f525a6e20e5411cd1c8075d68619'" >> /root/.jupyter/jupyter_notebook_config.py

EXPOSE 8888

ENTRYPOINT jupyter notebook --allow-root --ip=0.0.0.0 --port=8888 --no-browser
