package org.example.assignment1.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lombok.SneakyThrows;
import org.apache.commons.beanutils.BeanUtils;
import org.example.assignment1.entity.Ban;
import org.example.assignment1.repository.BanDAO;

import java.io.IOException;

@WebServlet(name = "BanController", value = {
        "/ban/hien-thi",
        "/ban/add",
        "/ban/update",
        "/ban/delete",
        "/ban/get-one"
})
public class BanController extends HttpServlet {

    private final BanDAO banDAO = new BanDAO();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        if (path.equals("/ban/hien-thi")) {
            request.setAttribute("listBan", banDAO.getAllBan());
            request.getRequestDispatcher("/ban/hien-thi.jsp").forward(request, response);
        } else if (path.equals("/ban/get-one")) {
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("ban", banDAO.getBan(id));
            request.getRequestDispatcher("/ban/update.jsp").forward(request, response);
        } else if (path.equals("/ban/delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            banDAO.deleteBan(id);
            response.sendRedirect("/ban/hien-thi");
        }
    }

    @Override
    @SneakyThrows
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        if (path.equals("/ban/add")) {
            Ban ban = new Ban();
            BeanUtils.populate(ban, request.getParameterMap());
            banDAO.addBan(ban);
            response.sendRedirect("/ban/hien-thi");
        } else if (path.equals("/ban/update")) {
            Ban ban = new Ban();
            BeanUtils.populate(ban, request.getParameterMap());
            banDAO.updateBan(ban);
            response.sendRedirect("/ban/hien-thi");
        }
    }

}