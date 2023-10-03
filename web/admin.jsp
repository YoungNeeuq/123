<%-- 
    Document   : list
    Created on : Jun 1, 2023, 10:26:42 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Dish Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/styleadmin.css"/>
        <link href="bootstrap/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <h1>Danh sách món ăn</h1>

        <a href="ListProductServlet">List Product</a> 
        <button id="btnThem"> Add Product</button>
        <c:if test="${admin != null}">
        </c:if>




        <div class="container">
            <div class="row">
                <c:forEach var="dish" items="${list}" >
                    <div class="product col-md-3 mx-3 mb-4">

                        <img><img src="img/${dish.getImage()}" alt="alt" style="
                                  height: 260px; "/> 
                        <div class="product-name-price">
                            <h3 class="product-name">${dish.getName()}</h3>
                            <p class="product-price">${dish.getPrice()}</p>
                        </div>

                        <p class="product-info">${dish.getInfor()}</p>

                        <div class="product-button d-flex justify-content-center">
                            <form  action="updateServlet" method="GET">
                                <input type="hidden" name="dish_id" value="${dish.getDish_id()}">
                                <button type="button" name="updateButton" value="update" onclick="modaledit.style.display = 'block';

                                        document.getElementById('dish_idd').value = ${dish.getDish_id()};

                                        document.getElementById('namee').value = '${dish.getName().trim()}';

                                        document.getElementById('inforr').value = '${dish.getInfor().trim()}';

                                        document.getElementById('pricee').value = '${dish.getPrice()}';

                                        document.getElementById('typeOfDishh').value = '${dish.getTypeOfDish().trim()}';

                                        document.getElementById('imagee').value = '${dish.getImage().trim()}';

                                        "
                                        ><i class="fa-solid fa-wrench"></i></button>
                            </form>
                            <form action="deleteServlet" method="POST">
                                <input type="hidden" name="dish_id" value="${dish.getDish_id()}">
                                <button class="product-delete btn btn-danger"> <i class="fa-solid fa-trash"></i></button>
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>


        <form id="myModal" class="modal" action="addServlet" method="POST" enctype="multipart/form-data">
            <div class="modal-content" id="modall" style="width:30%;">
                <h2 id="header-modal">Thêm món ăn mới</h2>
                <div  class="container-form">
                    <div id="employeeForm">
                        <div class="form-group">
                            <label for="name"><i class="fa-solid fa-drumstick-bite"></i></label>
                            <input type="text" id="name" name="name" placeholder="Tên món ăn" required>
                            <span class="sp-thongbao" id="tbName"></span>
                        </div>

                        <div class="form-group">
                            <label for="infor" ><i class="fa-solid fa-circle-info"></i></label>
                            <input type="text" id="infor" name="infor" placeholder="Mô tả món ăn" required>
                            <span class="sp-thongbao" id="tbInfor"></span>
                        </div>

                        <div class="form-group">
                            <label for="price" ><i class="fa-solid fa-money-bill"></i></label>
                            <input type="number" id="price" name="price" placeholder="Giá" required>
                            <span class="sp-thongbao" id="tbPrice"></span>
                        </div>
                        <div class="form-group">

                            <input type="hidden" id="comment" name="comment" placeholder="Comment" required>
                            <span class="sp-thongbao" id="tbComment"></span>
                        </div>
                        <div class="form-group">
                            <label for="typeOfDish"><i class="fa-solid fa-tag"></i></label>
                            <input type="text" id="typeOfDish" name="typeOfDish" placeholder="Phân loại ( Combo : c , Món lẻ : d )" required>
                            <span class="sp-thongbao" id="tbType"></span>
                        </div>

                        <div class="form-group">
                            <label for="image"><i class="fa-solid fa-image"></i></label>
                            <input type="file" id="image" name="image" accept="img/*" placeholder="Tải ảnh lên" required><br>
                            <span class="sp-thongbao" id="tbSalary"></span>
                        </div>
                    </div>
                </div>
                <div class="footer-modal">
                    <button type="submit" value="Submit!" name="submit" style="margin-left: 46.5%;" class="submit submit-form" id="them">Thêm món ăn</button>
                    <button class="close-button" onclick="closeForm('myModal')">Đóng</button>
                </div>
            </div>
        </form> 


        <form action="updateServlet" method="POST"id="myModaledit" class="modal"  enctype="multipart/form-data">

            <div class="modal-content" id="modaledit" style="width:30%;">
                <h2 id="header-modaledit">Chỉnh sửa món ăn</h2>
                <div  class="container-form">
                    <div id="employeeFormedit">
                        <input type="hidden" id="dish_idd"  name="dish_idd" value="${dish.getDish_id()}">
                        <div class="form-group">
                            <label for="namee"><i class="fa-solid fa-drumstick-bite"></i></label>

                            <input type="text" id="namee" name="namee" value="${dish.getName()}">
                            <span class="sp-thongbao" id="tbName"></span>
                        </div>
                        <div class="form-group">
                            <label for="inforr" ><i class="fa-solid fa-circle-info"></i></label>
                            <input type="text" id="inforr" name="inforr" value="${dish.getInfor()}" >
                            <input type="hidden" id="inforr" name="inforr" value="${dish.getInfor()}" >
                            <span class="sp-thongbao" id="tbInfor"></span>
                        </div>
                        <div class="form-group">
                            <label for="pricee" ><i class="fa-solid fa-money-bill"></i></label>
                            <input type="number" id="pricee" name="pricee" value="${dish.getPrice()}">
                            <input type="hidden" id="pricee" name="pricee" value="${dish.getPrice()}">
                            <span class="sp-thongbao" id="tbPrice"></span>
                        </div>

                        <div class="form-group">
                            <label for="typeOfDishh"><i class="fa-solid fa-tag"></i></label>
                            <input type="text" id="typeOfDishh" name="typeOfDishh"value="${dish.getTypeOfDish()}">
                            <input type="hidden" id="typeOfDishh" name="typeOfDishh"value="${dish.getTypeOfDish()}">
                            <span class="sp-thongbao" id="tbType"></span>
                        </div>
                                    
                        <div class="form-group">
                            <label for="imagee"><i class="fa-solid fa-image"></i></label>                       
                            <input type="file" id="fileInput" name="fileInput" value="${dish.getImage()}" style="display: none;">
                            <input type="text" id="imagee" name="imagee" value="${dish.getImage()}">
                            <button type="button" onclick="selectFile()">Chọn tệp</button>
                            <span class="sp-thongbao" id="tbImage"></span>
                        </div>
                        <input  type="hidden" value="${dish.getComment()} "id="commentt" name="commentt" >
                    </div>
                </div>
                <div class="footer-modal">
                    <input type="submit" style="margin-left: 46.5%;" name="submit" value="Sửa món ăn">
                    <button type="button"class="close-button"onclick="closeForm('myModaledit')">Đóng</button>
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


            function selectFile() {
                // Khi người dùng nhấn nút "Chọn tệp", kích hoạt sự kiện của trường nhập tệp ẩn
                document.getElementById('fileInput').click();
            }

            document.getElementById('fileInput').addEventListener('change', function () {
                var fileInput = document.getElementById('fileInput');
                var imageInput = document.getElementById('imagee');
                var dishImage = "${dish.getImage()}";

                if (fileInput.files.length > 0) {
                    // Nếu có tệp được chọn, gửi yêu cầu đến servlet để thực hiện upload
                    imageInput.value = fileInput.files[0].name;
                    var formData = new FormData();
                    formData.append("fileInput", fileInput.files[0]);

                    // Sử dụng XMLHttpRequest hoặc fetch API để gửi yêu cầu POST đến servlet
                    // Ví dụ sử dụng XMLHttpRequest:
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "updateServlet", true);
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            // Xử lý phản hồi từ servlet (nếu cần)
                        }
                    };
                    xhr.send(formData);
                } else {
                    // Nếu không có tệp nào được chọn, sử dụng giá trị mặc định (tên ảnh cũ)
                    imageInput.value = dishImage;
                }
            });




        </script>
    </script>
</body>
</html>