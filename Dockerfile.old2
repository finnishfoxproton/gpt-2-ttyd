FROM mattyq/gpt-2:cpu

RUN apt-get update; apt install -y wget
RUN wget https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.x86_64 -O /usr/local/bin/ttyd \
    && chmod +x /usr/local/bin/ttyd

ENV LOGIN_USER admin
ENV LOGIN_PASSWORD admin

CMD ttyd --port $PORT -t disableLeaveAlert=true --credential $LOGIN_USER:$LOGIN_PASSWORD bash
