menu = 0
while(menu != 4) do
	puts "Opción 1: Promedio de notas por alumno"
  puts "Opción 2: Inasistencias totales por alumno"
  puts "Opción 3: Alumnos aprobados"
  puts "Opción 4: Salir"
  puts "Ingrese una opción"
  menu = gets.chomp.to_i
  case menu
	when 1
		f = File.open('alumnos.csv', 'r')
		data = f.readlines
		f.close

		f = File.open("alumnos_nuevo.csv", "w")
		sum = 0
		data.each do |alum|
			alumno = alum.split(", ")
			alumno.each do |alum2|
				sum += alum2.to_f
			end
			prom = sum / (alumno.count - 1)
			p "#{alumno[0]} con un promedio de #{prom}"
			sum = 0
		end
		f.close
	when 2
		f = File.open('alumnos.csv', 'r')
		data = f.readlines

		a1 = "A"
		a2 = "A\n"
		sum = 0
		data.each do |alum|
			alumno = alum.split(", ")
			alumno.each do |alum2|
					if alum2 == a1 || alum2 == a2
						sum += 1
				end
			end
			p "#{alumno[0]} tiene #{sum} inasistencias"
			sum = 0
		end
		f.close
	when 3
		f = File.open('alumnos.csv', 'r')
		data = f.readlines
		
		sum = 0
		data.each do |alum|
			alumno = alum.split(", ")
			alumno.each do |alum2|
				sum += alum2.to_f
			end
			prom = sum / (alumno.count - 1)
			p alumno[0] if prom >= 5
			sum = 0
		end
		f.close
	when 4
	else
		p 'Opción inválida'
	end
end