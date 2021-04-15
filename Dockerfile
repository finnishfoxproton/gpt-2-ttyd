
#CPU version

FROM tensorflow/tensorflow:1.12.0-py3

ENV LANG=C.UTF-8
RUN mkdir /gpt-2
WORKDIR /gpt-2
ADD . /gpt-2
RUN pip3 install -r requirements.txt
RUN python3 download_model.py 124M
RUN python3 download_model.py 355M
RUN python3 download_model.py 774M
RUN python3 download_model.py 1558M
RUN apt-get update; apt install -y wget
RUN wget https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.x86_64 -O /usr/local/bin/ttyd \
    && chmod +x /usr/local/bin/ttyd

ENV LOGIN_USER admin
ENV LOGIN_PASSWORD admin

CMD ttyd --port $PORT -t disableLeaveAlert=true --credential $LOGIN_USER:$LOGIN_PASSWORD bash
