APP_DIRECTORY="$(dirname "$0")/main"
cd "$APP_DIRECTORY" || return
fvm use 3.3.9 --force
echo ""
echo "Do cleaning root project on app first..."
echo ""
fvm flutter clean

## declare array variables
declare -a features=("manifest" "main")

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
echo "All tasks are finished"
echo ""