APP_DIRECTORY="$(dirname "$0")/main"
cd "$APP_DIRECTORY" || return
fvm use 3.3.9 --force
echo ""
echo "Do cleaning root project on app first..."
echo ""
fvm flutter clean

echo ""
echo "Re-generating assets..."
echo ""

cd "$(dirname "$0")/manifest" || return
fvm use 3.3.9 --force
fvm flutter pub get
fvm flutter pub run assets:generate
fvm flutter pub run language:generate --source-dir=../resources/lang/ --output-dir=lib/src/string/

echo ""
echo "All tasks are finished"
echo ""