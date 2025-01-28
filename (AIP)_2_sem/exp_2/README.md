# Session Management in Java (NetBeans)

This project demonstrates session management using **Java Servlets** in **NetBeans**. It includes a frontend form for user login and a backend servlet to handle session creation and expiration.

---

## 1. Prerequisites
Ensure you have the following installed:
- **Java Development Kit (JDK)** (Recommended: JDK 8 or later)
- **Apache Tomcat** (Compatible with your NetBeans version)
- **NetBeans IDE** (Latest version preferred)
- **Jakarta Servlet API** (Already included in Tomcat)

---

## 2. Project Structure
Ensure your project follows this structure:
```
project-folder/
│── src/
│    ├── sessionBackend.java (Servlet for session handling)
│
│── web/
│    ├── index.html (Frontend login page)
│    ├── web.xml (Servlet configuration)
│
│── WEB-INF/
│    ├── lib/ (Required JARs if any)
│
│── pom.xml (For Maven-based projects)
```

---

## 3. Setup & Installation
### Step 1: Configure NetBeans Project
1. Open **NetBeans IDE** and create a **Java Web Project**.
2. Select **Apache Tomcat** as the server.
3. Place your **HTML file** (`index.html`) inside the `web` folder.
4. Place your **Servlet file** (`sessionBackend.java`) inside the `src` folder.

### Step 2: Install Dependencies (If needed only)
If using Maven, add the following to your `pom.xml`:
```xml
<dependencies>
    <dependency>
        <groupId>jakarta.servlet</groupId>
        <artifactId>jakarta.servlet-api</artifactId>
        <version>4.0.3</version>
        <scope>provided</scope>
    </dependency>
</dependencies>
```
![Alt text](./image_&_video/Screenshot%20(16).png)
---

## 4. Frontend Code (`index.html`)
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Session Management</title>
</head>
<body>
    <h1>Session Management Example</h1>
    <form action="sessionBackend" method="post">
        <label>Email:</label><br>
        <input type="email" name="email" required><br><br>
        <label>Password:</label><br>
        <input type="password" name="password" required><br><br>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
```

---

## 5. Backend Code (`sessionBackend.java`)
This servlet handles **session creation, expiration (after 10 seconds), and redirection**.

```java
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;

@WebServlet(urlPatterns = {"/sessionBackend"})
public class sessionBackend extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        session.setMaxInactiveInterval(10); // Session expires after 10 seconds

        try (PrintWriter out = response.getWriter()) {
            String id = session.getId();
            Date startTime = new Date(session.getCreationTime());
            Date lastAccessed = new Date(session.getLastAccessedTime());
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head><title>Session Details</title></head>");
            out.println("<body>");
            
            if (session.isNew()) {
                out.println("<h1>New User Session Created</h1>");
            } else {
                out.println("<h1>Welcome Back!</h1>");
            }
            
            out.println("<h2>Session ID: " + id + "</h2>");
            out.println("<h2>Session Start Time: " + startTime + "</h2>");
            out.println("<h2>Last Accessed Time: " + lastAccessed + "</h2>");
            
            out.println("<h2>You will be redirected to the homepage in 10 seconds.</h2>");
            out.println("<script>setTimeout(() => { window.location.href = 'index.html'; }, 10000);</script>");
            
            out.println("</body></html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
```

---

## 6. Running the Project
### Method 1: Direct Execution in NetBeans
1. Right-click the **project folder** and select **Run**.
2. The **Apache Tomcat** server will start automatically.
3. Open `http://localhost:8080/project-folder/index.html` in your browser.

### Method 2: Deploy Using WAR File
1. Right-click on the project in NetBeans.
2. Select **Clean and Build** to generate a `.war` file.
3. Deploy the `.war` file to **Apache Tomcat’s `webapps/` directory**.

---

## 7. Features Implemented
✅ **Session Creation & Expiration** – The session expires **automatically after 10 seconds**.
✅ **Session ID Tracking** – Displays the **session ID**.
✅ **Automatic Redirect** – Redirects to `index.html` after **10 seconds**.
✅ **Servlet-Based Backend** – Handles **POST requests**.
✅ **NetBeans-Compatible Structure** – Works seamlessly with **Apache Tomcat**.

---

## 8. Conclusion
You have successfully built a **Java Servlet-based session management system**. Users log in via the **frontend HTML form**, and the backend **tracks their session and auto-expires it** after 10 seconds. 🚀

## 8. Click on the image to see video and output demo.

[![Video Title](https://img.youtube.com/vi/ONKsMYVRHuU/0.jpg)](https://www.youtube.com/watch?v=ONKsMYVRHuU)



🔹 **Next Steps:** Add **session tracking for user authentication** and integrate **database storage for login credentials**.

