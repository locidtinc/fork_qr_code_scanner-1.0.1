ifeq ($(OS),Windows_NT)
    BUILD_CMD=.\build_and_run_app.bat
    METRICS_CMD=.\tools\dart_code_metrics.bat
    COMMIT_CHECK_CMD=.\tools\check_commit_message.bat
else
    BUILD_CMD=./build_and_run_app.sh
    METRICS_CMD=./tools/dart_code_metrics.sh
    COMMIT_CHECK_CMD=./tools/check_commit_message.sh
endif

get:
	flutter clean && flutter pub get

clean:
	flutter clean && flutter pub get && flutter packages pub run build_runner build --delete-conflicting-outputs

check:
	flutter pub deps | grep url_launcher

update:
	cd ios && pod install --repo-update

tree:
	flutter pub deps > dependencies.txt

doctor:
	flutter doctor -v

upgrade:
	flutter pub upgrade
	
clean-cache:
	flutter clean
	rm -rf .dart_tool
	rm -rf .packages
	rm -rf pubspec.lock
	flutter pub get
apk:
	flutter build apk --no-shrink