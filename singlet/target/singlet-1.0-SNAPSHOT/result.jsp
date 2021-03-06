<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Search results</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script
            src="http://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index">Home</a>
                </li>
            </ul>
            <form class="form-inline" action="Search" method="post" name="Search">
                <input class="form-control mr-sm-2" name="searchName" id="searchName" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-light my-2 my-sm-0 mr-sm-2" type="submit">Search</button>
            </form>
        </ul>
    </nav>
    <div class="container">
        <h1>Search results</h1>
        <hr>
        <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <c:if test="${fn:length(studentList) gt 0}">
            <h3>Students</h3>
            <table class="table table-striped">
                <thead class="thead-dark">
                <th>Name</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Email</th>
                </thead>
                <tbody>

                    <c:forEach var="person" items="${studentList}">
                        <tr> 
                            <td>${person.getName()}</td>
                            <td>${person.getAddress()}</td>
                            <td>${person.getPhone()}</td>
                            <td>${person.getEmail()}</td>
                        </tr>
                    </c:forEach> 
                </tbody>
            </table>
        </c:if>
        <c:if test="${fn:length(employeeList) gt 0}">
            <h3>Employees</h3>
            <table class="table table-striped">
                <thead class="thead-dark">
                <th>Name</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Email</th>
                </thead>
                <tbody>
                    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
                    <c:forEach var="person" items="${employeeList}">
                        <tr> 
                            <td>${person.getName()}</td>
                            <td>${person.getAddress()}</td>
                            <td>${person.getPhone()}</td>
                            <td>${person.getEmail()}</td>
                        </tr>
                    </c:forEach> 
                </tbody>
            </table>        
        </c:if>

        <button type="button" class="btn btn-primary" onclick="location.href = 'index'" id="myButton">Home</button>

        <div class="modal fade" id="updatePersonModal" name="updatePersonModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <form action="Update" method="POST">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2 class="upd-modal-title">Create new person</h2>                                
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="nameOld" id="nameOld"  />
                            <input type="hidden" name="statusOld" id="statusOld"/>
                            <div class="form-group">
                                <label for="name" class="col-form-label">Name:</label>
                                <input type="text" class="form-control" id="nameNew" name="nameNew" >
                            </div>
                            <div class="form-group">
                                <label for="address" class="col-form-label">Address:</label>
                                <input class="form-control" id="addressNew" name="addressNew">
                            </div>
                            <div class="form-group">
                                <label for="phone" class="col-form-label">Phone:</label>
                                <input class="form-control" id="phoneNew" name="phoneNew">
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-form-label">E-mail</label>
                                <input class="form-control" id="emailNew" name="emailNew">
                            </div>
                            <div class="form-group">
                                <label for="status" class="col-form-label">Status</label>
                                <select class="form-control" id="statusNew" name="statusNew">
                                    <option>Student</option>
                                    <option>Employee</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <input type="submit" class="btn btn-primary" value="Save" name="update" /><br>
                        </div>
                    </div>
                </form> 
            </div>
        </div>

    </div>

</body>
</html>