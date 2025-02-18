<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Management</title>
    <style>
        body {
            /*font-family: Arial, sans-serif;*/
            /*background-color: #f4f4f4;*/
            text-align: center;
            padding: 20px;
            background: aquamarine;
        }

        .container {
            display: flex;
            flex-direction: row;
            background: white;
            padding: 20px;
            border-radius: 5px;
            width: 100vw;
            margin: auto;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        /*.form-container-1 {*/
        /*    display: flex;*/
        /*    flex-direction: column;*/
        /*    border: 1px solid black;*/
        /*    margin: auto;*/
        /*    background: white;*/
        /*    padding: 20px;*/
        /*    border-radius: 5px;*/
        /*}*/
        .form-container-1 {
            display: flex;
            flex-direction: column;
            border: 1px solid black;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            width: max-content;
        }
        form {
            display: flex;
            flex-direction: column;
            /*width: 100px;*/
            /*flex-wrap: wrap; !* Allows wrapping if needed *!*/
            gap: 10px; /* Adds spacing between inputs */
            align-items: center;
        }

        .form-container-2 {
            display: flex;
            flex-direction: column;
            border: 1px solid black;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            width: max-content;
        }

        .form-container-3 {
            display: flex;
            flex-direction: column;
            border: 1px solid black;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            width: max-content;
        }

        input, button {
            width: 100%;
            margin-bottom: 10px;
            padding: 8px;
        }

        button {
            background-color: crimson;
            cursor: pointer;
        }
    </style>
    <%--    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>--%>
    <script>
        function fetchEmployees() {
            window.location.href = "hello-servlet";
        }

        function addEmployee(event) {
            event.preventDefault();
            console.log("add employee called");
            let formData = new FormData(document.getElementById("employeeForm"));
            fetch("hello-servlet", {
                method: "POST",
                body: new URLSearchParams(formData),
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                }
            }).then(response => response.text()).then(data => {
                alert(data)
            })
        }

        function updateEmployee(event) {
            event.preventDefault();
            let formdata = new FormData(event.target);
            fetch("hello-servlet", {
                method: "POST",
                body: new URLSearchParams(formdata),
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                }
            }).then(response => response.text().then(data => alert(data)))
        }

        function deleteEmployee(event) {
            event.preventDefault();
            let formdata = new FormData(event.target);
            fetch("hello-servlet", {
                method: "POST",
                body: new URLSearchParams(formdata),
                headers: {
                    "Content-type": "application/x-www-form-urlencoded"
                }
            }).then(response => response.text()).then(data => {
                alert(data)
            })
        }
    </script>
</head>
<body>


<%--<section class="text-gray-600 body-font">--%>
<%--    <div class="container  mx-auto">--%>
<%--        <div class="flex flex-col">--%>
<%--            <div class="h-1 bg-gray-200 rounded overflow-hidden">--%>
<%--                <div class="w-24 h-full bg-indigo-500"></div>--%>
<%--            </div>--%>
<%--            <div class="flex flex-wrap sm:flex-row flex-col py-6 mb-12">--%>
<%--                <h1 class="sm:w-2/5 text-gray-900 font-medium title-font text-2xl mb-2 sm:mb-0">Space The Final Frontier</h1>--%>
<%--                <p class="sm:w-3/5 leading-relaxed text-base sm:pl-10 pl-0">Street art subway tile salvia four dollar toast bitters selfies quinoa yuccie synth meditation iPhone intelligentsia prism tofu. Viral gochujang bitters dreamcatcher.</p>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="flex flex-wrap sm:-m-4 -mx-4 -mb-10 -mt-4">--%>
<%--            <div class="p-4 md:w-1/3 sm:mb-0 mb-6">--%>
<%--                <div class="rounded-lg h-64 overflow-hidden">--%>
<%--                    <img alt="content" class="object-cover object-center h-full w-full" src="https://dummyimage.com/1203x503">--%>
<%--                </div>--%>
<%--                <h2 class="text-xl font-medium title-font text-gray-900 mt-5">Shooting Stars</h2>--%>
<%--                <p class="text-base leading-relaxed mt-2">Swag shoivdigoitch literally meditation subway tile tumblr cold-pressed. Gastropub street art beard dreamcatcher neutra, ethical XOXO lumbersexual.</p>--%>
<%--                <a class="text-indigo-500 inline-flex items-center mt-3">Learn More--%>
<%--                    <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-2" viewBox="0 0 24 24">--%>
<%--                        <path d="M5 12h14M12 5l7 7-7 7"></path>--%>
<%--                    </svg>--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            <div class="p-4 md:w-1/3 sm:mb-0 mb-6">--%>
<%--                <div class="rounded-lg h-64 overflow-hidden">--%>
<%--                    <img alt="content" class="object-cover object-center h-full w-full" src="https://dummyimage.com/1204x504">--%>
<%--                </div>--%>
<%--                <h2 class="text-xl font-medium title-font text-gray-900 mt-5">The Catalyzer</h2>--%>
<%--                <p class="text-base leading-relaxed mt-2">Swag shoivdigoitch literally meditation subway tile tumblr cold-pressed. Gastropub street art beard dreamcatcher neutra, ethical XOXO lumbersexual.</p>--%>
<%--                <a class="text-indigo-500 inline-flex items-center mt-3">Learn More--%>
<%--                    <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-2" viewBox="0 0 24 24">--%>
<%--                        <path d="M5 12h14M12 5l7 7-7 7"></path>--%>
<%--                    </svg>--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            <div class="p-4 md:w-1/3 sm:mb-0 mb-6">--%>
<%--                <div class="rounded-lg h-64 overflow-hidden">--%>
<%--                    <img alt="content" class="object-cover object-center h-full w-full" src="https://dummyimage.com/1205x505">--%>
<%--                </div>--%>
<%--                <h2 class="text-xl font-medium title-font text-gray-900 mt-5">The 400 Blows</h2>--%>
<%--                <p class="text-base leading-relaxed mt-2">Swag shoivdigoitch literally meditation subway tile tumblr cold-pressed. Gastropub street art beard dreamcatcher neutra, ethical XOXO lumbersexual.</p>--%>
<%--                <a class="text-indigo-500 inline-flex items-center mt-3">Learn More--%>
<%--                    <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-2" viewBox="0 0 24 24">--%>
<%--                        <path d="M5 12h14M12 5l7 7-7 7"></path>--%>
<%--                    </svg>--%>
<%--                </a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>


<div class="container">
    <div class="form-container-1">
    <h2>Employee Management</h2>


        <form id="employeeForm" onsubmit="addEmployee(event)">
            <input type="text" value="addEmployee" name="action" hidden/>
            <input type="text" name="name" placeholder="Employee Name" required>
            <input type="text" name="department" placeholder="Department" required>
            <input type="number" name="salary" placeholder="Salary" required>
            <button type="submit">Add Employee</button>
            <button onclick="fetchEmployees()">Fetch All Employees</button>

        </form>
    </div>
    <hr>


    <div class="form-container-2">
        <form id="updateForm" onsubmit="updateEmployee(event)">
            <h2>Enter details which you want to update: </h2>
            <input type="text" name="action" value="updateEmployee" hidden>
            <input type="number" name="id" placeholder="Employee id" required>
            <input type="text" name="name" placeholder="Employee Name" required>
            <input type="text" name="department" placeholder="Department" required>
            <input type="number" name="salary" placeholder="Salary" required>
            <button type="submit">Update Employee</button>
        </form>
    </div>
    <hr>
    <div class="form-container-3">
        <form id="deleteForm" onsubmit="deleteEmployee(event)">
            <h2>Enter the id of the employee  </br> which you want to delete: </h2>
            <input type="text" name="action" value="deleteEmployee" hidden>
            <input type="number" placeholder="Enter employee id" name="employeeId" required>
            <button type="submit">Delete Employee</button>
        </form>
    </div>

</div>

</body>
</html>
