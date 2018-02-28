IMAGE="bosolutions/d8-cli"
CONATAINER_DEV="d8-cli"

.PHONY: debug \
	release \
	clean

debug: clean \
	test

clean:
	docker stop $(CONATAINER_DEV) || true
	docker rm $(CONATAINER_DEV) || true

test:
	docker build -t $(IMAGE) --rm .
	docker run --name $(CONATAINER_DEV) --rm \
					-v $(HOME):/${USER} \
					-t $(IMAGE)

release:
#	docker build -t $(IMAGE):prod .
	docker build -t $(IMAGE):$(shell cat VERSION) .
#	docker push $(IMAGE):prod
	docker push $(IMAGE):$(shell cat VERSION)
	notify-send "Release finished"
