IMAGE="bosolutions/ci-cd"
CONATAINER_DEV="dev-ci-cd"

.PHONY: debug \
	release \
	clean

debug: clean \
	test

test:
	docker build -t $(IMAGE) --rm .
	docker run --name $(CONATAINER_DEV) --rm \
				-v $(HOME):/${USER} \
				-it $(IMAGE)

release:
#	docker build -t $(IMAGE_PROD):prod .
	docker build -t $(IMAGE):$(shell cat VERSION) .
#	docker push $(IMAGE_PROD):prod
	docker push $(IMAGE):$(shell cat VERSION)

clean:
	docker stop $(CONATAINER_DEV) || true
	docker rm $(CONATAINER_DEV) || true
