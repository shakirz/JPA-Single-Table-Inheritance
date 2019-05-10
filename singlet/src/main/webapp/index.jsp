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
        <h1>Person list</h1>
        <hr>
        <h3>Students</h3>
        <table class="table table-striped">
            <thead class="thead-dark">
            <th>Name</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Email</th>
            <th></th>
            <th></th>
            </thead>
            <tbody>
                <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
                <c:forEach var="person" items="${studentList}">
                    <tr> 
                        <td>${person.getName()}</td>
                        <td>${person.getAddress()}</td>
                        <td>${person.getPhone()}</td>
                        <td>${person.getEmail()}</td>
                        <td>
                            <form action="DeletePerson" method="post" name="Delete">
                                <input type="hidden" name="nameDel" value="${person.getName()}" />
                                <input type="hidden" name="statusDel" value="Student" />
                                <button type="submit" name="deleteStudent" class="btn btn-danger">Delete</button>                         
                            </form>    
                        </td>   
                        <td>
                            <button type="button" updButton class="btn btn-success" data-toggle="modal" data-target="#updatePersonModal" 
                                    data-oldname="${person.getName()}" data-oldaddress="${person.getAddress()}" data-oldphone="${person.getPhone()}" 
                                    data-oldemail="${person.getEmail()}" data-oldstatus="Student">Edit</button>
                        </td>  
                    </tr>
                </c:forEach> 
            </tbody>
        </table>
        <h3>Employees</h3>
        <table class="table table-striped">
            <thead class="thead-dark">
            <th>Name</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Email</th>
            <th></th>
            <th></th>
            </thead>
            <tbody>
                <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
                <c:forEach var="person" items="${employeeList}">
                    <tr> 
                        <td>${person.getName()}</td>
                        <td>${person.getAddress()}</td>
                        <td>${person.getPhone()}</td>
                        <td>${person.getEmail()}</td>
                        <td>
                            <form action="DeletePerson" method="post" name="Delete">
                                <input type="hidden" name="nameDel" value="${person.getName()}" />
                                <input type="hidden" name="statusDel" value="Employee" />
                                <button type="submit" name="deleteEmployee" class="btn btn-danger">Delete</button>                         
                            </form>    
                        </td>   
                        <td>
                            <button type="button" updButton class="btn btn-success" data-toggle="modal" data-target="#updatePersonModal" 
                                    data-oldname="${person.getName()}" data-oldaddress="${person.getAddress()}" data-oldphone="${person.getPhone()}" 
                                    data-oldemail="${person.getEmail()}" data-oldstatus="Employee">Edit</button>
                        </td>  
                    </tr>
                </c:forEach> 
            </tbody>
        </table>        

        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createPerson">Create person</button>


        <div class="modal fade" id="createPerson" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <form action="Create" method="POST">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2 class="modal-title">Create new person</h2>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <label for="name" class="col-form-label">Name:</label>
                                <input type="text" class="form-control" id="name" name="name">
                            </div>
                            <div class="form-group">
                                <label for="address" class="col-form-label">Address:</label>
                                <input class="form-control" id="address" name="address">
                            </div>
                            <div class="form-group">
                                <label for="phone" class="col-form-label">Phone:</label>
                                <input class="form-control" id="phone" name="phone">
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-form-label">E-mail</label>
                                <input class="form-control" id="email" name="email">
                            </div>
                            <div class="form-group">
                                <label for="status" class="col-form-label">Status</label>
                                <select class="form-control" id="status" name="status">
                                    <option>Student</option>
                                    <option>Employee</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <input type="submit" class="btn btn-primary" value="Create" name="add" /><br>
                        </div>
                    </div>
                </form> 
            </div>
        </div>

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

    <script>
        $(document).ready(function () {
            $('#updatePersonModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget) // Button that triggered the modal
                var oldname = button.data('oldname')
                var oldaddress = button.data('oldaddress')
                var oldphone = button.data('oldphone')
                var oldemail = button.data('oldemail')
                var oldstatus = button.data('oldstatus')

                var modal = $(this)
                modal.find('.upd-modal-title').text('Update person ' + oldname)
                modal.find('.modal-body #nameNew').val(oldname)
                modal.find('.modal-body #addressNew').val(oldaddress)
                modal.find('.modal-body #phoneNew').val(oldphone)
                modal.find('.modal-body #emailNew').val(oldemail)
                modal.find('.modal-body #statusNew').val(oldstatus)
                modal.find('.modal-body #nameOld').val(oldname)
                modal.find('.modal-body #statusOld').val(oldstatus)
            })
        });
    </script>


</script>
</body>
</html>