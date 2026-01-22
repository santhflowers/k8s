FROM python:3.9-slim  
WORKDIR /code
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    build-essential \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir -r /code/requirements.txt
COPY ./main.py /code/main.py
COPY ./form.html /code/form.html
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
