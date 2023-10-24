<%-- 
    Document   : Store
    Created on : Oct 23, 2023, 1:07:05 PM
    Author     : Asus
--%>

<%@page import="model.Store"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Store Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/styleadmin.css"/>
        <link href="bootstrap/bootstrap.min.css" rel="stylesheet">
        <style>

            .modal{
                position: fixed;
                z-index: 1;
                top:0;
                left: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0,0,0,0.4);
                background-clip: padding-box;
            }
            .modal-content2{
                text-align: center;
                padding: 40px;
                position: absolute;
                top: 30%;
                left: 35%;
                background-color: #fefefe;
                margin: 2% auto;
                border: 1px solid #888;
                width: 30%;
                width: 480px;
                height: auto;
                border-radius: 4px;
                animation: slideDown 0.5s forwards;
            }
            .btnlogout{
                justify-content: center;
                gap: 20px;
            }
        </style>
    </head>
    <body>
        <h1>Cửa hàng</h1>
        <a href="ListProductServlet" >Back</a>
        <button id="btnThem">Thêm cửa hàng mới</button>
        <%
            List<Store> storeList = (List) request.getAttribute("storeList");

        %>
        <table>
            <thead>
                <tr>
                    <td>Store ID</td>
                    <td>Store Name</td>
                    <td>Open-close Time</td>
                    <td>Store address</td><!-- comment -->
                    <td>Store phone number</td>
                </tr>
            </thead>
            <tbody>

                <c:forEach var="store" items="<%=storeList%>" >
                    <tr>
                        <td> ${store.getStore_id()} </td>
                        <td> ${store.getStore_name()}  </td>
                        <td> ${store.getOcTime()}  </td><!-- comment -->
                        <td> ${store.getAddress()}  </td>
                        <td> ${store.getStore_PhoneNumber()}  </td>
                        <td>

                        </td>
                        <td>
                            <div class="product-button d-flex justify-content-center">
                                <form  accept-charset="UTF-8" action="UpdateStoreServlet" method="GET">

                                    <input type="hidden" name="store_id" value="${store.getStore_id()}">
                                    <button type="button" name="updateButton" value="update" onclick="modaledit.style.display = 'block';

                                            document.getElementById('store_idd').value = ${store.getStore_id()};

                                            document.getElementById('namee').value = '${store.getStore_name().trim()}';

                                            document.getElementById('addresss').value = '${store.getAddress().trim()}';

                                            document.getElementById('phoneNumberr').value = '${store.getStore_PhoneNumber().trim()}';

                                            document.getElementById('timeOcc').value = '${store.getOcTime().trim()}';
                                            "
                                            ><i class="fa-solid fa-wrench"></i></button>
                                </form>
                                <form action="DeleteStoreServlet" method="POST">
                                    <input type="hidden" name="store_id" value="${store.getStore_id()}">
                                    <button class="product-delete btn btn-danger"> <i class="fa-solid fa-trash"></i></button>
                                </form>
                            </div>
                        </td>
                    <tr>

                    </c:forEach>

            </tbody>
        </table>
        <!-- chinh sua thong tin cua hang -->

        <form accept-charset="UTF-8" action="UpdateStoreServlet" method="POST"id="myModaledit" class="modal"  >

            <div class="modal-content" id="modaledit" style="width:30%;">
                <h2 id="header-modaledit">Chỉnh sửa </h2>
                <div  class="container-form">
                    <div id="employeeFormedit">
                        <input type="text" id="store_idd"  name="store_idd" value="${store.getStore_id()}">
                        <div class="form-group">
                            <label for="namee"><i class="fa-solid fa-drumstick-bite"></i></label>
                            <input type="text" id="namee" name="namee" value="${store.getStore_name()}">
                            <span class="sp-thongbao" id="tbName"></span>
                        </div>
                        <div class="form-group">
                            <label for="addresss" ><i class="fa-solid fa-circle-info"></i></label>
                            <input type="text" id="addresss" name="addresss" value="${store.getAddress()}" >
                            <input type="hidden" id="addresss" name="addresss" value="${store.getAddress()}" >
                            <span class="sp-thongbao" id="tbInfor"></span>
                        </div>
                        <div class="form-group">
                            <label for="timeOcc" ><i class="fa-solid fa-money-bill"></i></label>
                            <input type="text" id="timeOcc" name="timeOcc" value="${store.getOcTime()}">
                            <input type="hidden" id="timeOcc" name="timeOcc" value="${store.getOcTime()}">
                            <span class="sp-thongbao" id="tbPrice"></span>
                        </div>

                        <div class="form-group">
                            <label for="phoneNumberr"><i class="fa-solid fa-tag"></i></label>
                            <input type="text" id="phoneNumberr" name="phoneNumberr"value="${store.getStore_PhoneNumber()}">
                            <input type="hidden" id="phoneNumberr" name="phoneNumberr"value="${store.getStore_PhoneNumber()}">
                            <span class="sp-thongbao" id="tbType"></span>
                        </div>


                    </div>
                </div>
                <div class="footer-modal">
                    <button type="submit" style="margin-left: 46.5%;"  value="Sửa món ăn"> Sua mon an</button>
                    <button type="button"class="close-button"onclick="closeForm('myModaledit')">Đóng</button>
                </div>
            </div>
        </form>


        <!--  them cua hang moi -->

        <form id="myModal" class="modal" action="AddStoreServlet" method="GET" enctype="multipart/form-data">
            <div class="modal-content" id="modall" style="width:30%;">
                <h2 id="header-modal">Thêm cửa hàng mới</h2>
                <div  class="container-form">
                    <div id="employeeForm">
                        <div class="form-group">
                            <label for="name"><i class="fa-solid fa-drumstick-bite"></i></label>
                            <input type="text" id="name" name="name" placeholder="Tên cửa hàng" required>
                            <span class="sp-thongbao" id="tbName"></span>
                        </div>

                        <div class="form-group">
                            <label for="address" ><i class="fa-solid fa-circle-info"></i></label>
                            <input type="text" id="address" name="address" placeholder="Địa chỉ" required>
                            <span class="sp-thongbao" id="tbInfor"></span>
                        </div>

                        <div class="form-group">
                            <label for="phoneNumber" ><i class="fa-solid fa-money-bill"></i></label>
                            <input type="text" id="phoneNumber" name="phoneNumber" placeholder="Số điện thoại" required>
                            <span class="sp-thongbao" id="tbPrice"></span>
                        </div>
                        <div class="form-group">
                            <label for="ocTime"><i class="fa-solid fa-clock"></i></label>
                            <input type="text" id="ocTime" name="ocTime" placeholder="Open-Close time" required>
                            <span class="sp-thongbao" id="tbComment"></span>
                        </div>


                    </div>
                </div>
                <div class="footer-modal">
                    <button type="submit" value="Submit!" name="submit" style="margin-left: 46.5%;" class="submit submit-form" id="them">Thêm món ăn</button>
                    <button class="close-button" onclick="closeForm('myModal')">Đóng</button>
                </div>
            </div>
        </form> 

        <script>

            const modal = document.getElementById('myModal');
            const modall = document.getElementById('myModaledit');
            const btn = document.getElementById('btnThem');
            btn.addEventListener('click', () => {
                modal.style.display = 'block';
            });

            window.addEventListener('click', (event) => {
                if (event.target === modal) {
                    modal.style.display = 'none';

                }
            });
            //=================================================
            const modaledit = document.getElementById('myModaledit');

            function closeForm(formId) {
                const form = document.getElementById(formId);
                form.style.display = 'none';
            }

            window.addEventListener('click', (event) => {
                if (event.target === modaledit) {
                    modaledit.style.display = 'none';
                }
            });




            function logout() {
                document.getElementById("myModal12").style.display = "block";
            }
            function no() {
                document.getElementById("myModal12").style.display = "none";
            }
            function yes() {

                window.location.href = "ListProductGuest";
            }



        </script>
    </body>

</html>
