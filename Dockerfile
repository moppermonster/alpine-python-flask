# https://github.com/nielsds/alpine-python-falcon

FROM moppermonster/alpine-python

# Install friends
RUN apk add --no-cache nginx uwsgi uwsgi-python3 supervisor

# Install Flask
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

# Clean up
RUN rm /etc/nginx/conf.d/default.conf
RUN rm -r /root/.cache

# Config files
COPY nginx.conf /etc/nginx/
COPY flask-site-nginx.conf /etc/nginx/conf.d/
COPY uwsgi.ini /etc/uwsgi/
COPY supervisord.conf /etc/supervisord.conf

# Prepare static directory
RUN mkdir /static

# Copy default app.py
COPY app.py /app.py

CMD ["/usr/bin/supervisord"]
