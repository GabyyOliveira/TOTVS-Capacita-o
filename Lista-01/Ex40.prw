#INCLUDE 'TOTVS.CH'

User Function Ex40()
	Local nSalarioBruto := 0
	Local nValorHora , nQtdHoras
	Local nSalarioLiquido := 0
	Local nTotalDescontos :=0
	Local nIR := 0
	Local cIR := ''
	Local nINSS := 0
	Local nFGTS := 0
	Local cExibe := ''

	//recebendo valores
	nQtdHoras := val(FwInputBox('Informe a quantidade de horas de trabalho, por mes: ', ''))
	nValorHora := val(FwInputBox('Informe quanto voce ganha por hora: ', ''))

	//calculando salario Bruto
	nSalarioBruto := (nValorHora * nQtdHoras)

	// verificando procentagem do desconto e calculando valor IR
	do Case
	case nSalarioBruto <= 1200
		nIR := 0
		cIR := 'isento'
	case nSalarioBruto <= 1800
		nIR := nSalarioBruto * 0.05
		cIR := '5%'
	case nSalarioBruto <= 2500
		nIR := nSalarioBruto * 0.10
		cIR := '10%'
	case nSalarioBruto > 2500
		nIR := nSalarioBruto * 0.20
		cIR := '20%'
	endCase

	//calculando valor INSS
	nINSS := nSalarioBruto * 0.10

	//calculando o FGTS
	nFGTS := nSalarioBruto * 0.11

	//calculando total descontos 
	nTotalDescontos := nIR + nINSS

	//calculando salário liquido
	nSalarioLiquido := nSalarioBruto - nTotalDescontos

	cExibe += 'Salário Bruto ' + '(' +cValToChar(nValorHora) + ' * ' + cValToChar(nQtdHoras) + ').............................:R$' + cValToChar(nSalarioBruto) + CRLF
	cExibe += '(-) IR (' + cIR + ')........................................................: R$' + CVALTOCHAR(nIR) + CRLF
	cExibe += '(-) INSS (10%)...............................................: R$' +  CVALTOCHAR(nINSS) + CRLF
	cExibe += 'FGTS (11%)....................................................: R$' + CVALTOCHAR(nFGTS) + CRLF
	cExibe += 'Total Descontos.............................................: R$' + cValToChar(nTotalDescontos) + CRLF
	cExibe += '=================================================================' + CRLF
	cExibe += 'Salário Liquido..................................................: R$' + cValToChar(nSalarioLiquido)

	FwAlertSuccess(cExibe, 'Folha de Pagamento')





Return
