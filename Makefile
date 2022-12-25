.DEFAULT_GOAL := all

.PHONY: all
all: install generate

# install
.PHONY: install
install: installRuby installMint
installRuby:
	@sh scripts/ruby/ruby-install.sh
installMint:
	@sh scripts/mint/mint-run.sh

# generate
.PHONY: generate
generate: generateResource installPod
generateResource:
	@sh scripts/project/generateResource.sh
	@sh scripts/project/generateProject.sh
installPod:
	bundle exec pod install

# test
.PHONY: xcodetest
xcodetest:
	xcodebuild \
	-workspace "My Project.xcworkspace" \
	-scheme "My Project" \
	-destination 'platform=iOS Simulator,name=iPhone 14 Pro' \
	-derivedDataPath "build" \
	-enableCodeCoverage YES \
	test \
	| bundle exec xcpretty -s -c

.PHONY: generateCoverage
generateCoverage: 
	bundle exec slather coverage

# delete
.PHONY: delete
delete: 
	rm -rf *.xcodeproj *.xcworkspace Pods/ Carthage/ Build/ Mints/ vendor/

# fastlane
.PHONY: setupCertificate
setupCertificate:
	bundle exec fastlane setup --env debug

.PHONY: runUnitTest
runUnitTest:
	bundle exec fastlane unittest --env debug

.PHONY: exportTestFlight
exportTestFlight:
	bundle exec fastlane export --env staging

.PHONY: open
open:
	xed .
