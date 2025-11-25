package murach.download;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import murach.business.User;

public class DownloadServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Lấy hành động (action)
        String action = request.getParameter("action");
        if (action == null) {
            action = "viewAlbums"; 
        }

        String url = "/index.jsp";

        // --- LOGIC 1: Xem danh sách Album (Slide 38) ---
        if (action.equals("viewAlbums")) {
            url = "/index.jsp";
        } 
        
        // --- LOGIC 2: Kiểm tra người dùng (Khi bấm vào link Album) ---
        else if (action.equals("checkUser")) {
            String productCode = request.getParameter("productCode");
            HttpSession session = request.getSession();
            
            // Lưu mã sản phẩm để dùng cho trang sau
            session.setAttribute("productCode", productCode);
            
            // Kiểm tra xem đã có User trong session chưa
            User user = (User) session.getAttribute("user");
            
            String urlDirect;
            
            // Nếu chưa đăng nhập (Session null)
            if (user == null) {
                // Kiểm tra Cookie xem trước đây đã đăng ký chưa
                Cookie[] cookies = request.getCookies();
                String emailAddress = null;
                
                if (cookies != null) {
                    for (Cookie c : cookies) {
                        if (c.getName().equals("userEmail")) {
                            emailAddress = c.getValue();
                        }
                    }
                }
                
                // Nếu không tìm thấy Cookie -> Bắt buộc Đăng ký (Slide 39)
                if (emailAddress == null || emailAddress.equals("")) {
                    urlDirect = "/register.jsp";
                } 
                // Nếu tìm thấy Cookie -> Tự động tạo User và cho qua (Slide 40)
                else {
                    user = new User();
                    user.setEmail(emailAddress);
                    session.setAttribute("user", user);
                    urlDirect = "/download.jsp";
                }
            } 
            // Nếu Session đã có User -> Cho qua luôn
            else {
                urlDirect = "/download.jsp";
            }
            
            url = urlDirect;
        }

        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        // --- LOGIC 3: Xử lý form Đăng ký (Slide 39 -> 40) ---
        if (action.equals("register")) {
            String email = request.getParameter("email");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            
            // Tạo User và lưu vào Session
            User user = new User();
            user.setEmail(email);
            user.setFirstName(firstName);
            user.setLastName(lastName);
            
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            // Tạo Cookie để nhớ người dùng cho lần sau (Sống 2 năm)
            Cookie c = new Cookie("userEmail", email);
            c.setMaxAge(60 * 60 * 24 * 365 * 2); 
            c.setPath("/"); 
            response.addCookie(c);
            
            if (firstName == null) firstName = "";
            Cookie c2 = new Cookie("firstNameCookie", firstName);
            c2.setMaxAge(60 * 60 * 24 * 365 * 2);
            c2.setPath("/");
            response.addCookie(c2);
            
            // Chuyển đến trang Download
            String url = "/download.jsp";
            getServletContext().getRequestDispatcher(url).forward(request, response);
        }
    }
}