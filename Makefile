VC=v

fmt:
	find . -type f -name '*.v' | xargs -n1 $(VC) fmt -w

test:
	$(VC) test .

.PHONY: test format
