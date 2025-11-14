#63. Criar um algoritmo que imprima a soma de n primeiros termos da série de fibonacci (2 < n < 40 e, caso não seja, deve ser novamente solicitado).
.data
	n: .asciiz "Digite O Valor De N: "
	total: .asciiz "O Total é :  "
	lembrete: .asciiz "  (Sequência De Fibonacci Lembrando que a sequencia começa a partir de 3)"
	invalido: .asciiz "Valor Inválido, Tente Novamente! "
	somando: .asciiz "Somando o final de cada Sequencia  o total fica: "
	linha: .asciiz "\n"
	espaco: .asciiz " + "
	igual: .asciiz " = "
.text
main:
	li $v0,4 #Imprimir String:
	la $a0,n
	syscall
	
	# N Valor
	li $v0,5 #Ler Inteiro
	syscall 
	move $t0,$v0
	
	li $t1,2
	li $t2,40
	
	verificar_n:
	ble $t0,$t1,valor_invalido #Se Menor Ou Igual A 2, Vá Para Valor Inválido.
	bge $t0,$t2,valor_invalido #Se Maior Ou Igual a 40,vá também para valor inválido.
	j calculo_fibonacci
	
	valor_invalido:
	li $v0,4
	la $a0,invalido
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	j verificar_n
	
	calculo_fibonacci:
	li $t5,0 #Acumulador 0
	li $t3,1 #Acumulador 1
	li $t4,1 #Acumulador 2
	li $t5,0 #Acumulador 3
	li $t6,3 #Contador a partir do 3
	li $t7,1 #Incrementar 1
	li $t8,0 #acumulador de resultados para printar soma
	
	
	add_fibonacci:
	add $t5,$t3,$t4 #1 + 1 = 2
	add $t8,$t5,$t8 #Somar Os Resultados
	
	li $v0,1
	move $a0,$t3
	syscall
	
	li $v0,4
	la $a0,espaco
	syscall
	
	li $v0,1
	move $a0,$t4
	syscall
	
	li $v0,4
	la $a0,igual
	syscall
	
	li $v0,1
	move $a0,$t5
	syscall
	
	li $v0,4
	la $a0,linha
	syscall
	move $t3,$t4 #Trocar 1 por 1 
	move $t4,$t5 #trocar 2 por 1
	
	
	
	bne $t6,$t0,prossiga #Se Contador For Diferente De n, prossiga
	j fim
	
	prossiga:
	add $t6,$t6,$t7
	j add_fibonacci
	
	
	
	fim:
	li $v0,4
	la $a0,total
	syscall
	
	li $v0,1
	move $a0,$t5
	syscall
	
	li $v0,4
	la $a0,lembrete
	syscall
	
	li $v0,4
	la $a0,linha
	syscall
	
	li $v0,4
	la $a0,somando
	syscall
	
	li $v0,1
	move $a0,$t8
	syscall
	
	li $v0,10
	syscall
	
	
	
	
	
	
	
