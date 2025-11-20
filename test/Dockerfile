FROM mcr.microsoft.com/playwright/python:latest
WORKDIR /opt/robot
RUN pip install --no-cache-dir robotframework robotframework-browser && rfbrowser init
COPY resources /opt/robot/resources
COPY env /opt/robot/env
COPY tests /opt/robot/tests
CMD ["robot","-d","/opt/robot/results","/opt/robot/tests"]