# Dev Notes: Build Clean and Dependency Refresh

When the web preview (or analyzer) appears stuck or shows stale artifacts, do a clean rebuild:

1) Clean build artifacts
   flutter clean

2) Reinstall dependencies
   flutter pub get

3) Run web with HTML renderer (recommended)
   flutter run -d chrome --web-renderer html

Why this helps:
- `flutter clean` removes cached build outputs that can cause hanging at “Building...”
- `flutter pub get` ensures all packages are correctly resolved
- The HTML renderer is generally faster and more predictable in headless/preview environments

Environment variables:
- This app loads `.env` optionally at startup via flutter_dotenv.
- If `.env` is missing, it falls back to defaults:
  - Web: BACKEND_BASE_URL=http://localhost:3001
  - Mobile/desktop: BACKEND_BASE_URL=http://10.0.2.2:3001

Tip:
- If backend runs on a different host/port, create a `.env` file in `flutter_frontend/` with:
  BACKEND_BASE_URL=http://your-host:port
