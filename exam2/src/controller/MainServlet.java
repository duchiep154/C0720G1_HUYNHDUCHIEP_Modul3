package controller;

import bo.benhan.BenhAnBO;
import bo.benhan.BenhAnBOImpl;
import bo.benhnhan.BenhNhanBO;
import bo.benhnhan.BenhNhanBOImpl;
import model.BenhAn;
import model.BenhNhan;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "MainServlet",urlPatterns = "/home")
public class MainServlet extends HttpServlet {
    BenhAnBO benhAnBO=new BenhAnBOImpl();
    BenhNhanBO benhNhanBO=new BenhNhanBOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {

            case "edit":
                edit(request, response);
                break;

        }

    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        String maBenhAn = request.getParameter("maBenhAn");
        System.out.println(maBenhAn);
        String maBenhNhan = request.getParameter("maBenhNhan");
        String ngayNhapVien = request.getParameter("ngayNhapVien");
        String ngayRaVien = request.getParameter("ngayRaVien");
        String lydo = request.getParameter("lyDo");
        String phuongPhapTri = request.getParameter("phuongPhapTri");
        String bacsi = request.getParameter("bacSi");
        BenhAn benhAn = new BenhAn(maBenhAn, maBenhNhan,ngayNhapVien,ngayRaVien,lydo,phuongPhapTri,bacsi);
        String message = null;

        message = benhAnBO.editBenhAn(benhAn);
        RequestDispatcher dispatcher = request.getRequestDispatcher("edit.jsp");
        request.setAttribute("messageComplete", message);
        listBenhAn(request, response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {

            case "showEdit":
                showEditForm(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "detail":
                showDetail(request,response);
            default:
                listBenhAn(request, response);
                break;
        }

    }

    private void listBenhAn(HttpServletRequest request, HttpServletResponse response) {
        List<BenhAn> benhAnList = benhAnBO.getALLBenhAn();
        request.setAttribute("benhAnList", benhAnList);
        List<BenhNhan> benhNhanList=benhNhanBO.getALLBenhNhan();
        request.setAttribute("benhNhanList",benhNhanList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showDetail(HttpServletRequest request, HttpServletResponse response) {
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        try {
            String maBenhAn=request.getParameter("maBenhAn");
            this.benhAnBO.deleteBenhAn(maBenhAn);
            listBenhAn(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        String maBenhAn=request.getParameter("maBenhAn");
        BenhAn benhAn = null;
        try {
            benhAn =benhAnBO.findByID(maBenhAn);
            request.setAttribute("benhAn", benhAn);
            List<BenhNhan> benhNhanList =benhNhanBO.getALLBenhNhan();
            request.setAttribute("benhNhanList", benhNhanList);

            RequestDispatcher dispatcher = request.getRequestDispatcher("edit.jsp");
            dispatcher.forward(request, response);

        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
