<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movimientos</title><script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
          theme: {
            extend: {
              colors: {
                clifford: '#da373d',
              }
            }
          }
        }
        
      </script>
      <style type="text/tailwindcss">
        @layer utilities {
          .content-auto {
            content-visibility: auto;
          }
        }
      </style>
      <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
</head>
<body>
 <div class="container mx-auto">
    <h1 class="text-3xl font-semibold text-gray-800 mt-5 mb-8">Todos los movimientos</h1>
    
    <!-- Button for add new user and their background color blue -->
    <a href="./form.jsp" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
        AGREGAR UN MOVIMIENTO
    </a>
    
    <table class="min-w-full divide-y divide-gray-200 my-5">
        <thead class="bg-blue-500 text-white">
        <tr>
            <th scope="col" class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                Dia
            </th>
            <th scope="col" class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                Observation
            </th>
            <th scope="col" class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                Value
            </th>
            </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
    
        <c:forEach var="bill" items="${listUsuarios}">
            <tr class="">
                <td class="px-6 py-4 whitespace-nowrap">
                    <div class="text-sm text-gray-900">${bill.}</div>
                </td>
                <td class="px-6 py-4 whitespace-nowrap">
                    <div class="flex items-center">
                        <div>
                            <div class="text-sm font-medium text-gray-900">
                                    ${usuario.nombre}
                            </div>
                        </div>
                    </div>
                </td>
                <td class="px-6 py-4 whitespace-nowrap">
                    <div class="text-sm text-gray-900">${usuario.email}</div>
                </td>
                <td class="px-6 py-4 whitespace-nowrap">
                    <div class="text-sm text-gray-900">${usuario.pais}</div>
                </td>
                <td class="px-6 py-4 whitespace-nowrap">
                    <div class="flex items-center space-x-4">
                        <a href="${pageContext.request.contextPath}/edit?id=${usuario.id}" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded text-sm">
                            Update
                        </a>
                        <a onclick="deleteUser(${usuario.id})" href="${pageContext.request.contextPath}/delete?id=${usuario.id}" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded text-sm">
                            Delete
                        </a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    </div>
    
    <script>
    
        function eliminarUsuario(id) {
            if (confirm("Esta seguro de eliminar este usuario?")) {
                window.location.href = "${pageContext.request.contextPath}/delete?id=" + id;
            }
        }
        </script>
</body>
</html>