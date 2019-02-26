# Use an official Python runtime as a parent image
FROM neo4j:3.1.0-enterprise

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
#RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME new_neo4j

# Run app.py when the container launches
#CMD ["python", "app.py"]