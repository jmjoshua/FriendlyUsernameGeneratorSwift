.PHONY: docs

docs:
	@swift package --allow-writing-to-directory docs  \
    generate-documentation --target FriendlyUsernameGeneratorSwift \
    --transform-for-static-hosting \
    --hosting-base-path FriendlyUsernameGeneratorSwift \
    --output-path docs
