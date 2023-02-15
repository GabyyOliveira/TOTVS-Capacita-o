#INCLUDE 'TOTVS.CH'

User Function OrdemCrescente()
    Local nNum := '' 
    Local nArray := {}
    Local nExistente := ''
    Local aux := 0
    Local nAux := 0


    while len(nArray) < 3 
      nNum := FwInputBox('Digite um valor númerico ', nNum )

      if nNum $ nExistente 
        MsgAlert('Valor já existente no array, digite novamente outro valor')
        loop 
      else 
        nExistente := nNum 
        nAux := val(nExistente)
        aAdd(nArray, nAux)
      endif 
    enddo 


    if nArray[1] > nArray[3] 
        aux = nArray[1]
        nArray[1] = nArray[3]
        nArray[3] = aux 
    endif 

    if nArray[1] > nArray[2]
        aux = nArray[1]
        nArray[1] = nArray[2]
        nArray[2] = aux 
    endif 

    if nArray[2] > nArray[3]
        aux = nArray[2]
        nArray[2] = nArray[3]
        nArray[3] = aux 
    endif 

    FwAlertSuccess('Exibindo os números em ordem crescente:.... ' + cValToChar(nArray[1]) + ", " + cValToChar(nArray[2]) + ", " + cValToChar(nArray[3]), 'Valores em ordem crescente' )
    
Return 
