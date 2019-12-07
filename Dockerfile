FROM python:3.7-slim

ARG USER=jovyan
ENV HOME=/home/${USER}

COPY requirements.txt /tmp/requirements.txt

RUN pip install -r /tmp/requirements.txt

RUN useradd -d ${HOME} -ms /bin/bash ${USER}
RUN chown -R ${USER} ${HOME} && chmod 755 ${HOME}

USER ${USER}
WORKDIR ${HOME}

CMD ["/bin/bash"]