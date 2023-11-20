<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Consultar Movimiento</title>
<script src="https://cdn.tailwindcss.com"></script>
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
	<script
		src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
</head>
<body>
<div class="container mx-auto">

		<div
			class="flex flex-col items-center justify-center min-h-screen bg-gray-100">
			<h1 class="text-3xl font-semibold text-gray-800 mt-5 mb-8">Ver
				Movimiento</h1>
			<div class="w-full max-w-md">
				<form action="UsuarioServlet"
					class="bg-white shadow-lg rounded px-8 pt-6 pb-8 mb-4"
					method="POST">
					<div class="mb-4">
						<!-- hidden input for id -->
						
						<label
							class="block text-gray-700 font-bold mb-2" for="date">
							Date </label> <input
							class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
							id="date" type="text" name="date"
							value='${bill.date}' />
					</div>
					<div class="mb-4">
						<label
							class="block text-gray-700 font-bold mb-2" for="observation">
							Observation </label> <input
							class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
							id="observation" type="text" name="observation"
							value='${bill.observation}' />
					</div>
					<div class="mb-4">
						<label class="block text-gray-700 font-bold mb-2" for="type">
							Tipo de Movimiento </label> <select id="pais" name="pais"
							class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
							<option>Elige El Movimiento</option>
							<option value="${bill.type}">1</option>
							<option value="${bill.type}">2</option>

						</select>
					</div>

					<div class="mb-4">
						<label class="block text-gray-700 font-bold mb-2" for=value>
							Valor </label> <input
							class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
							id="value" type="text" name="value" value='${bill.value}' />
					</div>



					<div class="flex items-center justify-between">
						<button onclick={window.location.href
							= "moves.jsp"}
                    class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
							type="submit">Regsitrar</button>
							<button onclick={window.location.href
							= "moves.jsp"}
                    class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
							type="submit">Cancelar</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>