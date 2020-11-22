package controller;

import model.TheMuonSach;
import service.hoc_sinh.HocSinhService;
import service.hoc_sinh.HocSinhServiceImpl;
import service.sach.SachService;
import service.sach.SachServiceImpl;
import service.the_muon_sach.TheMuonSachService;
import service.the_muon_sach.TheMuonSachServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Servlet", urlPatterns = {"/books",""})
public class Servlet extends HttpServlet {
    SachService sachService = new SachServiceImpl();
    HocSinhService hocSinhService = new HocSinhServiceImpl();
    TheMuonSachService theMuonSachService = new TheMuonSachServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "muon":
                muonSach(request, response);
                break;
            case "tra":
                traSach(request, response);
                break;
            default:
                break;
        }
    }

    private void traSach(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");

        theMuonSachService.delete(id);

        selectAllMuonSachSach(request, response);
    }

    private void muonSach(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        int sachId = Integer.parseInt(request.getParameter("sachId"));
        int hocSinhId = Integer.parseInt(request.getParameter("hocSinhId"));
        boolean trangThai = true;
        String ngayMuon = request.getParameter("ngayMuon");
        String ngayTra = request.getParameter("ngayTra");

        TheMuonSach theMuonSach = new TheMuonSach(id, sachId, hocSinhId, trangThai, ngayMuon, ngayTra);

        theMuonSachService.add(theMuonSach);

        selectAllSach(request, response);
    }

    private void selectAllMuonSachSach(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("sachList", sachService.selectAllSach());
        request.setAttribute("hocSinhList", hocSinhService.selectAllHocSinh());
        request.setAttribute("theMuonSachList", theMuonSachService.selectAllTheMuonSach());

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("book/list_muon_sach.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "muon":
                muonSachJSP(request, response);
                selectAllSach(request, response);
            break;
            case "listMuonSach":
                selectAllMuonSachSach(request, response);
                break;
            default:
                selectAllSach(request, response);
                break;
        }
    }

    private void muonSachJSP(HttpServletRequest request, HttpServletResponse response) {
        String tenSach = request.getParameter("tenSach");
        String idSach = request.getParameter("idSach");
        int soLuong = Integer.parseInt(request.getParameter("soLuong"));
        request.setAttribute("tenSach", tenSach);
        request.setAttribute("idSach", idSach);
        request.setAttribute("hocSinhList", hocSinhService.selectAllHocSinh());
        if (soLuong == 0 ) {
            request.setAttribute("error","Lỗi: Cuốn sách này đã cho mượn hết");
            selectAllSach(request, response);
        } else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("book/muon.jsp");

            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }


    }

    private void selectAllSach(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("sachList", sachService.selectAllSach());
        request.setAttribute("hocSinhList", hocSinhService.selectAllHocSinh());
        request.setAttribute("theMuonSachList", theMuonSachService.selectAllTheMuonSach());

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("book/list.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
