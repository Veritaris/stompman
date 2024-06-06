default: install lint-format check-types test

install:
    poetry install --sync

test *args:
    poetry run pytest {{args}}

lint-format:
    poetry run ruff check .
    poetry run ruff format .

check-types:
    poetry run mypy .

run-artemis:
    docker compose up

run-consumer:
    poetry run python testing/consumer.py

run-publisher:
    poetry run python testing/publisher.py

publish number:
    poetry version {{number}}
    poetry publish --build
