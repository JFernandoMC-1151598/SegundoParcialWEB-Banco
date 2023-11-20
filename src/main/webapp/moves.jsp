<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movimientos</title>
<script src="https://cdn.tailwindcss.com"></script>
<script>
	tailwind.config = {
		theme : {
			extend : {
				colors : {
					clifford : '#da373d',
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
		<h1 class="text-3xl font-semibold text-gray-800 mt-5 mb-8">Todos
			los movimientos</h1>

		<!-- Button for add new user and their background color blue -->
		<table class="min-w-full divide-y divide-gray-200 my-5">
			<thead class="bg-blue-500 text-white">
				<tr>
					<th scope="col"
						class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
						Dia</th>
					<th scope="col"
						class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
						Observation</th>
					<th scope="col"
						class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
						Value</th>
				</tr>
			</thead>
			<tbody class="bg-white divide-y divide-gray-200">

				<c:forEach var="bill" items="${listarMovimientos}">
					<tr class="">
						<td class="px-6 py-4 whitespace-nowrap">
							<div class="text-sm text-gray-900">${bill.date_bill}</div>
						</td>
						<td class="px-6 py-4 whitespace-nowrap">
							<div class="flex items-center">
								<div>
									<div class="text-sm font-medium text-gray-900">
										${bill.observation}</div>
								</div>
							</div>
						</td>
						<td class="px-6 py-4 whitespace-nowrap">
							<div class="text-sm text-gray-900">${bill.value}</div>
						</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="./form.jsp"
			class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
			AGREGAR UN MOVIMIENTO </a>
	</div>

</body>
</html>