# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Install git, build tools, and necessary libraries
RUN apt-get update && apt-get install -y git build-essential && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install PyTorch for CPU
RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cpu

# Install any needed packages specified in requirements.txt
RUN pip install .

# Expose the port the app runs on
EXPOSE 8000

# Define environment variable
ENV DEBUG=9

# Run main.py when the container launches
CMD ["python3", "main.py"]