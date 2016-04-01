IMAGE:=minionscloud/vault:test
CONTAINER:=test-vault.0
	
build:
	docker build -t $(IMAGE) .
	
run:
	docker rm -fv $(CONTAINER) 2> /dev/null 1>&2 || true
	docker run --rm -it --name $(CONTAINER) -p 80 $(IMAGE)

port:
	docker port $(CONTAINER) 80