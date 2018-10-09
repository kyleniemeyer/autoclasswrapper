init:
	#this fix a temporary bug (09/10/2018) with pip 18.1
	#https://github.com/pypa/pipenv/issues/2924
	pip install pip==18.0
	pip install pipenv

install: init
	pipenv install --dev --skip-lock

deploy: init
	pipenv install --dev

test:
	pipenv run py.test tests

test-coverage:
	pipenv run py.test --cov-config .coveragerc --cov=autoclasswrapper --cov-report term-missing

compile:
	#pipenv run python setup.py sdist
	pipenv run python setup.py bdist_wheel

upload-to-pypi: compile
	pipenv run twine upload dist/*
	# clean compiled
	rm -f dist/*.tar.gz dist/*.whl
