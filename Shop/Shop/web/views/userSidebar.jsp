<%-- 
    Document   : userSidebar
    Created on : Jul 11, 2022, 7:36:10 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">
                <!-- Divider -->
                <hr class="sidebar-divider my-0">
                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="<%=request.getContextPath()%>/user">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>User Dashboard</span></a>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">
                <!-- Heading -->
                <div class="sidebar-heading">
                    CRUD
                </div>
                <!-- Nav Item - Add product -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="<%=request.getContextPath()%>/views/delAccount.jsp">
                        <span>Delete Account</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="<%=request.getContextPath()%>/changepass">
                        <span>Change Password</span>
                    </a>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">
                <!-- Heading -->
                <div class="sidebar-heading">
                    Order
                </div>
                <!-- Nav Item - Add product -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="<%=request.getContextPath()%>/order">
                        <span>View Order</span>
                    </a>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">
                <li class="nav-item">
                    <a class="nav-link collapsed" href="<%=request.getContextPath()%>/logout" >
                        <span>Log Out</span>
                    </a>
                </li>
            </ul>
            <!-- End of Sidebar -->
    </body>
</html>
