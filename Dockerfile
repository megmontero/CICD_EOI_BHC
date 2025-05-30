FROM python:3.10
WORKDIR /code
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY . /code
CMD ["python", "main.py"]