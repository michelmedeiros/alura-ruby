def boas_vindas 
    puts "Hello World"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "Começaremos o jogo para você, #{nome}" 
    puts "\n\n\n"
end

def sorteio_numero_secreto
    puts "Aguarde, escolhendo um número secreto entre 0 e 200"
    sorteado = 175
    puts "\n\n\n"
    sorteado
end

def limite_de_tentativas
    puts "Escolhido! Que tal adivinhar nosso número secreto?"
    puts "Escolha quantas tentativas deseja ter?"
    chute = gets.strip
end

def pede_um_numero(tentativa, limiteTentativa, ultimos_escolhidos)
    puts "\n\n\n"
    puts "Tentativa #{tentativa} de #{limiteTentativa}"
    puts "Números já escolhidos #{ultimos_escolhidos}"
    chute = gets.strip
    puts "\n\n\n"
    puts "Será que acertou? Seu chute foi... " + chute
    chute.to_i
end

def verifica_se_acertou(chute, tentativa, numero_secreto)
    acertou = numero_secreto == chute
    maior = chute > numero_secreto
    if acertou 
        puts "Parabéns, você acertou na tentativa: #{tentativa}"
        return true
    end 
    puts "Errou!"
    if maior
        puts "Seu chute #{chute} é maior que o valor esperado..."
    else
        puts "Seu chute #{chute} é menor que o valor esperado..."
    end
    false
end

def adivinhe_o_numero(limiteTentativa, numero_secreto)
    
    ultimos_escolhidos = []

    for tentativa in 1..limiteTentativa.to_i
        chute = pede_um_numero(tentativa, limiteTentativa, ultimos_escolhidos)
        ultimos_escolhidos << chute
        break if verifica_se_acertou(chute, tentativa, numero_secreto)
    end

end

boas_vindas
adivinhe_o_numero(limite_de_tentativas, sorteio_numero_secreto)
