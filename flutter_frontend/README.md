# Flutter Frontend (Healthcare)

Responsive Flutter app for the Healthcare Management System.

Quick start (Web preview with HTML renderer)
- Clean and fetch packages:
  - flutter clean
  - flutter pub get
- Run on Chrome with HTML renderer (recommended for CI/web preview):
  - flutter run -d chrome --web-renderer html

Environment configuration
- The app uses flutter_dotenv to optionally load a .env file at startup.
- If .env is missing or variables are not set, sensible defaults are used.
- Default backend for web builds: http://localhost:3001
- Mobile/desktop default: http://10.0.2.2:3001 (Android emulator loopback)

Optional .env example
- Create flutter_frontend/.env:
  BACKEND_BASE_URL=http://localhost:3001

Notes
- runApp(MyApp()) is called exactly once in lib/main.dart after a quick, optional dotenv load to avoid blocking UI.
- The UI is compatible with the HTML renderer and does not rely on CanvasKit-specific APIs.
- We avoid unstable Flutter APIs; if you encounter analyzer issues, run `flutter clean` and re-fetch dependencies.

More developer tips are in tool/dev_notes.md.
