# Healthcare Flutter Frontend

A minimalist Flutter application following the "Ocean Professional" theme. It integrates with the FastAPI backend to provide authentication, patient/doctor/consultation management, and medical records.

## Setup and env configuration

1. Ensure Flutter SDK is installed and set up.
2. Copy `.env.example` to `.env` and adjust values as needed:
   - `API_BASE_URL` (e.g., http://localhost:3001)
   - `API_TIMEOUT_MS` (default 10000)
   - `THEME_NAME` (Ocean Professional)
3. Dependencies are declared in `pubspec.yaml`. Run:
   - `flutter pub get`

## Theme and design guidelines

- Theme: Ocean Professional
  - Primary: #374151
  - Secondary: #9CA3AF
  - Success: #10B981
  - Error: #EF4444
  - Surface: #F9FAFB
  - Text: #111827
- Minimalist layout with generous whitespace and clean typography.
- Card components for lists and content groupings.

## Navigation and state management

- Bottom navigation tabs:
  - Dashboard
  - Consult
  - Records
  - Profile
- Route guard:
  - Unauthenticated users see Login/Register flow.
  - Authenticated users see the bottom-tab main app.
- State management: `provider`
  - `AuthProvider` handles login, register, token storage/refresh, and logout.
  - `DoctorProvider`, `PatientProvider`, `ConsultationProvider`, `RecordsProvider` handle corresponding entities.

## API integration and endpoints used

The app consumes the FastAPI backend with endpoints (examples):
- Auth:
  - `POST /auth/login` (x-www-form-urlencoded)
  - `POST /auth/register` (JSON)
  - `POST /auth/refresh` (JSON)
  - `GET /auth/whoami`
- Users:
  - `PATCH /users/me`
- Patients:
  - `GET /patients/me`
  - `GET /patients`
- Doctors:
  - `GET /doctors`
- Consultations:
  - `GET /consultations`
  - `POST /consultations`
- Medical Records:
  - `GET /medical-records`
  - `POST /medical-records`

The API client:
- Injects base URL and timeouts from `.env` (via `flutter_dotenv`).
- Adds `Authorization: Bearer <access_token>` header when present.
- On `401` responses, it tries to refresh tokens once, then retries the original request.
- Normalizes errors via `ApiException`.

## Running the app

- On web:
  - `flutter run -d chrome`
- On Android emulator:
  - `flutter run -d emulator-5554` (device id may vary)
- On iOS simulator:
  - `flutter run -d ios`
  
Ensure `.env` is present. The app reads it at startup; missing `.env` will fallback to default values suitable for local development.

