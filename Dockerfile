# Use the official Python slim image as a base image
FROM python:3.10.11-slim

# Set environment variables for Python and Poetry
ENV PYTHONUNBUFFERED=1 \
    POETRY_HOME="/opt/poetry" \
    PATH="/opt/poetry/bin:$PATH"

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        build-essential \
        libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python -

# Copy only the dependencies files to optimize caching
WORKDIR /code
COPY pyproject.toml poetry.lock /code/

# Install dependencies
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

# Copy the rest of the application code
COPY . .

RUN chmod +x /code/entrypoint.sh

# Start the Django application
CMD ["/code/entrypoint.sh"]
