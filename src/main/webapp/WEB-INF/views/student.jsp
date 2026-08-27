<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c"
           uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Student Portal | Students</title>

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">

</head>


<body class="bg-light">


<nav class="navbar navbar-dark bg-primary">

    <div class="container">

        <span class="navbar-brand fw-bold">
            🎓 Student Portal
        </span>

        <a href="addStudent"
           class="btn btn-light">

            + Add Student

        </a>

    </div>

</nav>


<div class="container mt-5">

    <div class="card shadow border-0">

        <div class="card-header bg-white">

            <h3 class="mb-0">
                Student List
            </h3>

        </div>


        <div class="card-body">


            <div class="table-responsive">

                <table class="table table-hover align-middle">

                    <thead class="table-primary">

                    <tr>

                        <th>ID</th>

                        <th>Name</th>

                        <th>Email</th>

                        <th>Mobile</th>

                        <th>Course</th>

                        <th>Actions</th>

                    </tr>

                    </thead>


                    <tbody>

                    <c:forEach var="student"
                               items="${students}">

                        <tr>

                            <td>
                                    ${student.id}
                            </td>

                            <td>
                                    ${student.name}
                            </td>

                            <td>
                                    ${student.email}
                            </td>

                            <td>
                                    ${student.mobile}
                            </td>

                            <td>
                                    ${student.course}
                            </td>

                            <td>

                                <a href="editStudent?id=${student.id}"
                                   class="btn btn-sm btn-warning">

                                    Edit

                                </a>

                                <a href="deleteStudent?id=${student.id}"
                                   class="btn btn-sm btn-danger">

                                    Delete

                                </a>

                            </td>

                        </tr>

                    </c:forEach>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

</div>


</body>

</html>