FROM tiangolo/uwsgi-nginx-flask:python3.8

# RUN mkdir -p /root/.cache/torch/hub/checkpoints && \
#     wget --no-check-certificate -P /root/.cache/torch/hub/checkpoints  https://download.pytorch.org/models/resnet18-5c106cde.pth

RUN groupadd -r myuser && useradd -r -g myuser myuser

USER root 

COPY ./requirements.txt /app/
RUN python3 -m pip install -r /app/requirements.txt

# COPY . /app/
COPY . .

EXPOSE 8080

CMD [ "python", "app.py" ]

USER myuser