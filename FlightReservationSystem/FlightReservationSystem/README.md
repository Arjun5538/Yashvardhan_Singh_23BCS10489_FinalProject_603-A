# Flight Reservation System (Java Servlets + JSP + XML)

This is a minimal demo Flight Reservation System designed to run on Apache Tomcat. It uses XML files in `data/` as simple storage (flights and bookings).

Files:
- `src/` : Java servlet source files (package `com.example.frs`).
- `WebContent/` : JSP pages and `WEB-INF/web.xml`.
- `data/` : XML files used as storage.

## Step 1 (required before running)
Install:
1. JDK 11 or newer (for example Eclipse Temurin / Adoptium or Oracle JDK).
2. Apache Tomcat 9 or 10.
3. Visual Studio Code + Extension Pack for Java and "Tomcat for Java" extension (optional but helpful).

Links and detailed steps are provided by the helper when you request Step 1.

## How to build & run (quick)
1. Compile servlets:
   - `javac -d WebContent/WEB-INF/classes -cp "/path/to/tomcat/lib/servlet-api.jar" src/com/example/frs/*.java`
2. Start Tomcat and deploy the `WebContent` folder as a webapp (copy to `webapps/FlightReservationSystem`).
3. Open `http://localhost:8080/FlightReservationSystem/` in your browser.

The helper will give you exact commands for your OS in Step 2.

