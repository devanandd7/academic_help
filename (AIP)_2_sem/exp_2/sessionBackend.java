

 import java.io.IOException;
 import java.io.PrintWriter;
 import jakarta.servlet.ServletException;
 import jakarta.servlet.annotation.WebServlet;
 import jakarta.servlet.http.HttpServlet;
 import jakarta.servlet.http.HttpServletRequest;
 import jakarta.servlet.http.HttpServletResponse;
 import java.util.Date;
 import jakarta.servlet.http.HttpSession;
 import java.text.SimpleDateFormat;
 

  
  
 @WebServlet(urlPatterns = {"/sessionBackend"}) //{ /sessionBackend } edit here according you file name.
 public class sessionBackend extends HttpServlet {
 
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
 
         HttpSession session = request.getSession(true);
 
 //  here is code for autometic expire session after 10 sec
         session.setMaxInactiveInterval(10);
 
 // PrintWriter out = response.getWriter();
         String id = session.getId();
         Date StartTime = new Date(session.getCreationTime());
         Date EndTime = new Date(session.getLastAccessedTime());
 
         try (PrintWriter out = response.getWriter()) {
             /* TODO output your page here. You may use following sample code. */
             out.println("<!DOCTYPE html>");
             out.println("<html>");
             out.println("<head>");
             out.println("<title>Servlet sessionBackend</title>");
             out.println("</head>");
             out.println("<body>");
             out.println("<h1>Servlet sessionBackend at " + request.getContextPath() + "</h1>");
 
             out.println("<html><body>");
             if (session.isNew()) {
                 out.println("<h1>New User found.</h1>");
             } else {
                 out.println("<h1>Welcome back</h1>");
             }
             out.println("<h1> id = " + id + "</h1>");
             out.println("<h1> start = " + StartTime + "</h1>");
             out.println("<h1>end = " + EndTime + "</h1>");
 
 //            here is code for autometic re-directed to the home page
             out.println("<h1>after 10 sec you re-directed to home page </h1>");
 
             out.println("<script>");
             out.println("setTimeout(function() {");
             out.println("   window.location.href = 'index.html';"); // Redirect to home page
             out.println("}, 10000);"); // 10000 milliseconds = 10 seconds
             out.println("</script>");
 
             out.println("<form action='logout' method='post'>");
             out.println("<button type='submit'>Logout</button>");
             out.println("</body>");
             out.println("</html>");
         }
     }
 
     @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {
         processRequest(request, response);
     }
 
    
     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {
         processRequest(request, response);
     }
 
   
     @Override
     public String getServletInfo() {
         return "Short description";
     }// </editor-fold>
 
 }
 