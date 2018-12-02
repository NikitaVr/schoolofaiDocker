FROM jupyter/tensorflow-notebook

RUN pip install nltk
RUN [ "python", "-c", "import nltk; nltk.download('all')" ]

COPY ./TensorFlow-Examples /home/jovyan/TensorFlow-Examples