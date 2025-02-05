FROM python:3.9-slim-bookworm

WORKDIR /code


COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache /wheels/*

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"] 



# # DEV stage
# FROM python:${PYTHON_VERSION}-slim-buster AS dev

# WORKDIR /app

# COPY --from=build /app/wheels /wheels
# COPY --from=build /app/requirements.txt .

# RUN pip install --no-cache /wheels/* && pip install debugpy

# CMD python -Xfrozen_modules=off -m debugpy --wait-for-client --listen 0.0.0.0:9226 -m uvicorn app:app --reload --host ${BACKEND_HOST} --port ${PORT}