echo ""
echo "Re-generating native splash..."
echo ""

fvm use 3.3.8 --force
cd "$(dirname "$0")/main" || return
fvm flutter pub get
fvm flutter pub run flutter_native_splash:create

echo ""
echo "All tasks are finished"