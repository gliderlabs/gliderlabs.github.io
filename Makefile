.PHONY: deploy

dev:
	hugo server -D

deploy:
	tar -cf - . | docker run --rm -i -e SSHKEY="$(shell cat ~/.ssh/id_rsa | base64)" gl-deploy -

deployer:
	cd deploy && docker build -t gl-deploy .
