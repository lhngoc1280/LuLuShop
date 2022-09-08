<%-- 
    Document   : adminSidebar
    Created on : Jul 9, 2022, 6:40:06 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>
            nav-item > i {
                color: white;
            }
            #accordionSidebar{
                position: relative;
            }
            button {
                color: white;
                width: 50px;
                background-color: rgba(255,255,255,0);
                border: none;
            }
            button.left{
                height: 50px;
                position: absolute;
                left: 170px;
                top: 3px;
                
            }
            button.right{
                left: 170px;
                top: 3px;
                background-color:#5a5c69;
            }
        </style>

    </head>
    <body>
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion"  id="accordionSidebar">
            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="<%=request.getContextPath()%>/views/adminDashboard.jsp">
                    <span>Dashboard</span></a>
            </li>
            
            <!-- Divider -->
            <hr class="sidebar-divider">
            
            <!-- Heading -->
            <div class="sidebar-heading">
                Chart
            </div>
            
            <li class="nav-item ">
                <a class="nav-link collapsed" href="<%=request.getContextPath()%>/views/chart.jsp">
                    <!--<i class="fa fa-solid fa-chart-pie"></i>-->
                    <span>Chart</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Product CRUD
            </div>

            <!-- Nav Item - Add product -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="<%=request.getContextPath()%>/addproduct" >
                    <span>Add product</span>
                </a>
            </li>

            <!-- Nav Item - Update product -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="<%=request.getContextPath()%>/updateproduct" >
                    <span>Update product</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Transaction CRUD
            </div>

            <!-- Nav Item - All transaction -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="<%=request.getContextPath()%>/order" >
                    <span>All transaction</span>
                </a>
            </li>           

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Admin CRUD
            </div>

            <!-- Nav Item - All Admin -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="<%=request.getContextPath()%>/views/viewAdmin.jsp" >
                    <span>All Admin</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="<%=request.getContextPath()%>/views/addAdmin.jsp" >
                    <span>Add Admin</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                User CRUD
            </div>

            <!-- Nav Item - All user -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="<%=request.getContextPath()%>/views/viewUser.jsp" >
                    <span>All User</span>
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
        <button class="left" onclick="display1()"><i class="fa fa-solid fa-angle-left"></i></button>
        <button class="right" onclick="display2()" id="right" style="display: none"><i class="fa fa-solid fa-angle-right"></i></button>

        <!-- End of Sidebar -->

        <script>
            function display1() {
                var navbar = document.getElementById("accordionSidebar");
                navbar.style.display = 'none';
                document.getElementById("right").style.display = 'block';
            }
            
            function display2() {
                var navbar = document.getElementById("accordionSidebar");
                navbar.style.display = 'flex';
                document.getElementById("right").style.display = 'none';
            }
        </script>
    </body>
</html>
