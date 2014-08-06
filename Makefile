help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "  clean           remove temporary files created by build tools"
	@echo "  cleantox        remove files created by tox"
	@echo "  cleanegg        remove temporary files created by build tools"
	@echo "  cleanpy         remove temporary python files"
	@echo "  cleanall        all the above + tmp files from development tools"
	@echo "  sdist           make a source distribution"

clean:
	-rm -f MANIFEST
	-rm -rf dist/
	-rm -rf build/

cleantox:
	-rm -rf .tox/

cleanegg:
	-rm -rf docker_jinja.egg-info/

cleanpy:
	-find . -type f -name "*~" -exec rm -f "{}" \;
	-find . -type f -name "*.orig" -exec rm -f "{}" \;
	-find . -type f -name "*.rej" -exec rm -f "{}" \;
	-find . -type f -name "*.pyc" -exec rm -f "{}" \;
	-find . -type f -name "*.parse-index" -exec rm -f "{}" \;
	-find . -type d -name "__pycache__" -exec rm -rf "{}" \;

cleanall: clean cleanegg cleanpy

sdist: clean cleanegg cleanpy
	python setup.py sdist
