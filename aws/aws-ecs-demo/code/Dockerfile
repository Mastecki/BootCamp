# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.9
# working directory
WORKDIR /app
# copy all files to the container
COPY .  .
# Install pip requirements
RUN python -m pip install --no-cache-dir -r requirements.txt
# port number to expose
EXPOSE 5000
# run the command
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]
