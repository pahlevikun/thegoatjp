APP_DIRECTORY="$(dirname "$0")/main"
cd "$APP_DIRECTORY" || return
fvm use 3.3.9 --force
echo ""
echo "Do cleaning root project on app first..."
echo ""
fvm flutter clean

## declare array variables
declare -a generator=("assets" "language")
declare -a features=("manifest" "main")

echo ""
echo "Build generator modules..."
echo ""

for item in "${generator[@]}"; do
  DIRECTORY="$(dirname "$0")/generator/$item"
  echo "$DIRECTORY"
  cd "$DIRECTORY"
  dart pub get
done

echo ""
echo "Build and generate files on feature modules..."
echo ""

for item in "${features[@]}"; do
  DIRECTORY="$(dirname "$0")/$item"
  cd "$DIRECTORY" || return
  echo "$DIRECTORY"
  fvm flutter pub get
  fvm flutter pub run build_runner build --delete-conflicting-outputs
done

echo ""
echo "Re-generating assets..."
echo ""

cd "$(dirname "$0")/manifest" || return
fvm use 3.3.9 --force
fvm flutter pub run assets:generate
fvm flutter pub run language:generate --source-dir=../resources/lang/ --output-dir=lib/src/string/

echo ""
echo "All tasks are finished"
echo ""